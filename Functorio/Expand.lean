import Functorio.Factory

private def expansionEntity (ingredient:Ingredient) (direction:Direction) (x y:Nat) : Entity :=
  if ingredient.isLiquid then pipe x y else belt x y direction

private def expandS {n e s w} (distance:Nat) (f:Factory n e s w) : Factory n e s w:=
  let expansion := (List.range' f.height distance).flatMap fun y =>
    s.mapIdx fun i (ingredient, dir) =>
      let x := f.interface.s[i]!
      expansionEntity ingredient dir x y

  {
    width := f.width,
    height:= f.height + distance,
    entities:= f.entities ++ expansion
    interface := f.interface
    name := f.name
  }

private def expandN {n e s w} (distance:Nat) (f:Factory n e s w) : Factory n e s w:=
  let expansion := (List.range distance).flatMap fun y =>
    n.mapIdx fun i (ingredient, dir) =>
      let x := f.interface.n[i]!
      expansionEntity ingredient dir x y

  {
    width := f.width,
    height:= f.height + distance,
    entities:= f.entities.map (Entity.offsetPosition 0 distance) ++ expansion
    interface := {
      n := f.interface.n
      e := increaseOffset distance (f.interface.e)
      s := f.interface.s
      w := increaseOffset distance (f.interface.w)
    }
    name := f.name
  }

private def expandE {n e s w} (distance:Nat) (f:Factory n e s w) : Factory n e s w:=
  let expansion := (List.range' f.width distance).flatMap fun x =>
    e.mapIdx fun i (ingredient, dir) =>
      let y := f.interface.e[i]!
      expansionEntity ingredient dir x y

  {
    width := f.width + distance,
    height:= f.height,
    entities:= f.entities ++ expansion,
    interface := f.interface
    name := f.name
  }

private def expandW {n e s w} (distance:Nat) (f:Factory n e s w) : Factory n e s w:=
  let expansion := (List.range distance).flatMap fun x =>
    w.mapIdx fun i (ingredient, dir) =>
      let y := f.interface.w[i]!
      expansionEntity ingredient dir x y

  {
    width := f.width + distance,
    height:= f.height,
    entities:= f.entities.map (Entity.offsetPosition distance 0) ++ expansion
    interface := {
      n := increaseOffset distance f.interface.n
      e := f.interface.e
      s := increaseOffset distance (f.interface.s)
      w := f.interface.w
    }
    name := f.name
  }

namespace Factory

def expand {n e s w} (direction:Direction) (distance:Nat) (f:Factory n e s w) : Factory n e s w :=
  match direction with
  | .N => expandN distance f
  | .S => expandS distance f
  | .E => expandE distance f
  | .W => expandW distance f

end Factory
