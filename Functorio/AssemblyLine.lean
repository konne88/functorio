import Functorio.Entity
import Functorio.Factory
import Functorio.Crop
import Functorio.Recipe
import Functorio.Row
import Functorio.Bus
import Functorio.Cap
import Functorio.Fraction
import Functorio.Util
import Functorio.Config
import Functorio.AssemblyStation

-- Item's per minute
@[simp]
def inputThroughput (process:Process) (stations:Fraction) (items:Fraction) : Fraction :=
  stations * items * process.fabricator.speedup * 60 / process.getRecipe.time

@[simp]
def outputThroughput (process:Process) (stations:Fraction) (ingredient:Ingredient) (items:Fraction) : Fraction :=
  let t := stations * items * process.fabricator.speedup * (1 + process.fabricator.productivity) * 60 / process.getRecipe.time
  if ingredient.isLiquid then t else min expressBeltThroughput t

def expressBeltHalfThroughput := expressBeltThroughput / 2

def findGap (offsets : Array Nat) (minGap:Nat) := Id.run do
  let mut leftBound := 0
  for offset in offsets do
    let gap := offset - leftBound
    if gap >= minGap then
      return (leftBound, gap)
    leftBound := offset + 1

  error! s!"Couldn't find a gap of {minGap}"

def bigPoleInsert [config:Config] {interface} (offsets : Vector InterfaceImpl interface.length) : Factory interface [] interface [] :=
  if !config.generateBigPoles then emptyFactoryH offsets else

  let factory := (emptyFactoryH offsets).expand .S 2
  let (gapStart, gapWidth) := (findGap offsets.toArray 2)

  {
    factory with
    entities := factory.entities ++ [bigPole (gapStart + (gapWidth - 2) / 2) 0]
  }

def roboportInsert [config:Config] {interface} (offsets : Vector InterfaceImpl interface.length) : Factory interface [] interface [] :=
  if !config.generateRoboports then emptyFactoryH offsets else

  let factory := (emptyFactoryH offsets).expand .S 4
    let (gapStart, gapWidth) := (findGap offsets.toArray 2)

  {
    factory with
    entities :=
      factory.entities ++
      [roboport (gapStart + (gapWidth - 4) / 2) 0] ++
      if gapWidth > 4 then [pole (gapStart + gapWidth - 1) 3] else []
  }

@[simp]
def recipe (recipe:RecipeName) (returnedInputs : List (Fraction × Ingredient) := []) : Process := {
  recipe := recipe,
  fabricator := defaultCategoryFabricator recipe.getRecipe.category,
  returnedInputs := returnedInputs
}

def providerChestInsert [config:Config] {interface} (process:Process) (offsets : Vector InterfaceImpl interface.length) : Factory interface [] interface [] :=
  let recipe := process.getRecipe
  if config.providerChestCapacity == 0 || recipe.outputs.isEmpty || recipe.outputs[0]!.snd.isLiquid then emptyFactoryH offsets else

  let outputOffset :=
    (offsets.zipIdx.filter fun (_, i) => interface[i]!.snd == .S)[0]!.fst

  let chest := [
    passiveProviderChest (outputOffset - 2) 1 (capacity:=config.providerChestCapacity),
    inserter (outputOffset - 1) 1 .E
  ]

  let factory := (emptyFactoryH offsets).expand .S 3
  {
    factory with
    entities := (eraseRectangle (outputOffset - 1) 0 1 3 factory.entities) ++ chest ++
      if ((recipe.inputs ++ recipe.outputs).filter (fun input => !input.snd.isLiquid)).length <= 2 then [pole (outputOffset - 3) 1]
      else [pole (outputOffset - 4) 1,
            beltUp (outputOffset - 1) 0 .N,
            beltDown (outputOffset - 1) 2 .N]
  }

def outputBalancerInsert {interface} (offsets : Vector InterfaceImpl interface.length) : Factory interface [] interface [] :=
  let factory := (emptyFactoryH offsets).expand .S 4

  let (x,_) := findGap offsets.toArray 5
  let balancer : List Entity := [
    belt (x+2) 0 .S,
    belt (x+3) 0 .W,
    splitter (x+4) 0 .W (outputPriority := "right"),

    belt x 1 .S,
    belt (x+1) 1 .W,
    belt (x+2) 1 .W,
    belt (x+3) 1 .S,

    belt x 2 .S,
    belt (x+2) 2 .N,
    belt (x+3) 2 .W,
    belt (x+4) 2 .E,

    belt x 3 .E,
    beltDown (x+1) 3 .E,
    pole (x+2) 3,
    beltUp (x+3) 3 .E,
    belt (x+4) 3 .N,
  ]

  let outputOffset :=
    (offsets.zipIdx.filter fun (_, i) => interface[i]!.snd == .S)[0]!.fst

  let adapter :=
    let x := outputOffset
    [belt x 0 .S, belt x 1 .W, belt x 2 .S, belt x 3 .S]

  let avoider :=
    let x := outputOffset - 1
    [beltUp x 0 .N, belt x 1 .W, belt x 2 .E, beltDown x 3 .N]

  let connector :=
    match outputOffset - x with
    | 5 => adapter
    | 6 => adapter ++ avoider
    | _ => error! s!"Couldn't generate outputBalancerInsert for {reprStr interface}, x:= {x}, outputOffset := {outputOffset}"

  {
    factory with
    entities := (eraseRectangle (outputOffset - 1) 0 2 4 factory.entities) ++
                balancer ++ connector
  }

def maxRoboportLogisticsDistance := 46

def assemblyLineNoReturnedInputs [Config] (process:Process) (stations:Nat) : Factory (stationInterface process) [] (stationInterface process) [] :=
  Id.run do
    let output := process.getRecipe.outputs[0]!
    let stationOutput := inputThroughput process 1 output.fst
    let station := station process
    let mut factories : Array (Factory (stationInterface process) [] (stationInterface process) []) := #[
      bigPoleInsert station.interface.s,
      providerChestInsert process station.interface.s,
      roboportInsert station.interface.s
    ]
    let mut outputSinceBalance : Fraction := 0
    let mut distanceFromRoboport : Nat := 0

    for _ in List.range stations do
      if !output.snd.isLiquid && outputSinceBalance + stationOutput > expressBeltHalfThroughput && outputSinceBalance != 0 then
        factories := factories.push (outputBalancerInsert station.interface.s)
        outputSinceBalance := 0
        distanceFromRoboport := distanceFromRoboport + 4

      if distanceFromRoboport + station.height > maxRoboportLogisticsDistance then
        factories := factories.push (roboportInsert station.interface.s)
        distanceFromRoboport := 0

      factories := factories.push station
      outputSinceBalance := outputSinceBalance + stationOutput
      distanceFromRoboport := distanceFromRoboport + station.height

    columnList factories.toList.reverse

def assemblyLineInterface (process:Process) : List InterfaceV :=
  process.inputIngredients.map (., .N) ++
  process.outputIngredients.map (., .S) ++
  process.returnedInputs.map fun (_,ingredient) => (ingredient, .S)

namespace List

def lastIdxOf {A} [BEq A] (l:List A) (a:A) : Nat := Id.run do
  let mut index := l.length
  for (a', i) in l.zipIdx do
    if a == a' then
      index := i
  return index

end List

def filterInterfaceN {n e s w} (factory:Factory n e s w) (n':List InterfaceV) : Factory n' e s w :=
  {
    factory with
    interface := {
      n := n'.toVector.map fun interface => factory.interface.n[n.lastIdxOf interface]!
      e := factory.interface.e
      s := factory.interface.s
      w := factory.interface.w
    }
  }

def connectorInterface (process:Process) : List InterfaceV :=
  (process.returnedInputs.reverse.map fun (_,ingredient) => (ingredient, .N)) ++
  (process.returnedInputs.map fun (_,ingredient) => (ingredient, .S))

def returnedInputsConnector (process:Process) : Factory [] [] (connectorInterface process)  [] :=
  let n := process.returnedInputs.length
  let leftEntities : List Entity :=
    (List.range n).flatMap fun x =>
      (List.range n).map fun y =>
        belt x y (if x < y then .N else .E)

  let rightEntities : List Entity  :=
    (List.range n).flatMap fun x =>
      (List.range n).map fun y =>
        belt (x+n) y (if (n-x-1) <= y then .S else .E)

  {
    entities := leftEntities ++ rightEntities
    interface := {
      n := #v[]
      e := #v[]
      s := Vector.range (connectorInterface process).length
      w := #v[]
    }
    width := 2*n
    height := n
    wires := []
    name := s!"returnedInputsConnector {reprStr process.returnedInputs}"
  }

def connectReturnedInputs (process:Process) (factory:Factory (assemblyLineInterface process) [] (assemblyLineInterface process) []) :Factory [] [] (assemblyLineInterface process) [] :=
  if process.returnedInputs.isEmpty then capN factory else
  let filteredFactory := (filterInterfaceN factory (connectorInterface process)).expand .N 1
  column (returnedInputsConnector process) filteredFactory

def assemblyLine [Config] (process:Process) (stations:Nat) : Factory [] [] (assemblyLineInterface process) [] :=
  let line := assemblyLineNoReturnedInputs process stations
  let returns := emptyFactoryH
  let factory := row line returns
  connectReturnedInputs process factory

def tupleType {T} (ts:List T) (type:T->Type) : Type :=
  match ts with
  | [] => Unit
  | [t] => type t
  | t::types => type t × tupleType types type

def tuple {T} {ts:List T} {type:T->Type} (value : (t:T) -> Nat -> type t) (index:=0) : tupleType ts type :=
  match ts with
  | [] => ()
  | [t] => value t index
  | t::_::_ => (value t index, tuple value (index + 1))

@[simp]
def BusAssemblyLineReturn (process:Process) (stations:Fraction) : Type :=
  let outputs := (process.getRecipe.outputs.map fun (items, ingredient) => (outputThroughput process stations ingredient items, ingredient)) ++ process.returnedInputs
  Bus (tupleType outputs fun (throughput, ingredient) => BusLane ingredient throughput)

@[simp]
def BusAssemblyLineType (process:Process) (stations:Fraction) (remainingInputs: List (Fraction × Ingredient) := process.getRecipe.inputs): Type :=
  match remainingInputs with
  | [] => BusAssemblyLineReturn process stations
  | (items,ingredient)::inputs =>
    let throughput :=
      inputThroughput process stations items +
      List.sum (process.returnedInputs.map fun (throughput, ingredient') => if ingredient' == ingredient then throughput else 0)
    BusLane ingredient throughput -> BusAssemblyLineType process stations inputs

def processBusAssemblyLineArguments
  (process:Process)
  (stations:Fraction)
  (processor: List BusLane' -> BusAssemblyLineReturn process stations)
  (remainingInputs: List (Fraction × Ingredient) := process.getRecipe.inputs)
  (args: List BusLane' := [])
: BusAssemblyLineType process stations remainingInputs := by
  revert args
  refine (match remainingInputs with
  | [] => processor
  | _::inputs => fun args arg =>
    processBusAssemblyLineArguments process stations processor inputs (args ++ [arg.toBusLane'])
  )

def busAssemblyLine [config:Config] (process: Process) (stations:Fraction) : BusAssemblyLineType process stations :=
  processBusAssemblyLineArguments process stations fun inputs => do
    let factory := assemblyLine process (stations.roundUp + config.extraStations)
    let namedFactory := factory.setName s!"{stations}x{reprStr process.recipe}"
    let indexes <- busTapGeneric
      inputs
      ((process.getRecipe.outputs ++ process.returnedInputs).map Prod.snd)
      (unsafeFactoryCast namedFactory)
      (adapterMinHeight := config.adapterMinHeight)
    return tuple (fun (_, _) i => {index:=indexes[i]!})
