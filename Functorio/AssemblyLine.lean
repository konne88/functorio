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

def spoilableInterface (process:Process) : List InterfaceV :=
  process.solidInputs.flatMap fun ingredient => if ingredient.spoilResult.isNone then [] else [(ingredient,.N)]

def capNonSpoilables (process:Process) (offsets:Vector Nat (stationInterface process).length) : Factory (spoilableInterface process) [] (stationInterface process) [] :=
  let width := offsets[offsets.size - 1]!
  let newOffsets := process.inputIngredients.zipIdx.flatMap fun (ingredient, i) =>
    if ingredient.spoilResult.isSome then [offsets[i]!] else []

  {
    width := width,
    height := 0
    wires := []
    entities := [],
    interface := {
      n := newOffsets.castToVector!
      e := #v[]
      s := offsets
      w := #v[]
    }
    name := "capNonSpoilables"
  }

def destroySpoilage (process:Process) : Factory [] [] (spoilableInterface process) [] :=
  match spoilableInterface process with
  | [] => emptyFactoryV
  | spoilables =>
    {
      width:= 4
      height:= 4
      wires := []
      interface := {
        n := #v[]
        e := #v[]
        s := Vector.range spoilables.length
        w := #v[]
      }
      name := "destroySpoilage"
      entities :=
        [ heatingTower 0 0, pole 3 3 ] ++
        spoilables.mapIdx fun x (ingredient,_) => inserter x 3 .S [ingredient]
    }

def destroySpoilage' (process:Process) : Factory [] [] (spoilableInterface process) [] :=
  match spoilableInterface process with
  | [] => emptyFactoryV
  | spoilables =>
    {
      width:= 10
      height:= 4
      wires := []
      interface := {
        n := #v[]
        e := #v[]
        s := Vector.range spoilables.length
        w := #v[]
      }
      name := "destroySpoilage'"
      entities :=
        [
          recyler 0 0 .E,
          ironChest 4 0,
          inserter 5 0 .W,
          ironChest 5 1,
          inserter 4 1 .E,
          recyler 6 0 .W,
          pole 3 2
        ] ++
        spoilables.zipIdx.flatMap fun ((ingredient,_), x) => [
          inserter x 2 .S (if ingredient == .yumako || ingredient == .jellynut || ingredient == .bioflux then ingredient.spoilResult.toList else []),
          belt x 3 .N
        ]
    }


def rateLimitInputsInsert [config:Config] (process:Process) (stations:Nat) (offsets:Vector Nat (stationInterface process).length)
: Factory (stationInterface process) [] (stationInterface process) [] := Id.run do
  if !config.generateInputRateLimiters then return emptyFactoryH offsets

  let signal : Signal := {type:="virtual", name:="signal-T"}
  let height := 6
  let interfaces := stationInterface process

  let mut entities : Array Entity := #[]
  let mut wires : Array Wire := #[]

  for ((ingredient, dir), i) in interfaces.zipIdx do
    let x := offsets[i]!

    if ingredient.isLiquid then
      entities := entities.append ((Array.range height).map fun y => pipe x y)
    else if dir == .S then
      entities := entities.append ((Array.range height).map fun y => belt x y .S)
    else
      -- For green belts, items on each side move at 1 items/ 2 ticks
      -- There are 60 ticks per second, 3600 ticks per minute
      -- A blue belt thus moves 1800 items / min per belt side (3600 for the full belt)

      -- If my factory needs an item every X ticks, then I should leave the belt
      -- on for 2 ticks, and then wait X ticks (assuming just one side carries items).
      -- If both sides carry items, I should leave the belt on for 2 ticks (releasing 2 nutrients),
      -- and then wait for 2X ticks.

      -- e.g. a biochamber needs 1 nutrient every 240 ticks, so I would
      -- send nutrients 2 for 2 ticks, and then wait for 480 ticks.

      -- The requires number of items is given in items/minute, to get
      -- ticks per item, I need to do:

      -- Y items/minute <-> Y/3600 items/tick <-> (3600/Y) ticks/item

      -- e.g. if I have 15 nutrients/minute <-> 15/3600 nutrients / tick <-> 240 ticks / nutrient

      -- Blue belts are 3/4 the speed of green belts
      -- So items on each side move at 3 items/8 ticks
      -- A blue belt thus moves 1350 items / min per belt side (2700 for the full belt)

      -- I can only ever release 3 items per side of the belt at a time (or 6 for the full belt).
      -- So once I calculcated Z ticks/item, I can release 6 items by waiting 8 ticks, and
      -- then wait 6*Z ticks.




      -- My factory needs a certain fraction of items every tick,


      -- If my factory needs X items / minute
      -- That's X/2 items per belt side.
      -- The belt needs to move items x / 2700 of the time.
      -- e.g. if my input is 60 nutrients/minute, that's


      -- For green belts, items on each side move at 1 items/ 2 ticks
      -- Blue belts are 3/4 the speed of green belts
      -- So items on each side move at 3 items/8 ticks
      -- There are 60 ticks per second, 3600 ticks per minute
      -- A blue belt thus moves 1350 items / min per belt side (2700 for the full belt)
      -- If my factory needs X items / minute
      -- That's X/2 items per belt side.
      -- The belt needs to move items x / 2700 of the time.
      -- e.g. if my input is 60 nutrients/minute, that's






      let input := process.getRecipe.inputs[i]!
      let throughput := inputThroughput process stations input.fst

      let itemsPerMinute := throughput
      let itemsPerTick := itemsPerMinute / 3600
      let ticksPerItem := 1 / itemsPerTick


      -- Fraction of slots that should be open
      -- let slotFraction := throughput / expressBeltThroughput

      -- -- This is how often we'll can open the belt. Each slot lasts 8 ticks, and lets 6 items through.
      -- let slots : Nat := 30

      -- let openSlots : Nat := (slotFraction * slots).roundUp

      let i := entities.size
      wires := wires.append #[
        {src:=i + 2, srcType:=.redInput,    dst:=i + 2, dstType:=.redOutput},
        {src:=i + 2, srcType:=.greenOutput, dst:=i + 4, dstType:=.greenInput}
      ]
      entities := entities.append #[
        beltUp x 0 .N,
        pole x 1,
        deciderCombinator x 2 .S [
          -- The combinator counts from 0 (inclusive) until constantValue (inclusive).
          -- {firstSignal:=signal, constantValue:=slots * 8 - 1, comparator:="<"}
          {firstSignal:=signal, secondSignal:=.none, constantValue:=((ticksPerItem * 8) - 1).roundUp, comparator:="<"} -- TODO: should be round down
        ] [
          {signal:=signal, copyCountFromInput:=false},
          {signal:=signal, copyCountFromInput:=true}
        ],
        beltDown x 4 .N,
        belt x 5 dir {
          -- The belt will be active from 0 (inclusive) until constantValue (exclusive)
          -- circuitCondition:= .some {firstSignal:=signal, constantValue:=openSlots * 8, comparator:="<"}
          circuitCondition:= .some {firstSignal:=signal, secondSignal:=.none, constantValue:=.some 8, comparator:="<"}
          circuitReadHandContents := false
          circuitContentsReadMode := 0
        }
      ]

  {
    height := height
    width := offsets[offsets.size-1]!
    entities := entities.toList
    wires := wires.toList
    interface := {
      n := offsets
      e := #v[]
      s := offsets
      w := #v[]
    }
    name := "rateLimitInputs"
  }

def maxRoboportLogisticsDistance := 46

def assemblyLineNoReturnedInputs [Config] (process:Process) (stations:Nat) : Factory (stationInterface process) [] (stationInterface process) [] :=
  Id.run do
    let output := process.getRecipe.outputs[0]!
    let stationOutput := inputThroughput process 1 output.fst
    let station := station process
    let mut factories : Array (Factory (stationInterface process) [] (stationInterface process) []) := #[
      rateLimitInputsInsert process stations station.interface.s,
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

--    column3 (destroySpoilage' process) (capNonSpoilables process station.interface.n) (columnList factories.toList.reverse)

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




  -- bus do
  --   let lanes <- busTapGeneric [] returnedInputs emptyFactoryH
  --   return _

     -- emptyFactor

      -- inputs
      -- ((process.getRecipe.outputs ++ process.returnedInputs).map Prod.snd)
      -- (unsafeFactoryCast namedFactory)
      -- (adapterMinHeight := config.adapterMinHeight)


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
