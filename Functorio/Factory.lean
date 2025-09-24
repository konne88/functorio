import Functorio.Entity
import Functorio.Util
import Functorio.Recipe

-- coordinates increase from N to S, and W to E
--
--   +--->
--   |
--   V

abbrev InterfaceImpl := Nat  -- offset

def increaseOffset {l} (n:Nat) (is:Vector InterfaceImpl l) : Vector InterfaceImpl l :=
  is.map fun offset => offset + n

def decreaseOffset {l} (n:Nat) (is:Vector InterfaceImpl l) : Vector InterfaceImpl l :=
  is.map fun offset => offset - n

-- Horizontal (H) directions
inductive DirectionH where
  | E
  | W
  deriving DecidableEq, Inhabited, Repr

instance : Coe DirectionH Direction where
  coe d := match d with | .E => .E | .W => .W

-- Vertical (V) directions
inductive DirectionV where
  | N
  | S
  deriving DecidableEq, Inhabited, Repr

instance : Coe DirectionV Direction where
  coe d := match d with | .N => .N | .S => .S

abbrev InterfaceH := Ingredient × DirectionH
abbrev InterfaceV := Ingredient × DirectionV

structure InterfaceImpls (n:List InterfaceV) (e:List InterfaceH) (s:List InterfaceV) (w:List InterfaceH) where
  n: Vector InterfaceImpl (n.length)
  e: Vector InterfaceImpl (e.length)
  s: Vector InterfaceImpl (s.length)
  w: Vector InterfaceImpl (w.length)
  deriving Inhabited, Repr

inductive WireType where
  | redInput
  | greenInput
  | redOutput
  | greenOutput
  | copper
  deriving DecidableEq, Inhabited, Repr

structure Wire where
  src: Nat
  srcType: WireType
  dst: Nat
  dstType: WireType
  deriving DecidableEq, Inhabited, Repr

namespace Wire

def incrementLabels (wire:Wire) (n:Nat) : Wire :=
  {src:=wire.src+n, dst:=wire.dst+n, srcType:=wire.srcType, dstType:=wire.dstType}

end Wire

structure Factory (n:List InterfaceV) (e:List InterfaceH) (s:List InterfaceV) (w:List InterfaceH) where
  width: Nat
  height: Nat
  entities: List Entity
  wires: List Wire
  interface: InterfaceImpls n e s w
  name: String
  deriving Repr

def errorFactory {n e s w} : Factory n e s w := {
  entities := []
  wires := []
  height := max n.length s.length
  width := max e.length w.length
  interface := {
    n := Vector.range (n.length)
    e := Vector.range (e.length)
    s := Vector.range (s.length)
    w := Vector.range (w.length)
  }
  name := "error"
}

instance {n e s w} : Inhabited (Factory n e s w) where
  default := errorFactory

instance {n e s w} : ToString (Factory n e s w) where
  toString f := f.name

def unsafeFactoryCast {n e s w n' e' s' w'} (f:Factory n e s w) : Factory n' e' s' w' :=
  match decEq n n', decEq e e', decEq s s', decEq w w' with
  | isTrue _, isTrue _, isTrue _, isTrue _  => cast (by subst_eqs; simp) f
  | _, _, _, _ => error! s!"unsafeFactoryCast failed for {f.name}"

namespace Factory

def setName {n e s w} (name:String) (f:Factory n e s w) : Factory n e s w :=
  {
    width:=f.width
    height:=f.height
    entities:=f.entities
    wires := f.wires
    interface:=f.interface
    name:=name
  }

end Factory


def emptyFactoryV {i} (offsets:Vector InterfaceImpl i.length := Vector.range i.length) : Factory [] i [] i := {
  entities := []
  wires := []
  interface := {
    n := #v[]
    e := offsets
    s := #v[]
    w := offsets
  }
  width := 0
  height := if i.isEmpty then 0 else offsets[i.length-1]! + 1
  name := s!"emptyFactoryV {reprStr i}"
}

def emptyFactoryH {i} (offsets:Vector InterfaceImpl i.length := Vector.range i.length) : Factory i [] i [] := {
  entities := []
  wires := []
  interface := {
    n := offsets
    e := #v[]
    s := offsets
    w := #v[]
  }
  width := if i.isEmpty then 0 else offsets[i.length-1]! + 1
  height := 0
  name := s!"emptyFactoryH {reprStr i}"
}

namespace Factory

def refinedConcreteFloor {n e s w} (f:Factory n e s w) : Factory n e s w := Id.run do
  let mut tiles : Array Entity := #[]

  for x in List.range f.width do
    for y in List.range f.height do
      tiles := tiles.push (refinedConcrete x y)

  { f with entities := f.entities ++ tiles.toList }

end Factory
