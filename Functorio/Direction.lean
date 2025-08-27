
inductive Direction where
  | N
  | E
  | S
  | W
  deriving DecidableEq, Repr, Inhabited
