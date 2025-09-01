
def error! {T} [Inhabited T] (msg:String) : T :=
  dbg_trace ("ERROR: " ++ msg)
  default

def unimplemented! {T} [Inhabited T] (msg:String) : T :=
  dbg_trace ("UNIMPLEMENTED: " ++ msg ++  " (please file a feature request)")
  default

def impossible! {T} [Inhabited T] (msg:String) : T :=
  dbg_trace ("UNREACHABLE: " ++ msg ++ " (please report a bug)")
  default

namespace List

def toVector {T} (l:List T) : Vector T (l.length) :=
  l.toArray.toVector

def castToVector! {T} [Inhabited T] [Repr T] {n} (l:List T) : Vector T n :=
  match decEq l.length n with
  | isTrue _ => cast (by subst_eqs; simp) l.toVector
  | isFalse _ => error! s!"castToVector! failed for {reprStr l}"

end List

namespace Array

def toVector! {T} [Inhabited T] [Repr T] {n} (l:Array T) : Vector T n :=
  match decEq l.size n with
  | isTrue _ => cast (by subst_eqs; simp) l.toVector
  | isFalse _ => error! s!"toVector! failed for {reprStr l}"

end Array

namespace Vector

@[inline] def modify {α n} (xs : Vector α n) (i : Nat) (f : α -> α) : Vector α n :=
  ⟨xs.toArray.modify i f, by simp⟩

end Vector
