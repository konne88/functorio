-- We define our structure, because the standard library
-- adds a proof to the structure. This means that equal
-- numbers may not be definitionally equal.

abbrev Fraction := Nat × Nat

namespace Fraction

@[simp]
def num (f:Fraction) : Nat := f.fst

@[simp]
def den (f:Fraction) : Nat := f.snd

@[simp]
def mk (n m:Nat) : Fraction := (n,m)

end Fraction

instance : ToString Fraction where
  toString r := s!"{r.num}/{r.den}"

@[simp]
instance (n:Nat) : OfNat Fraction n where
  ofNat := Fraction.mk n 1

attribute [simp] OfNat.ofNat

@[simp]
def normalize (r:Fraction) : Fraction :=
  let gcd : Nat := Nat.gcd r.num r.den
  Fraction.mk (r.num / gcd) (r.den / gcd)

@[simp]
instance : HMul Fraction Fraction Fraction where
  hMul a b := normalize (Fraction.mk (a.num * b.num) (a.den * b.den))

@[simp]
instance : HDiv Fraction Fraction Fraction where
  hDiv a b := normalize (Fraction.mk (a.num * b.den) (a.den * b.num))

@[simp]
instance : HAdd Fraction Fraction Fraction where
  hAdd a b := normalize (Fraction.mk (a.num * b.den + b.num * a.den) (a.den * b.den))

@[simp]
instance : HSub Fraction Fraction Fraction where
  hSub a b := normalize (Fraction.mk (a.num * b.den - b.num * a.den) (a.den * b.den))

@[simp]
instance : Coe Nat Fraction where
  coe n := Fraction.mk n 1

@[simp]
instance : LE Fraction where
  le a b := a.num * b.den ≤ b.num * a.den

@[simp]
instance : LT Fraction where
  lt a b := a.num * b.den < b.num * a.den

@[simp]
instance : DecidableLE Fraction :=
  fun a b => Nat.decLe (a.num * b.den) (b.num * a.den)

@[simp]
instance : DecidableLT Fraction :=
  fun a b => Nat.decLt (a.num * b.den) (b.num * a.den)

@[simp]
instance : Min Fraction where
  min a b := if a ≤ b then a else b
