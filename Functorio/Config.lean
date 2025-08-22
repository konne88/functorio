class Config where
  generateRoboports : Bool
  generateBigPoles : Bool
  providerChestCapacity : Nat
  adapterMinHeight : Nat

instance : Config where
  generateRoboports := false
  generateBigPoles := false
  providerChestCapacity := 0
  adapterMinHeight := 0
