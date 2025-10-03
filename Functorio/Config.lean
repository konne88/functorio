class Config where
  generateRoboports : Bool := false
  generateBigPoles : Bool := false
  providerChestCapacity : Nat := 0
  adapterMinHeight : Nat := 0

instance : Config where
