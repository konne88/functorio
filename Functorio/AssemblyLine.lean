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

def providerChestInsert [config:Config] {interface} (process:Process) (offsets : Vector InterfaceImpl interface.length) : Factory interface [] interface [] :=
  let recipe := process.getRecipe
  if config.providerChestCapacity == 0 || recipe.outputs.isEmpty || recipe.outputs[0]!.snd.isLiquid then emptyFactoryH offsets else

  let outputOffset := offsets[interface.length-1]!

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

  let outputOffset := offsets[interface.length-1]!

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

def assemblyLine [Config] (process:Process) (stations:Nat) : Factory [] [] (stationInterface process) [] :=
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

    capN (columnList factories.toList.reverse)

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
  Bus (tupleType process.getRecipe.outputs fun (items, ingredient) => BusLane ingredient (outputThroughput process stations ingredient items))

@[simp]
def BusAssemblyLineType (process:Process) (stations:Fraction) (remainingInputs: List (Fraction × Ingredient) := process.getRecipe.inputs): Type :=
  match remainingInputs with
  | [] => BusAssemblyLineReturn process stations
  | (items,ingredient)::inputs => BusLane ingredient (inputThroughput process stations items) -> BusAssemblyLineType process stations inputs

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
    let factory := assemblyLine process stations.roundUp
    let namedFactory := factory.setName s!"{stations}x{reprStr process.recipe}"
    let indexes <- busTapGeneric
      inputs
      (process.getRecipe.outputs.map Prod.snd)
      (unsafeFactoryCast namedFactory)
      (adapterMinHeight := config.adapterMinHeight)
    return tuple (fun (_, _) i => {index:=indexes[i]!})
