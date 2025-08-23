import Lean.Data.Json
import Lean.Data.Json.Printer
import Lean.Data.Json.FromToJson

open Lean
open Lean (Json)

inductive Direction where
  | N
  | E
  | S
  | W
  deriving DecidableEq, Inhabited, Repr

inductive EntityType
  | belt (dir:Direction)
  | beltDown (direction:Direction)
  | beltUp (direction:Direction)
  | splitter (direction:Direction) (outputPriority:Option String)
  | pipe
  | pipeToGround (direction:Direction)
  | pump (direction:Direction)
  | inserter (direction:Direction)
  | longInserter (direction:Direction)
  | pole
  | bigPole
  | assembler (recipe:String) (direction:Direction)
  | furnace
  | chemicalPlant (recipe:String) (direction:Direction)
  | refinery (recipe:String) (direction:Direction)
  | roboport
  | passiveProviderChest (capacity:Option Nat)
  | refinedConcrete
  | rocketSilo
  deriving DecidableEq, Inhabited, Repr

structure Entity where
  x : Nat
  y : Nat
  type : EntityType
  deriving DecidableEq, Inhabited, Repr

def Fabricator := Nat -> Nat -> Entity

def belt x y d := ({x:=x,y:=y,type:=.belt d} : Entity)

def beltDown x y d := ({x:=x,y:=y,type:=.beltDown d} : Entity)

def beltUp x y d := ({x:=x,y:=y,type:=.beltUp d} : Entity)

def splitter x y d (outputPriority : Option String := .none) := ({x:=x,y:=y,type:=.splitter d outputPriority} : Entity)

def pipe x y := ({x:=x,y:=y,type:=.pipe} : Entity)

def pipeToGround x y d := ({x:=x,y:=y,type:=.pipeToGround d} : Entity)

def pump x y d := ({x:=x,y:=y,type:=.pump d} : Entity)

def inserter x y d := ({x:=x,y:=y,type:=.inserter d} : Entity)

def longInserter x y d := ({x:=x,y:=y,type:=.longInserter d} : Entity)

def pole x y := ({x:=x,y:=y,type:=.pole} : Entity)

def bigPole x y := ({x:=x,y:=y,type:=.bigPole} : Entity)

def assembler r x y (d := Direction.W) := ({x:=x,y:=y,type:=.assembler r d} : Entity)

def furnace x y := ({x:=x,y:=y,type:=.furnace} : Entity)

def chemicalPlant r x y (d := Direction.W) := ({x:=x,y:=y,type:=.chemicalPlant r d} : Entity)

def refinery r x y (d := Direction.E) := ({x:=x,y:=y,type:=.refinery r d} : Entity)

def roboport x y := ({x:=x,y:=y,type:=.roboport} : Entity)

def passiveProviderChest x y (capacity : Option Nat := .none) := ({x:=x,y:=y,type:=.passiveProviderChest capacity} : Entity)

def refinedConcrete x y := ({x:=x,y:=y,type:=.refinedConcrete} : Entity)

def rocketSilo x y := ({x:=x,y:=y,type:=.rocketSilo} : Entity)

namespace Entity

def width (e:Entity) : Nat :=
  match e.type with
  | .belt _ | .beltDown _ | .beltUp _ | .pipe | .pipeToGround _ | .inserter _ | .longInserter _
  | .pole | .passiveProviderChest _ | .refinedConcrete => 1
  | .bigPole => 2
  | .splitter dir _ => if dir == .N || dir == .S then 2 else 1
  | .pump dir => if dir == .N || dir == .S then 1 else 2
  | .assembler _ _ | .furnace | .chemicalPlant _ _ => 3
  | .roboport => 4
  | .refinery _ _ => 5
  | .rocketSilo => 9

def height (e:Entity) : Nat :=
  match e.type with
  | .belt _ | .beltDown _ | .beltUp _ | .pipe | .pipeToGround _ | .inserter _
  | .longInserter _ | .pole | .passiveProviderChest _ | .refinedConcrete => 1
  | .bigPole => 2
  | .splitter dir _ => if dir == .N || dir == .S then 1 else 2
  | .pump dir => if dir == .N || dir == .S then 2 else 1
  | .assembler _ _ | .furnace | .chemicalPlant _ _ => 3
  | .roboport => 4
  | .refinery _ _ => 5
  | .rocketSilo => 9

def offsetPosition (dx dy:Nat) (entity:Entity) : Entity := {
  x := entity.x + dx
  y := entity.y + dy
  type := entity.type
}

end Entity
