import Functorio.Entity
import Functorio.Factory

/-
Legend:

↑ belt
⤒ belt going under-ground
↥ belt going above-ground

| pipe (no directionality)
┴ pipe going underground (above-ground on the top, under-ground on the bottom)

⇨ inserter (moving items from left to right)
↠ long inserter

⚡ power pole
↯ big power pole

A assembly machine
C chemical plant
R refinery
F furnace

^ interface direction (pointing north)
* building
! overlapping entities
-/

private def entitySymbol (e:Entity) : Option Char :=
  match e.type with
  | .belt .N => '↑'
  | .belt .E => '→'
  | .belt .S => '↓'
  | .belt .W => '←'

  | .beltDown .N => '⤒'
  | .beltDown .E => '⇥'
  | .beltDown .S => '⤓'
  | .beltDown .W => '⇤'

  | .beltUp .N => '↥'
  | .beltUp .E => '↦'
  | .beltUp .S => '↧'
  | .beltUp .W => '↤'

  | .pipe => '|'
  | .pipeToGround .N => '┴'
  | .pipeToGround .E => '├'
  | .pipeToGround .S => '┬'
  | .pipeToGround .W => '┤'

  | .inserter .N _ => '⇩'
  | .inserter .E _ => '⇦'
  | .inserter .S _ => '⇧'
  | .inserter .W _ => '⇨'

  | .longInserter .N _ => '↡'
  | .longInserter .E _ => '↞'
  | .longInserter .S _ => '↟'
  | .longInserter .W _ => '↠'

  | .pole => '⚡'
  | .bigPole => '↯'

  | .splitter _ _ => 'S'
  | .fabricator .assemblingMachine3 _ _ _ => 'A'
  | .fabricator .electricFurnace _ _ _ => 'F'
  | .fabricator .stoneFurnace _ _ _ => 'F'
  | .fabricator .steelFurnace _ _ _ => 'F'
  | .fabricator .electromagneticPlant _ _ _ => 'E'
  | .fabricator .biochamber _ _ _ => 'B'
  | .fabricator .chemicalPlant _ _ _ => 'C'
  | .fabricator .oilRefinery _ _ _ => 'O'
  | .fabricator .rocketSilo _ _ _ => 'L'  -- L is for Launch-site
  | .heatingTower => 'H'

  | .roboport => 'R'
  | .pump _ => 'P'
  | .passiveProviderChest _ => '🄿'

  | .refinedConcrete => .none

  | _ => '?'

private def set {w h} (v:Vector (Vector Char w) h) (x y:Nat) (c:Char) : Vector (Vector Char w) h :=
  -- Mark overlapping entities with !
  v.modify y fun inner => inner.modify x fun element => if element == ' ' then c else '!'

private def dirSymbol (dir:Direction) : Char :=
  match dir with
  | .N => '^'
  | .E => '>'
  | .S => 'v'
  | .W => 'w'

namespace Factory

def toAscii {n e s w} (f:Factory n e s w) : String := Id.run do
  let mut data := Vector.replicate (f.height + 2) (Vector.replicate (f.width + 2) ' ')

  -- draw entities
  for entity in f.entities do
    match entitySymbol entity with
    | .none => pure ()
    | .some symbol =>
      -- draw entity symbol and a box if it's a big entity
      for dx in List.range (entity.width) do
        for dy in List.range (entity.height) do
          let widerSymbol :=
            if dx == entity.width/2 && dy == entity.height/2
            then symbol
            else '*'
          -- +1 so we have space for interface indicators
          data := set data (entity.x + dx + 1) (entity.y + dy + 1) widerSymbol

  -- draw interfaces
  for (offset,i) in f.interface.n.zipIdx do
    data := set data (offset + 1) 0 (dirSymbol n[i]!.snd)
  for (offset,i) in f.interface.e.zipIdx do
    data := set data (f.width + 1) (offset + 1) (dirSymbol e[i]!.snd)
  for (offset,i) in f.interface.s.zipIdx do
    data := set data (offset + 1) (f.height+1) (dirSymbol s[i]!.snd)
  for (offset,i) in f.interface.w.zipIdx do
    data := set data 0 (offset + 1) (dirSymbol w[i]!.snd)

  return "\n" ++ String.intercalate "\n" (data.toList.map fun inner => (String.mk inner.toList).trimRight) ++ "\n"

end Factory
