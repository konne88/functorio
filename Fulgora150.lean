import Functorio

instance : Config where
  generateBigPoles := true
  generateRoboports := true
  providerChestCapacity := 3
  adapterMinHeight := 3

def makeWater : Ice 120 -> Bus (Water 2400) :=
  busAssemblyLine (recipe .iceMelting) 2

def makeLightOil : Water 900 -> HeavyOil 1200 -> Bus (LightOil 900) :=
  busAssemblyLine (recipe .heavyOilCracking) 1

def makeHolmiumSolution : Water 960 -> HolmiumOre 192 -> Stone 96 -> Bus (HolmiumSolution 9600) :=
  busAssemblyLine (recipe .holmiumSolution) 16

def makeElectrolyte : HeavyOil 2400 -> HolmiumSolution 2400 -> Stone 240 -> Bus (Electrolyte 3600) :=
  busAssemblyLine (recipe .electrolyte) 10

def makeHolmiumPlate : HolmiumSolution 4500 -> Bus (Holmium 225) :=
  busAssemblyLine (recipe .holmiumPlate) 3

def makeSuperconductor : LightOil 240 -> Holmium 48 -> Copper 48 -> Plastic 48 -> Bus (Superconductor 144) :=
  busAssemblyLine (recipe .superconductor) 2

def makeSupercapacitor : Electrolyte 720 -> Holmium 144 -> Superconductor 144 -> GreenCircuit 288 -> Battery 72 -> Bus (Supercapacitor 108) :=
  busAssemblyLine (recipe .supercapacitor) 6

def makeAccumulator : Iron 144 -> Battery 360 -> Bus (Accumulator 108) :=
  busAssemblyLine { recipe := .accumulator, fabricator := .electromagneticPlant } 6

def makeElectromagneticScience : Electrolyte 2700 -> HolmiumSolution 2700 -> Supercapacitor 108 -> Accumulator 108 -> Bus (ElectromagneticScience 162) :=
  busAssemblyLine (recipe .electromagneticSciencePack) 9

def makeRocketFuel : LightOil 200 -> SolidFuel 200 -> Bus (RocketFuel 20) :=
  busAssemblyLine (recipe .rocketFuel) 4

def makeRocket : BlueCircuit 20 -> LowDensityStructure 20 -> RocketFuel 20 -> Bus Unit :=
  busAssemblyLine (recipe .rocketPart) 1

def fulgora150 := bus do
  let ice <- input .ice 120
  let stone <- input .stone 336
  let holmiumOre <- input .holmiumOre 192
  let iron <- input .ironPlate 144
  let copper <- input .copperPlate 48
  let solidFuel <- input .solidFuel 200
  let plastic <- input .plasticBar 48
  let lowDensityStruct <- input .lowDensityStructure 20
  let greenCircuit <- input .electronicCircuit 288
  let blueCircuit <- input .processingUnit 20
  let battery <- input .battery 432
  let heavyOil <- input .heavyOil 3600

  let (stone0, stone1) <- split stone
  let (battery0, battery1) <- split battery
  let (heavyOil0, heavyOil1) <- split heavyOil

  let water <- makeWater ice
  let (water0, water1) <- split water
  let lightOil <- makeLightOil water0 heavyOil0
  let (lightOil0, lightOil1) <- split lightOil
  let rocketFuel <- makeRocketFuel lightOil0 solidFuel
  let holmiumSolution <- makeHolmiumSolution water1.less holmiumOre stone0
  let (holmiumSolution0, holmiumSolution) <- split holmiumSolution
  let (holmiumSolution1, holmiumSolution2) <- split holmiumSolution
  let electrolyte <- makeElectrolyte heavyOil1 holmiumSolution0 stone1
  let (electrolyte0, electrolyte1) <- split electrolyte
  let holmiumPlate <- makeHolmiumPlate holmiumSolution1
  let (holmiumPlate0, holmiumPlate) <- split holmiumPlate
  let (holmiumPlate1, _holmiumExport) <- split holmiumPlate

  let superconductor <- makeSuperconductor lightOil.less holmiumPlate0 copper plastic
  let supercapacitor <- makeSupercapacitor electrolyte0 holmiumPlate1 superconductor.less greenCircuit battery0
  let accumulator <- makeAccumulator iron battery1
  let _ <- makeElectromagneticScience electrolyte1.less holmiumSolution2 supercapacitor accumulator.less

  makeRocket blueCircuit lowDensityStruct rocketFuel

def main : IO Unit :=
  IO.println (fulgora150.toBlueprint) --  (bootstrap := true))
