import Functorio

instance : Config where
  generateBigPoles := true
  generateRoboports := true
  providerChestCapacity := 0
  adapterMinHeight := 3

def makeWater : Ice 120 -> Bus (Water 2400) :=
  busAssemblyLine RecipeName.iceMelting 2

def makeLightOil : Water 900 -> HeavyOil 1200 -> Bus (LightOil 900) :=
  busAssemblyLine RecipeName.heavyOilCracking 1

def makeHolmiumSolution : Water 1260 -> HolmiumOre 252 -> Stone 126 -> Bus (HolmiumSolution 12600) :=
  busAssemblyLine RecipeName.holmiumSolution 21

def makeElectrolyte : HeavyOil 2400 -> HolmiumSolution 2400 -> Stone 240 -> Bus (Electrolyte 3600) :=
  busAssemblyLine RecipeName.electrolyte 10

def makeHolmiumPlate : HolmiumSolution 7500 -> Bus (Holmium 375) :=
  busAssemblyLine RecipeName.holmiumPlate 5

def makeSuperconductor : LightOil 240 -> Holmium 48 -> Copper 48 -> Plastic 48 -> Bus (Superconductor 144) :=
  busAssemblyLine RecipeName.superconductor 2

def makeSupercapacitor : Electrolyte 720 -> Holmium 144 -> Superconductor 144 -> GreenCircuit 288 -> Battery 72 -> Bus (Supercapacitor 108) :=
  busAssemblyLine RecipeName.supercapacitor 6

def makeAccumulator : Iron 144 -> Battery 360 -> Bus (Accumulator 108) :=
  busAssemblyLine { recipe := .accumulator, fabricator := .electromagneticPlant } 6

def makeElectromagneticScience : Electrolyte 2700 -> HolmiumSolution 2700 -> Supercapacitor 108 -> Accumulator 108 -> Bus (ElectromagneticScience 162) :=
  busAssemblyLine RecipeName.electromagneticSciencePack 9

def fulgora150 := bus do
  let plastic <- input .plasticBar 48
  let battery <- input .battery 432
  let iron <- input .ironPlate 144
  let copper <- input .copperPlate 48
  let stone <- input .stone 366
  let holmiumOre <- input .holmiumOre 252
  let greenCircuit <- input .electronicCircuit 288
  let ice <- input .ice 120
  let heavyOil <- input .heavyOil 3600

  let (stone0, stone1) <- split stone
  let (battery0, battery1) <- split battery
  let (heavyOil0, heavyOil1) <- split heavyOil

  let water <- makeWater ice
  let (water0, water1) <- split water
  let lightOil <- makeLightOil water0 heavyOil0
  let holmiumSolution <- makeHolmiumSolution water1.less holmiumOre stone0
  let (holmiumSolution0, holmiumSolution) <- split holmiumSolution
  let (holmiumSolution1, holmiumSolution2) <- split holmiumSolution
  let electrolyte <- makeElectrolyte heavyOil1 holmiumSolution0 stone1
  let (electrolyte0, electrolyte1) <- split electrolyte
  let holmiumPlate <- makeHolmiumPlate holmiumSolution1
  let (holmiumPlate0, holmiumPlate1) <- split holmiumPlate
  let superconductor <- makeSuperconductor lightOil.less holmiumPlate0 copper plastic
  let supercapacitor <- makeSupercapacitor electrolyte0 holmiumPlate1.less superconductor.less greenCircuit battery0
  let accumulator <- makeAccumulator iron battery1
  let _ <- makeElectromagneticScience electrolyte1.less holmiumSolution2 supercapacitor accumulator.less

def main : IO Unit :=
  IO.println (fulgora150.toBlueprint) --  (bootstrap := true))
