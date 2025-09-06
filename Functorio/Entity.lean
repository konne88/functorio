import Lean.Data.Json
import Lean.Data.Json.Printer
import Lean.Data.Json.FromToJson

import Functorio.Direction
import Functorio.Recipe

open Lean
open Lean (Json)

inductive EntityType
  | belt (dir:Direction)
  | beltDown (direction:Direction)
  | beltUp (direction:Direction)
  | splitter (direction:Direction) (outputPriority:Option String)
  | pipe
  | pipeToGround (direction:Direction)
  | pump (direction:Direction)
  | inserter (direction:Direction) (filter:List Ingredient)
  | longInserter (direction:Direction) (filter:List Ingredient)
  | pole
  | bigPole
  | fabricator (fabricator:Fabricator) (recipe:RecipeName) (direction:Direction) (mirror:Bool)
  | heatingTower
  | roboport
  | passiveProviderChest (capacity:Option Nat)
  | refinedConcrete
  deriving DecidableEq, Inhabited, Repr

structure Entity where
  x : Nat
  y : Nat
  type : EntityType
  deriving DecidableEq, Inhabited, Repr

def belt x y d := ({x:=x,y:=y,type:=.belt d} : Entity)

def beltDown x y d := ({x:=x,y:=y,type:=.beltDown d} : Entity)

def beltUp x y d := ({x:=x,y:=y,type:=.beltUp d} : Entity)

def splitter x y d (outputPriority : Option String := .none) := ({x:=x,y:=y,type:=.splitter d outputPriority} : Entity)

def pipe x y := ({x:=x,y:=y,type:=.pipe} : Entity)

def pipeToGround x y d := ({x:=x,y:=y,type:=.pipeToGround d} : Entity)

def pump x y d := ({x:=x,y:=y,type:=.pump d} : Entity)

def inserter x y d (filter:=[]) := ({x:=x,y:=y,type:=.inserter d filter} : Entity)

def longInserter x y d (filter:=[]) := ({x:=x,y:=y,type:=.longInserter d filter} : Entity)

def pole x y := ({x:=x,y:=y,type:=.pole} : Entity)

def bigPole x y := ({x:=x,y:=y,type:=.bigPole} : Entity)

def fabricator x y f r (d := Direction.N) (mirror:=false) := ({x:=x,y:=y,type:=.fabricator f r d mirror} : Entity)

def heatingTower x y := ({x:=x,y:=y,type:=.heatingTower} : Entity)

def assembler r x y (d := Direction.W) := fabricator x y .assemblingMachine3 r d

def furnace r x y := fabricator x y .electricFurnace r

def chemicalPlant r x y (mirror:=false) (d := Direction.W) := fabricator x y .chemicalPlant r d mirror

def refinery r x y (mirror:=false) (d := Direction.E) := fabricator x y .oilRefinery r d mirror

def rocketSilo x y := fabricator x y .rocketSilo .rocketPart

def roboport x y := ({x:=x,y:=y,type:=.roboport} : Entity)

def passiveProviderChest x y (capacity : Option Nat := .none) := ({x:=x,y:=y,type:=.passiveProviderChest capacity} : Entity)

def refinedConcrete x y := ({x:=x,y:=y,type:=.refinedConcrete} : Entity)

namespace Entity

def width (e:Entity) : Nat :=
  match e.type with
  | .belt _ | .beltDown _ | .beltUp _ | .pipe | .pipeToGround _ | .inserter _ _ | .longInserter _ _
  | .pole | .passiveProviderChest _ | .refinedConcrete => 1
  | .bigPole => 2
  | .splitter dir _ => if dir == .N || dir == .S then 2 else 1
  | .pump dir => if dir == .N || dir == .S then 1 else 2
  | .heatingTower => 3
  | .roboport => 4
  | .fabricator f _ _ _ => f.width

def height (e:Entity) : Nat :=
  match e.type with
  | .belt _ | .beltDown _ | .beltUp _ | .pipe | .pipeToGround _ | .inserter _ _
  | .longInserter _ _ | .pole | .passiveProviderChest _ | .refinedConcrete => 1
  | .bigPole => 2
  | .splitter dir _ => if dir == .N || dir == .S then 1 else 2
  | .pump dir => if dir == .N || dir == .S then 2 else 1
  | .heatingTower => 3
  | .roboport => 4
  | .fabricator f _ _ _ => f.height

def offsetPosition (dx dy:Nat) (entity:Entity) : Entity := {
  x := entity.x + dx
  y := entity.y + dy
  type := entity.type
}

end Entity

def eraseRectangle (x y width height:Nat) (es:List Entity) : List Entity :=
  es.filter fun e => !(
    x <= e.x && e.x < x + width &&
    y <= e.y && e.y < y + height
  )
