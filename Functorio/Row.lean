import Functorio.Factory
import Functorio.Expand
import Functorio.Util

private def rowPerfect {n e s w n' e' s'} (left : Factory n e s w) (right:Factory n' e' s' e): Factory (n ++ n') e' (s ++ s') w :=
  if left.interface.e != right.interface.w then unimplemented! s!"
    Rows currently require that factory interfaces line up perfectly (no adapter is being generated yet).
    Left offsets: {reprStr left.interface.e}
    Right offsets: {reprStr right.interface.w}
    Offending factories row(left,right); left := {left.name} right := {right.name}" else
  if left.height != right.height then impossible! "Row factories don't have the same height after expanding their dimensions." else
  let height := left.height

  {
    width := left.width + right.width,
    height := height,
    entities := left.entities ++ right.entities.map (Entity.offsetPosition left.width 0)
    wires := left.wires ++ right.wires.map fun wire => wire.incrementLabels left.entities.length
    interface := {
      n := cast (by simp) (left.interface.n ++ increaseOffset left.width (right.interface.n))
      e := right.interface.e
      s := cast (by simp) (left.interface.s ++ increaseOffset left.width (right.interface.s))
      w := left.interface.w
    }
    name := s!"row({left.name},{right.name})"
  }

def row' {n e s w n' e' s'} (left : Factory n e s w) (right:Factory n' e' s' e): Factory (n ++ n') e' (s ++ s') w :=
  -- Similar code in columnTwo

  -- Align the two factories on their 0th interface (if possible),
  -- then expand the smaller one to match the bigger one's size.
  if (left.height > right.height) then
    let diff := left.height - right.height
    let shift := if left.interface.e.isEmpty then 0
                 else min diff (left.interface.e[0]! - right.interface.w[0]!)
    rowPerfect left ((right.expand .S (diff - shift)).expand .N shift)
  else if (left.height < right.height) then
    let diff := right.height - left.height
    let shift := if left.interface.e.isEmpty then 0
                 else min diff ((right.interface.w)[0]! - (left.interface.e)[0]!)
    rowPerfect ((left.expand .S (diff - shift)).expand .N shift) right
  else
    rowPerfect left right

def row {n e s w n' e' s'} (left : Factory n e s w) (right:Factory n' e' s' e): Factory (n ++ n') e' (s ++ s') w :=
  -- Align the two factories on their 0th interface,
  -- then expand both interfaces to match their sizes.

  let diff := Int.ofNat left.height - Int.ofNat right.height
  let shift := if left.interface.e.isEmpty then Int.ofNat 0
               else Int.ofNat left.interface.e[0]! -
                    Int.ofNat right.interface.w[0]!
  rowPerfect ((left.expand .S (shift - diff).toNat).expand .N (-shift).toNat)
                ((right.expand .S (diff - shift).toNat).expand .N shift.toNat)

def row3 {n e s w n' e' s' n'' e'' s''} (left : Factory n e s w) (middle:Factory n' e' s' e) (right:Factory n'' e'' s'' e') : Factory (n ++ n' ++ n'') e'' (s ++ s' ++ s'') w :=
  (row (row left middle) right)

def rowList {i} (fs:List (Factory [] i [] i)) : Factory [] i [] i:=
  match fs with
  | f::fs => fs.foldl row f
  | [] => unimplemented! "Cannot make a row from empty list of factories yet"
