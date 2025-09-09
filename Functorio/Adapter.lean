import Functorio.Factory
import Functorio.Util

private inductive Orientation where
| vertical
| horizontalTopLtBot
| horizontalTopGtBot
| turnNE
| turnES
| turnSW
| turnWN

private def connector (x y : Nat) (isLiquid:Bool) (dir:DirectionV) (orient:Orientation) : Entity :=
  if isLiquid then pipe x y
  else belt x y (
    match dir, orient with
    | .N, .vertical => .N
    | .N, .horizontalTopLtBot => .W
    | .N, .horizontalTopGtBot => .E
    | .N, .turnNE => .N
    | .N, .turnES => .E
    | .N, .turnSW => .W
    | .N, .turnWN => .N
    | .S, .vertical => .S
    | .S, .horizontalTopLtBot => .E
    | .S, .horizontalTopGtBot => .W
    | .S, .turnNE => .E
    | .S, .turnES => .S
    | .S, .turnSW => .S
    | .S, .turnWN => .W
  )

private def singleConnection (isLiquid:Bool) (dir:DirectionV) (topOffset botOffset : InterfaceImpl) (height crossingY : Nat) : Array Entity :=
  if height == 0 then #[] else

  let lowX := min topOffset botOffset
  let highX := max topOffset botOffset
  let diff := highX - lowX - 1

  let vertical := (List.range height).flatMap fun y =>
    if (y < crossingY) then [connector topOffset y isLiquid dir .vertical] else
    if (y > crossingY) then [connector botOffset y isLiquid dir .vertical] else
    []

  let horizontal :=
    if topOffset < botOffset then
      (List.range' (topOffset + 1) diff).map fun x => connector x crossingY isLiquid dir .horizontalTopLtBot else
    if topOffset > botOffset then
      (List.range' (botOffset + 1) diff).map fun x => connector x crossingY isLiquid dir .horizontalTopGtBot
    else
      [connector topOffset crossingY isLiquid dir Orientation.vertical]

  let turns :=
    if topOffset < botOffset then
      [
        connector topOffset crossingY isLiquid dir .turnNE,
        connector botOffset crossingY isLiquid dir .turnSW
      ] else
    if topOffset > botOffset then
      [
        connector topOffset crossingY isLiquid dir .turnWN,
        connector botOffset crossingY isLiquid dir .turnES
      ]
    else
      []

  (vertical ++ horizontal ++ turns).toArray

def createAdapter (interfaces:List InterfaceV) (top bot:List InterfaceImpl) (height:Nat) : List Entity × Nat := Id.run do
  let mut topUsed := 0  -- Amount of space already used at the top by the adapter.
  let mut botUsed := 0  -- Amount of space already used at the bottom by the adapter.
  let mut neededHeight := 0
  let mut entities : Array Entity := #[]

  for ((ingredient, direction), i) in interfaces.zipIdx do
    let isLiquid := ingredient.isLiquid
    let topOffset := top[i]!
    let botOffset := bot[i]!

    -- Adjacent pipes need some padding between them
    let paddingNeeded := isLiquid && i+1 < interfaces.length && interfaces[i+1]!.fst.isLiquid

    -- If the interfaces line up, connect them directly
    if (topOffset == botOffset) then
      entities := entities ++ singleConnection isLiquid direction topOffset botOffset height 0
      topUsed := 0
      botUsed := 0
    -- If the top interface is to the left of the bottom interface, build connector along the bottom.
    else if (topOffset < botOffset) then
      entities := entities ++ singleConnection isLiquid direction topOffset botOffset height (height - botUsed - 1)
      topUsed := 0
      botUsed := botUsed + (if paddingNeeded then 2 else 1)
    -- If the bottom interface is to the left of the top interface, build connector along the top.
    else
      entities := entities ++ singleConnection isLiquid direction topOffset botOffset height topUsed
      topUsed := topUsed + (if paddingNeeded then 2 else 1)
      botUsed := 0

    neededHeight := max (max topUsed botUsed) neededHeight

  (entities.toList, neededHeight)

def adapterV {interface}
  (top:Vector InterfaceImpl interface.length)
  (bot:Vector InterfaceImpl interface.length)
  (width := (top ++ bot).toList.max?.getD 0)
  (minHeight := 0)
  : Factory interface [] interface []
  :=
  let initialHeight := (interface.map fun (ingredient,_) => if ingredient.isLiquid then 2 else 1).sum
  let (_,neededHeight) := createAdapter interface top.toList bot.toList initialHeight
  let height := max neededHeight minHeight
  let (entities,_) := createAdapter interface top.toList bot.toList height
  {
    width := width
    height:= height
    entities:= entities
    wires := []
    interface := {
      n := top
      e := Array.toVector #[]
      s := bot
      w := Array.toVector #[]
    }
    name := "adapter"
  }
