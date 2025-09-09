import Lean.Data.Json
import Lean.Data.Json.FromToJson

import Functorio.Entity
import Functorio.Factory

open Lean
open Lean (Json)

def coppperWire := 5

private def wireTypeNumber (type:WireType) : Nat :=
  match type with
  | .red => 1
  | .green => 2
  | .copper => coppperWire

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
  | .inserter _ _ => "bulk-inserter"
  | .longInserter _ _ => "long-handed-inserter"
  | .pole => "medium-electric-pole"
  | .bigPole => "big-electric-pole"
  | .roboport => "roboport"
  | .passiveProviderChest _ => "passive-provider-chest"
  | .refinedConcrete => "refined-concrete"
  | .heatingTower => "heating-tower"
  | .fabricator f _ _ _ => f.name

private def entityDirection (e:Entity) : Option Direction :=
  match e.type with
  | .belt d | .beltDown d | .beltUp d | .splitter d _
  | .pipeToGround d | .pump d | .inserter d _ | .longInserter d _
  | .fabricator _ _ d _ => d
  | .pipe | .pole | .bigPole | .roboport | .passiveProviderChest _
  | .heatingTower | .refinedConcrete => .none

private def entityProps (e:Entity) : List (String × Json):=
  match e.type with
  | .belt _ | .pipe | .pipeToGround _ | .pump _
  | .pole | .bigPole | .roboport | .heatingTower | .refinedConcrete => []
  | .inserter _ filter | .longInserter _ filter => [
    ("use_filters", !filter.isEmpty),
    ("filters", Json.arr (filter.mapIdx (fun i ingredient =>
      Json.mkObj [
        ("index", s!"{i + 1}"),
        ("name", ingredient.name),
        ("quality", "normal"),
        ("comparator", "="),
      ]
    )).toArray)
  ]
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

def wireToJson (wire:Wire) : List Nat :=
  let typeNumber := wireTypeNumber wire.type
  [wire.src, typeNumber, wire.dst, typeNumber]

def toBlueprint {n e s w} (factory:Factory n e s w) (bootstrap := false) : String :=
  let entities := (factory.entities.filter (fun e =>
    !isTile e && (!bootstrap || neededForBootStrap e))).zipIdx
  let tiles := factory.entities.filter isTile
  let poles := entities.filter (fun (e,_) => e.type == .pole || e.type == .bigPole)
  let wires := poles.flatMap (fun (a,aIdx) => poles.flatMap (fun (b,bIdx) =>
    if aIdx < bIdx && withinDistance a b then [[
      aIdx, coppperWire, bIdx, coppperWire
    ]] else []
  ))

  let blueprint : Blueprint := {
    blueprint := {
      entities:=entities.map (fun (e,idx) => entityToJson idx e),
      tiles:=tiles.map tileToJson,
      wires:= wires ++ factory.wires.map wireToJson,
      item:="blueprint",
      version:= 562949957025792
    }
  }
  Lean.Json.pretty (ToJson.toJson blueprint)

end Factory
