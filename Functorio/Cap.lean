import Functorio.Factory

def capN {n e s w} (f:Factory n e s w) : Factory [] e s w :=
  {
    width:= f.width,
    height:= f.height,
    entities := f.entities,
    wires := f.wires,
    interface := {
      n := #v[]
      e := f.interface.e
      s := f.interface.s
      w := f.interface.w
    }
    name := f.name
  }

def capE {n e s w} (f:Factory n e s w) : Factory n [] s w :=
  {
    width:= f.width,
    height:= f.height,
    entities := f.entities,
    wires := f.wires,
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
    height:= f.height,
    entities := f.entities,
    wires := f.wires,
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
    width:= f.width
    height:= f.height
    entities := f.entities
    wires := f.wires
    interface := {
      n := f.interface.n
      e := f.interface.e
      s := f.interface.s
      w := #v[]
    }
    name := f.name
  }

def capAll {n e s w} (f:Factory n e s w) : Factory [] [] [] [] :=
  capN (capE (capS (capW f)))
