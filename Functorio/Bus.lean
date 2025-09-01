import Functorio.Entity
import Functorio.Factory
import Functorio.Column
import Functorio.Row
import Functorio.Fraction
import Functorio.Util

structure LaneConfig where
  ingredient: Ingredient
  refCount : Nat
  deriving Inhabited, Repr

def depletedLane : LaneConfig := {
  ingredient := default, refCount := 0
}

namespace LaneConfig

def depleted (l:LaneConfig) : Bool :=
  l.refCount == 0

end LaneConfig

abbrev LaneConfigs := List LaneConfig

namespace LaneConfigs

def height (lanes:LaneConfigs) : Nat :=
  lanes.length

def useLane (index:Nat) (lanes:LaneConfigs) : LaneConfigs :=
  lanes.modify index fun lane =>
    if lane.refCount == 0 then error! s!"Accessing depleted lane {index}" else
    {
      refCount := lane.refCount - 1
      ingredient := if lane.refCount <= 1 then default else lane.ingredient
    }

def allocLane (ingredient:Ingredient) (lanes:LaneConfigs) : (Nat × LaneConfigs) := Id.run do
  let newLane := {ingredient := ingredient, refCount := 1}

  for (lane, i) in lanes.zipIdx do
    if i == 0 then continue   -- Don't alloc the 0th lane, we need the space for exits

    if lane.depleted then
      if ingredient.isLiquid then
        -- Don't alloc if the previous or next lane is already a pipe
        if i > 1 && lanes[i - 1]!.ingredient.isLiquid then continue
        if i < lanes.length - 1 && lanes[i + 1]!.ingredient.isLiquid then continue

      return (i, lanes.set i newLane)

  -- Couldn't find a depleted lane, so we need to alloc a new one
  if lanes.length > 0 && lanes[lanes.length - 1]!.ingredient.isLiquid then
    let paddingLane := {ingredient := default, refCount := 0}
    (lanes.length + 1, lanes ++ [paddingLane, newLane])
  else
    (lanes.length, lanes ++ [newLane])

def available (lanes:LaneConfigs): List (LaneConfig × Nat) :=
  lanes.zipIdx.filter fun (lane, _) => !lane.depleted

end LaneConfigs

abbrev Throughput := Fraction -- items per minute

structure BusLane (_ : Ingredient) (throughput:Throughput) where
  index: Nat
  deriving Inhabited, Repr

structure BusLane' where
  ingredient:Ingredient
  throughput:Throughput
  index: Nat
  deriving Inhabited, Repr

namespace BusLane

def less {i m n} (l:BusLane i m) (_: n≤m := by decide) : BusLane i n :=
  {index := l.index}

-- TODO: why is this needed?
def exact {i n m} (l:BusLane i m) (_: n=m := by decide): BusLane i n :=
  {index := l.index}

def toBusLane' {i n} (l:BusLane i n) : BusLane' :=
  {ingredient := i, throughput := n, index := l.index }

end BusLane

instance {i n} : CoeOut (BusLane i n) BusLane' where
  coe l := l.toBusLane'

@[simp]
def busInterface (lanes:LaneConfigs) : List InterfaceH :=
  lanes.available.map fun (lane, _) => (lane.ingredient, .E)

def busInterfaceImpl (lanes:LaneConfigs) : Vector InterfaceImpl (busInterface lanes).length :=
  cast (by simp) (lanes.available.toVector.map Prod.snd)

structure BusState where
  input: LaneConfigs
  output: LaneConfigs
  factory : Factory [] (busInterface output) [] (busInterface input)
  deriving Inhabited, Repr

private def emptyBusState : BusState := {
  input := [depletedLane]
  output := [depletedLane]
  factory := emptyFactoryV.setName "emptyBus"
}

abbrev Bus T := StateM BusState T

private abbrev BusFactory (bus:Bus Unit) : Type :=
  Factory [] (busInterface (bus.run emptyBusState).snd.output) [] (busInterface (bus emptyBusState).snd.input)

def bus (b:Bus Unit) : BusFactory b :=
  (b emptyBusState).snd.factory

def input (ingredient:Ingredient) (throughput:Fraction) : Bus (BusLane ingredient throughput) :=
  fun state =>
    if (state.factory.width != 0) then error! s!"input must be called at beginning; here bus is already {state.factory.width} tiles wide" else
      let (index, newConfig) := state.output.allocLane ingredient
      ({index:=index}, {
      input := newConfig
      output := newConfig
      factory := (emptyFactoryV (busInterfaceImpl newConfig))
    })

def inputs (n:Nat) (ingredient:Ingredient) (throughput:Fraction) : Bus (Vector (BusLane ingredient throughput) n) := do
  let mut lanes : Array (BusLane ingredient throughput) := #[]
  for _ in List.range n do
    let lane <- input ingredient throughput
    lanes := lanes.push lane
  return lanes.toList.castToVector!

inductive Cell where
| entity (type:EntityType)
| blocked    -- blocked by another entity that's larger than 1 cell
| empty
deriving Repr, DecidableEq, Inhabited

private inductive AccessType
| put
| get
deriving Inhabited, DecidableEq, Repr

abbrev Matrix w h := Vector (Vector Cell h) w

namespace Matrix

def modifyCell {w h} (matrix:Matrix w h) (x y : Nat) (cell:Cell -> Cell) : Matrix w h :=
  matrix.modify x fun column => column.modify y cell

def setCell {w h} (matrix:Matrix w h) (x y : Nat) (cell:Cell) : Matrix w h :=
  modifyCell matrix x y fun _ => cell

def canApplyEntities {w h} (matrix:Matrix w h) (entities:Option (List Entity)) : Bool :=
  match entities with
  | .none => false | .some entities =>
    entities.all fun e =>
      if e.x >= w then error! s!"Bus is wider than the maximum supported {e.x}" else
      if e.y >= h then error! s!"Bus is taller than the maximum supported {e.y}" else

      match matrix[e.x]![e.y]!, e.type with
      -- Belt/pipe down followed by up cancels out to just a straight belt/pipe, so overriding is fine.
      | .entity (.beltDown .E), .beltUp .E => true
      | .entity (.pipeToGround .W), .pipeToGround .E => true
      -- For splitters, the box below also has to be free.
      | .empty, .splitter .E .none =>
        matrix[e.x]![e.y + 1]! == .empty
      | .empty, _ => true
      | _,_ => false

def applyEntities {w h} (matrix:Matrix w h) (entities:Option (List Entity)) : Matrix w h := Id.run do
  match entities with
  | .none => error! s!"Trying to apply invalid entities {reprStr entities}"
  | .some entities =>

    let mut matrix := matrix

    for e in entities do
      if e.type ==  .splitter .E .none then
        matrix := matrix.setCell e.x e.y (.entity e.type)
        matrix := matrix.setCell e.x (e.y + 1) .blocked
      else
        matrix := matrix.modifyCell e.x e.y fun cell =>
          match cell, e.type with
          -- Belt/pipe down followed by up cancels out to just a straight belt/pipe.
          | .entity (.beltDown .E), .beltUp .E => .entity (.belt .E)
          | .entity (.pipeToGround .W), .pipeToGround .E => .entity .pipe
          | .empty,_ => .entity e.type
          | _,_ => error! s!"Trying to override entity {reprStr cell} with {reprStr e}"

    return matrix

def toEntities {w h} (matrix : Matrix w h) : List Entity := Id.run do
  let mut entities : Array Entity := #[]

  for (column, x) in matrix.zipIdx do
    for (cell, y) in column.zipIdx do
      match cell with
      | .entity type =>
        entities := entities.push {x:=x, y:=y, type:=type}
      | _ =>
        pure ()

  return entities.toList

def reduceUndergroundEntities {w h} (matrix:Matrix w h) : Matrix w h := Id.run do
  let mut matrix := matrix
  let width := w
  let height := h

  -- Go through all the columns
  for x in List.range matrix.size do
    let mut isUndergroundPipe := false
    let mut isUndergroundBelt := false

    for y in List.range height do
      if y + 1 >= height then continue

      let cell := matrix[x]![y]!
      let nextCell := matrix[x]![y+1]!

      -- Simplify bus belt gets
      if cell == .entity (.beltUp .N) && nextCell == .empty then
        matrix := matrix.setCell x y (.entity (.belt .N))
        matrix := matrix.setCell x (y+1) (.entity (.beltUp .N))

      if cell == .entity (.beltUp .N) && nextCell == .entity (.beltDown .N) then
        matrix := matrix.setCell x y (.entity (.belt .N))
        matrix := matrix.setCell x (y+1) (.entity (.belt .N))

      if isUndergroundBelt && cell == .empty && nextCell == .empty then
        matrix := matrix.setCell x y (.entity (.beltDown .N))
        matrix := matrix.setCell x (y+1) (.entity (.beltUp .N))

      if isUndergroundBelt && cell == .empty && nextCell == .entity (.beltDown .N)  then
        matrix := matrix.setCell x y (.entity (.beltDown .N))
        matrix := matrix.setCell x (y+1) (.entity (.belt .N))

      -- Simplify bus belt puts
      if cell == .entity (.beltDown .S) && nextCell == .empty then
        matrix := matrix.setCell x y (.entity (.belt .S))
        matrix := matrix.setCell x (y+1) (.entity (.beltDown .S))

      if cell == .entity (.beltDown .S) && nextCell == .entity (.beltUp .S) then
        matrix := matrix.setCell x y (.entity (.belt .S))
        matrix := matrix.setCell x (y+1) (.entity (.belt .S))

      -- Simplify pipe put/get
      if cell == .entity (.pipeToGround .N) && nextCell == .empty then
        matrix := matrix.setCell x y (.entity .pipe)
        matrix := matrix.setCell x (y+1) (.entity (.pipeToGround .N))

      if cell == .entity (.pipeToGround .N) && nextCell == .entity (.pipeToGround .S) then
        matrix := matrix.setCell x y (.entity .pipe)
        matrix := matrix.setCell x (y+1) (.entity .pipe)

      if isUndergroundPipe && cell == .empty && nextCell == .empty then
        matrix := matrix.setCell x y (.entity (.pipeToGround .S))
        matrix := matrix.setCell x (y+1) (.entity (.pipeToGround .N))

      if isUndergroundPipe && cell == .empty && nextCell == .entity (.pipeToGround .S) then
        matrix := matrix.setCell x y (.entity (.pipeToGround .S))
        matrix := matrix.setCell x (y+1) (.entity .pipe)

      -- Determine whether we are underground
      let cell := matrix[x]![y]!
      if cell == .entity (.beltUp .N) then isUndergroundBelt := true  -- yes, beltUp means y + 1 is underground
      if cell == .entity (.beltDown .N) then isUndergroundBelt := false
      if cell == .entity (.pipeToGround .N) then isUndergroundPipe := true
      if cell == .entity (.pipeToGround .S) then isUndergroundPipe := false

  -- Go through all the rows
  for y in List.range height do
    let mut isUndergroundPipe := false
    let mut isUndergroundBelt := false

    for x in List.range width do
      if x + 1 >= width then continue

      let cell := matrix[x]![y]!
      let nextCell := matrix[x+1]![y]!

      -- Simplify belt lanes
      if cell == .entity (.beltDown .E) && nextCell == .empty then
        matrix := matrix.setCell x y (.entity (.belt .E))
        matrix := matrix.setCell (x+1) y (.entity (.beltDown .E))

      if cell == .entity (.beltDown .E) && nextCell == .entity (.beltUp .E) then
        matrix := matrix.setCell x y (.entity (.belt .E))
        matrix := matrix.setCell (x+1) y (.entity (.belt .E))

      if isUndergroundBelt && cell == .empty && nextCell == .empty then
        matrix := matrix.setCell x y (.entity (.beltUp .E))
        matrix := matrix.setCell (x+1) y (.entity (.beltDown .E))

      if isUndergroundBelt && cell == .empty && nextCell == .entity (.beltUp .E)  then
        matrix := matrix.setCell x y (.entity (.beltUp .E))
        matrix := matrix.setCell (x+1) y (.entity (.belt .E))

      -- Simplify pipe lanes
      if cell == .entity (.pipeToGround .W) && nextCell == .empty then
        matrix := matrix.setCell x y (.entity (.pipe))
        matrix := matrix.setCell (x+1) y (.entity (.pipeToGround .W))

      if cell == .entity (.pipeToGround .W) && nextCell == .entity (.pipeToGround .E) then
        matrix := matrix.setCell x y (.entity .pipe)
        matrix := matrix.setCell (x+1) y (.entity .pipe)

      if isUndergroundPipe && cell == .empty && nextCell == .empty then
        matrix := matrix.setCell x y (.entity (.pipeToGround .E))
        matrix := matrix.setCell (x+1) y (.entity (.pipeToGround .W))

      if isUndergroundPipe && cell == .empty && nextCell == .entity (.pipeToGround .E) then
        matrix := matrix.setCell x y (.entity (.pipeToGround .E))
        matrix := matrix.setCell (x+1) y (.entity .pipe)

      -- Determine whether we are underground
      let cell := matrix[x]![y]!
      if cell == .entity (.beltDown .E) then isUndergroundBelt := true
      if cell == .entity (.beltUp .E) then isUndergroundBelt := false
      if cell == .entity (.pipeToGround .W) then isUndergroundPipe := true
      if cell == .entity (.pipeToGround .E) then isUndergroundPipe := false

  return matrix

end Matrix

def busTapInterface (inputs: List BusLane') (outputIngredients: List Ingredient) : List InterfaceV :=
  (inputs.map fun input => (input.ingredient, .N)) ++
  (outputIngredients.map fun output => (output, .S))

def pipeAccess (type:AccessType) (split:Bool) (x y:Nat) : List Entity :=
  let ramp :=
    match y with
    | 0 => error! s!"0th lane should never be accessed {y}"
    | 1 => [pipe x 0]
    | _ => [pipeToGround x 0 .N, pipeToGround x (y-1) .S]

  let lane :=
    match type with
    | .put => [pipe x y, pipeToGround (x+1) y .W]
    | .get =>
      if split then [pipeToGround (x-1) y .E, pipe x y, pipeToGround (x+1) y .W]
      else [pipeToGround (x-1) y .E, pipe x y]

  ramp ++ lane

def beltAccessGetWithSplit (x y:Nat) : Option (List Entity) :=
  -- We don't have enough room to access a belt with a splitter if x < 2
  if x < 2 then .none else

  let ramp :=
    match y with
    | 0 => error! s!"0th lane should never be accessed {y}"
    | 1 => []
    | 2 => [belt x 0 .N]
    | _ => [beltDown x (y-2) .N, beltUp x 0 .N]

  .some (ramp ++ [
    beltUp (x-2) y .E,
    splitter (x-1) (y-1) .E,
    beltDown x y .E,
    belt x (y-1) .N,
  ])

def beltAccessGetWithoutSplit (x y:Nat) : List Entity :=
  let lane :=
    match x with
    | 0 => []
    | _ => [beltUp (x-1) y .E]

  let ramp :=
    match y with
    | 0 => error! s!"0th lane should never be accessed {y}"
    | 1 => [belt x 0 .N]
    | _ => [beltDown x (y-1) .N, beltUp x 0 .N]

  lane ++ [belt x y .N] ++ ramp

def beltAccessPut (x y:Nat) : List Entity :=
  let ramp :=
    match y with
    | 0 => error! s!"0th lane should never be allocated {y}"
    | 1 => [belt x 0 .S]
    | _ => [beltUp x (y-1) .S, beltDown x 0 .S]

  [belt x y .E, beltDown (x+1) y .E] ++ ramp

def laneAccess (type:AccessType) (config:LaneConfigs) (ingredient:Ingredient) (yIndex:Nat) (x:Nat) : Option (List Entity) :=
  let split := config[yIndex]!.refCount > 0

  if ingredient.isLiquid
  then pipeAccess type split x yIndex
  else
    match type with
    | .get =>
      if split
      then beltAccessGetWithSplit x yIndex
      else beltAccessGetWithoutSplit x yIndex
    | .put =>
      beltAccessPut x yIndex

def busTapGeneric
  (inputs:List BusLane')
  (outputs:List Ingredient)
  (factory:Factory [] [] (busTapInterface inputs outputs) [])
  (adapterMinHeight:=0)
: Bus (List Nat) := fun state => Id.run do
  -- Worst case, all outputs are pipes so we add 2 that
  let height := state.output.height + outputs.length * 2
  -- Longer than that, and we'll probably have problems
  -- with underground pipes running out of length anyway.
  let width := 15

  let mut matrix : Matrix width height := Vector.replicate width (Vector.replicate height .empty)
  let mut offsets : Array Nat := #[]
  let mut lanes := state.output
  let mut previousWasLiquid := false
  let mut x := 0

  -- Bring down all lanes
  let entities x :=
    lanes.available.map fun (lane, y) =>
      if lane.ingredient.isLiquid then pipeToGround x y .W else beltDown x y .E
  matrix := matrix.applyEntities (entities x)
  x := x + 1

  -- Handle all inputs
  for input in inputs do
    lanes := lanes.useLane input.index

    if previousWasLiquid && input.ingredient.isLiquid then x := x + 1  -- Gap between pipes so they don't connect.
    let entities x := laneAccess .get lanes input.ingredient input.index x
    while !matrix.canApplyEntities (entities x) do x := x + 1
    matrix := matrix.applyEntities (entities x)

    previousWasLiquid := input.ingredient.isLiquid
    offsets := offsets.push x
    x := x + 1

  -- Handle all outputs
  let mut outputLanes : Array Nat := #[]
  for ingredient in outputs do
    let (index, newLanes) := lanes.allocLane ingredient
    lanes := newLanes

    if previousWasLiquid && ingredient.isLiquid then x := x + 1  -- Gap between pipes so they don't connect.
    let entities x := laneAccess .put lanes ingredient index x
    while !matrix.canApplyEntities (entities x) do x := x + 1
    matrix := matrix.applyEntities (entities x)

    previousWasLiquid := ingredient.isLiquid
    offsets := offsets.push x
    outputLanes := outputLanes.push index
    x := x + 1

  -- Bring down all lanes
  let entities x :=
    lanes.available.map fun (lane, y) =>
      if lane.ingredient.isLiquid then pipeToGround x y .E else beltUp x y .E
  while !matrix.canApplyEntities (entities x) do x := x + 1
  matrix := matrix.applyEntities (entities x)

  let tapFactory : Factory (busTapInterface inputs outputs) (busInterface lanes) [] (busInterface state.output) := {
    width:= x + 1
    height:= max state.output.height lanes.height
    entities := matrix.reduceUndergroundEntities.toEntities
    interface := {
      n := offsets.toList.castToVector!
      e := busInterfaceImpl lanes
      s := #v[]
      w := busInterfaceImpl state.output
    }
    name := "tapBus'"
  }
  -- TODO: make adapterMinHeight part of Config
  let factoryAndTap := column factory tapFactory adapterMinHeight
  let busFactory := row state.factory factoryAndTap

  (outputLanes.toList, {
    input := state.input
    output := lanes
    factory := busFactory
  })

def busTapNoOutput
  (inputs:List BusLane')
  (factory:Factory [] [] (busTapInterface inputs []) [])
  (adapterMinHeight:=0)
: Bus Unit := do
  let _ <- busTapGeneric inputs [] factory adapterMinHeight

def busTap
  {outputIngredient} {outputThroughput} (inputs:List BusLane')
  (factory:Factory [] [] (busTapInterface inputs [outputIngredient]) [])
  (adapterMinHeight:=0)
: Bus (BusLane outputIngredient outputThroughput) := do
  let outputs <- busTapGeneric inputs [outputIngredient] factory adapterMinHeight
  return {index := outputs[0]!}

def split {i left input} (l:BusLane i input) (right := input - left) (_:left + right = input := by decide) : Bus (BusLane i left × BusLane i right) :=
  fun state =>
    (({index:= l.index}, {index:=l.index}),
        {state with
          output :=
            state.output.modify l.index fun lane => {lane with
              refCount := lane.refCount + 1
            }
          factory := unsafeFactoryCast state.factory
        }
    )

@[simp]
def expressBeltThroughput : Throughput := 45 * 60  -- 2700

def merge {i a b} (l:BusLane i a) (l':BusLane i b) (_ : i.isLiquid || a+b ≤ expressBeltThroughput := by decide) : Bus (BusLane i (a + b)) :=
  if i.isLiquid then error! s!"merging liquids is not yet implemented {reprStr i}" else

  busTap [l.toBusLane',l'.toBusLane'] {
    entities:=[
      belt 1 0 .E,
      belt 2 0 .S,
      belt 1 1 .N,
      beltDown 2 1 .S,
      belt 0 2 .E,
      belt 1 2 .N,
      belt 2 2 .W,
      belt 0 3 .N,
      belt 1 3 .E,
      belt 2 3 .N,
      splitter 0 4 .N (outputPriority:="left"),
      beltUp 2 4 .S,
    ],
    width:=3,
    height:=5,
    interface:={
      n := #v[]
      e := #v[]
      s := #v[0,1,2]
      w := #v[]
    }
    name := s!"merge {reprStr i}"
  }

def bigPoleFactory : Factory [] [] [] [] := {
  entities := [bigPole 0 0]
  width := 2, height := 2
  name := "bigPole"
  interface := { n:= #v[], e:= #v[], s:= #v[], w:= #v[] }
}

def pipePumps : Bus Unit :=
  fun state =>
    let config := state.output

    let entities := config.zipIdx.flatMap fun (lane, y) =>
      let poles := if y % 7 == 0 then [pole 1 y] else []

      let lanes :=
        if lane.depleted then []
        else if lane.ingredient.isLiquid then
          [pump 3 y .E] ++
          if y % 7 == 0
          then [pipeToGround 0 y .E, pipeToGround 2 y .E]
          else [pipe 0 y, pipe 1 y, pipe 2 y]
        else
          [belt 3 y .E, belt 4 y .E] ++
          if y % 7 == 0
          then [ beltDown 0 y .E, beltUp 2 y .E ]
          else [ belt 0 y .E, belt 1 y .E, belt 2 y .E]

      poles ++ lanes

    let factory : Factory [] (busInterface config) [] (busInterface config) := {
      entities := entities
      width := 5
      height := config.height
      name := "pipePumps"
      interface := {
        n:= #v[]
        e:= busInterfaceImpl config
        s:= #v[]
        w:= busInterfaceImpl config
      }
    }

    ((), {
      input := state.input
      output := config
      factory := row state.factory (column bigPoleFactory factory)
    })
