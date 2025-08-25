import Functorio

instance : Config where
  generateBigPoles := true
  generateRoboports := true
  providerChestCapacity := 0
  adapterMinHeight := 3

def makeLowDensityStructure : Copper 400 -> Steel 40 -> Plastic 100 -> Bus (LowDensityStructure 20) :=
  busAssemblyLine .lowDensityStructure 4

def makeAcid : Water 6000 -> Iron 60 -> Sulfur 300 -> Bus (Acid 3000) :=
  busAssemblyLine .sulfuricAcid 1

def makeCopper : CopperOre 1500 -> Bus (Copper 1500) :=
  busAssemblyLine .copperPlate 40

def makeIron : IronOre 900 -> Bus (Iron 900) :=
  busAssemblyLine .ironPlate 24

def makeSteel : Iron 225 -> Bus (Steel 45) :=
  busAssemblyLine .steelPlate 6

def makeSulfur : Water 7200 -> Petrolium 7200 -> Bus (Sulfur 480) :=
  busAssemblyLine .sulfur 4

def makePlastic : Petrolium 2400 -> Coal 120 -> Bus (Plastic 240) :=
  busAssemblyLine .plasticBar 2

def makeCable : Copper 1050 -> Bus (Cable 2100) :=
  busAssemblyLine .copperCable 7

def makeGreenCircuit : Iron 600 -> Cable 1800 -> Bus (GreenCircuit 600) :=
  busAssemblyLine .electronicCircuit 4

def makeRedCircuit : Plastic 100 -> Cable 200 -> GreenCircuit 100 -> Bus (RedCircuit 50) :=
  busAssemblyLine .advancedCircuit 4

def makeBlueCircuit : Acid (225/2) -> GreenCircuit 450 -> RedCircuit 45 -> Bus (BlueCircuit (45/2)) :=
  busAssemblyLine .processingUnit 3

def makeSolidFuel : LightOil 2400 -> Bus (SolidFuel 240) :=
  busAssemblyLine .solidFuelFromLightOil 4

def makeRocketFuel : LightOil 200 -> SolidFuel 200 -> Bus (RocketFuel 20) :=
  busAssemblyLine .rocketFuel 4

def makeRocket : BlueCircuit 20 -> LowDensityStructure 20 -> RocketFuel 20 -> Bus Unit :=
  busAssemblyLine .rocketPart 1

def rocketFactory := bus do
  let copper <- input .copperPlate 1500
  let iron <- input .ironPlate 900
  let coal <- input .coal 120
  let water <- input .water 13200
  let petrol <- input .petroleumGas 9600
  let lightOil <- input .lightOil 2600

  let (water0, water1) <- split (left:=7200) water
  let (petrol0, petrol1) <- split (left:=7200) petrol
  let (lightOil0, lightOil1) <- split lightOil

  let (copper0, copper1) <- split copper

  let (iron0, iron) <- split iron
  let (iron1, iron2) <- split iron
  let steel <- makeSteel iron0

  let sulfur <- makeSulfur water0 petrol0
  let acid <- makeAcid water1 iron1 sulfur.less
  let plastic <- makePlastic petrol1 coal
  let (plastic0, plastic1) <- split plastic

  let lowDensityStruct <- makeLowDensityStructure copper0 steel.less plastic0

  let solidFuel <- makeSolidFuel lightOil0
  let rocketFuel <- makeRocketFuel lightOil1 solidFuel.less

  let cable <- makeCable copper1.less
  let (cable0, cable1) <- split cable
  let greenCircuit <- makeGreenCircuit iron2.less cable0
  let (greenCircuit0, greenCircuit1) <- split greenCircuit
  let redCircuit <- makeRedCircuit plastic1.less cable1.less greenCircuit0
  let blueCircuit <- makeBlueCircuit acid.less greenCircuit1.less redCircuit.less

  makeRocket blueCircuit.less lowDensityStruct rocketFuel

def main : IO Unit :=
  IO.println (rocketFactory.toBlueprint) --  (bootstrap := true))
