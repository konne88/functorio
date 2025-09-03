import Lean.Data.Json
import Lean.Data.Json.FromToJson

import Functorio.Entity
import Functorio.Factory

open Lean
open Lean (Json)

private def copperWire := 5

private structure BlueprintInner where
  entities: List Json
  tiles: List Json
  wires : List (List Nat)
  item: String
  version: Nat
  deriving ToJson

private structure Blueprint where
  blueprint: BlueprintInner
  deriving ToJson

private structure Position where
  x : Float
  y : Float
  deriving ToJson, Repr

private def entityName (e:Entity) : String :=
  match e.type with
  | .belt _ => "express-transport-belt"
  | .beltDown _ | .beltUp _ => "express-underground-belt"
  | .splitter _ _ => "express-splitter"
  | .pipe => "pipe"
  | .pipeToGround _ => "pipe-to-ground"
  | .pump _ => "pump"
  | .inserter _ => "bulk-inserter"
  | .longInserter _ => "long-handed-inserter"
  | .pole => "medium-electric-pole"
  | .bigPole => "big-electric-pole"
  | .roboport => "roboport"
  | .passiveProviderChest _ => "passive-provider-chest"
  | .refinedConcrete => "refined-concrete"
  | .fabricator f _ _ _ => f.name

private def entityDirection (e:Entity) : Option Direction :=
  match e.type with
  | .belt d | .beltDown d | .beltUp d | .splitter d _
  | .pipeToGround d | .pump d | .inserter d | .longInserter d
  | .fabricator _ _ d _ => d
  | .pipe | .pole | .bigPole | .roboport | .passiveProviderChest _
  | .refinedConcrete => .none

private def entityProps (e:Entity) : List (String × Json):=
  match e.type with
  | .belt _ | .pipe | .pipeToGround _ | .pump _ | .inserter _
  | .longInserter _ | .pole | .bigPole | .roboport | .refinedConcrete => []
  | .beltDown _ => [("type", "input")]
  | .beltUp _ => [("type", "output")]
  | .passiveProviderChest capacity => match capacity with | .none => [] | .some capacity => [("bar", capacity)]
  | .splitter _ priority => match priority with | .none => [] | .some p => [("output_priority", p)]
  | .fabricator _ r _ m => [("recipe", r.getRecipe.name), ("recipe_quality", "normal"), ("mirror", m)]

private def directionToNat (d:Direction) :=
  match d with
  | .N => 0
  | .E => 4
  | .S => 8
  | .W => 12

private def entityToJson (id:Nat) (e:Entity) : Json :=
  let dir := entityDirection e
  let p : Position := {
    x := Float.ofInt e.x + e.width.toFloat/2,
    y := Float.ofInt e.y + e.height.toFloat/2
  }

  Json.mkObj ([
    ([
      ("name", entityName e),
      ("position", ToJson.toJson p),
      ("entity_number", id),
    ] : List (String × Json)),
    match dir with | .none => [] | .some dir => [ ("direction", directionToNat dir) ],
    entityProps e
  ].flatten)


private def tileToJson (e:Entity) : Json :=
  let p : Position := {
    x := Float.ofInt e.x
    y := Float.ofInt e.y
  }

  Json.mkObj [
    ("name", entityName e),
    ("position", ToJson.toJson p),
  ]

def isTile (e:Entity) : Bool :=
  match e.type with
  | .refinedConcrete => true
  | _ => false

private def distance (a b : Entity) : Nat :=
  ((Int.ofNat a.x) - (Int.ofNat b.x)).natAbs +
  ((Int.ofNat a.y) - (Int.ofNat b.y)).natAbs

namespace Factory

def withinDistance (a b:Entity) :=
  let d := distance a b
  d <= 9 || (a.type == .bigPole && b.type == .bigPole && d <= 30)

def neededForBootStrap (e:Entity) : Bool :=
  match e.type with
  | .pole | .bigPole | .roboport => true
  | _ => false


inductive PoleType where
  | medium
  | big
  deriving Inhabited, DecidableEq

structure CellData where
  type : PoleType
  connected : Bool
  id : Nat

abbrev Cell := Option CellData

abbrev Matrix w h := Vector (Vector Cell h) w

namespace Matrix

def empty {w h} (a:Cell) : Matrix w h := Vector.replicate w (Vector.replicate h a)

def modifyCell {w h} (matrix:Matrix w h) (x y : Nat) (cell:Cell -> Cell) : Matrix w h :=
  matrix.modify x fun column => column.modify y cell

def setCell {w h} (matrix:Matrix w h) (x y : Nat) (cell:Cell) : Matrix w h :=
  modifyCell matrix x y fun _ => cell

def markConnected {w h} (x y:Nat) (matrix:Matrix w h ) : Matrix w h :=
  matrix.modifyCell x y (fun cell =>
    match cell with
    | .none => error! s!"Trying to connect cell that's not there {x} {y}"
    | .some cell => .some {cell with connected := true}
  )

def getCell {w h} (matrix:Matrix w h) (x y : Nat) : Cell :=
  let column := matrix[x]?
  match column with
  | .none => .none
  | .some column =>
    let cell := column[y]?
    match cell with
    | .none => .none
    | .some cell => cell

end Matrix

def entityToCell (pole: Entity) (id:Nat): CellData :=
  let type : PoleType := match pole.type with
    | .bigPole => .big
    | .pole => .medium
    | _ => impossible! s!"Trying to create wire between entities that aren't poles {reprStr pole}"

  {type:=type,id:=id,connected:=false}

abbrev Wire := List Nat

def generateWiresRec {w h} (remainingPoles:Nat) (nodeX nodeY:Nat) (node:CellData) (matrix: Matrix w h) (wires:Array Wire): Matrix w h × Array Wire := Id.run do
  match remainingPoles with
  | 0 => impossible! s!"Ran out of poles {remainingPoles}"
  | remainingPoles + 1 =>
    let mut matrix := matrix
    let mut wires := wires

    matrix := matrix.markConnected nodeX nodeY

    for distance in List.range' 1 (if node.type == .medium then 5 else 16) do
      for dx in List.range distance do
        let signs : List (Int × Int) := [(1,1), (1,-1), (-1,1), (-1,-1)]
        for (signX,signY) in signs do
          let x := nodeX + (dx * signX)
          let y := nodeY + ((distance - dx) * signY)

          if x < 0 || y < 0 then continue

          let neighbor := matrix.getCell x.toNat y.toNat
          match neighbor with
          | .none => continue
          | .some neighbor =>
            if neighbor.connected then continue
            if neighbor.type == .medium && distance >= 5 then continue

            wires := wires.push [node.id, copperWire, neighbor.id, copperWire]
            let (newMatrix, newWires) := generateWiresRec remainingPoles x.toNat y.toNat neighbor matrix wires
            matrix := newMatrix
            wires := newWires

    return (matrix, wires)

def generateWires (width height:Nat) (poles: List (Entity × Nat)) : List Wire := Id.run do
  let mut matrix : Matrix width height := Matrix.empty .none
  let mut wires : Array Wire := #[]

  for (pole, id) in poles do
    matrix := matrix.setCell pole.x pole.y (entityToCell pole id)

  if poles.isEmpty then [] else
  let (root, id) := poles[0]!

  let (_, newWires) := generateWiresRec poles.length root.x root.y (entityToCell root id) matrix wires
  wires := newWires

  return wires.toList

def toBlueprint {n e s w} (factory:Factory n e s w) (bootstrap := false) : String :=
  let entities := (factory.entities.filter (fun e =>
    !isTile e && (!bootstrap || neededForBootStrap e))).zipIdx
  let tiles := factory.entities.filter isTile
  let poles := entities.filter (fun (e,_) => e.type == .pole || e.type == .bigPole)
  let wires := generateWires factory.width factory.height poles

  let blueprint : Blueprint := {
    blueprint := {
      entities:=entities.map (fun (e,idx) => entityToJson idx e),
      tiles:=tiles.map tileToJson,
      wires:= wires,
      item:="blueprint",
      version:= 562949957025792
    }
  }
  Lean.Json.pretty (ToJson.toJson blueprint)

end Factory
