import Functorio.Factory

def capN {n e s w} (f:Factory n e s w) : Factory [] e s w :=
  {
    width:= f.width,
    height:= f.height + 1,
    entities := f.entities.map (Entity.offsetPosition 0 1),
    interface := {
      n := #v[]
      e := increaseOffset 1 f.interface.e
      s := f.interface.s
      w := increaseOffset 1 f.interface.w
    }
    name := f.name
  }

def capE {n e s w} (f:Factory n e s w) : Factory n [] s w :=
  {
    width:= f.width + 1,
    height:= f.height,
    entities := f.entities,
    interface := {
      n := f.interface.n
      e := #v[]
      s := f.interface.s
      w := f.interface.w
    }
    name := f.name
  }

def capS {n e s w} (f:Factory n e s w) : Factory n e [] w :=
  {
    width:= f.width,
    height:= f.height + 1,
    entities := f.entities,
    interface := {
      n := f.interface.n
      e := f.interface.e
      s := #v[]
      w := f.interface.w
    }
    name := f.name
  }

def capW {n e s w} (f:Factory n e s w) : Factory n e s [] :=
  {
    width:= f.width + 1
    height:= f.height
    entities := f.entities.map (Entity.offsetPosition 1 0)
    interface := {
      n := increaseOffset 1 (f.interface.n)
      e := f.interface.e
      s := increaseOffset 1 (f.interface.s)
      w := #v[]
    }
    name := f.name
  }

def capAll {n e s w} (f:Factory n e s w) : Factory [] [] [] [] :=
  capN (capE (capS (capW f)))
