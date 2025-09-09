class Config where
  generateRoboports : Bool
  generateBigPoles : Bool
  generateInputRateLimiters : Bool
  providerChestCapacity : Nat
  adapterMinHeight : Nat

instance : Config where
  generateRoboports := false
  generateBigPoles := false
  generateInputRateLimiters := false
  providerChestCapacity := 0
  adapterMinHeight := 0
