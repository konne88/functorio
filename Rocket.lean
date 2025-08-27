import Functorio

instance : Config where
  generateBigPoles := true
  generateRoboports := true
  providerChestCapacity := 0
  adapterMinHeight := 3

def makeLowDensityStructure : Steel 40 -> Copper 400 -> Plastic 100 -> Bus (LowDensityStructure 20) :=
  busAssemblyLine RecipeName.lowDensityStructure 4

def makeAcid : Water 6000 -> Sulfur 300 -> Iron 60 -> Bus (Acid 3000) :=
  busAssemblyLine RecipeName.sulfuricAcid 1

def makeCopper : CopperOre 1500 -> Bus (Copper 1500) :=
  busAssemblyLine RecipeName.copperPlate 40

def makeIron : IronOre 900 -> Bus (Iron 900) :=
  busAssemblyLine RecipeName.ironPlate 24

def makeSteel : Iron 225 -> Bus (Steel 45) :=
  busAssemblyLine RecipeName.steelPlate 6

def makeSulfur : Water 7200 -> Petrolium 7200 -> Bus (Sulfur 480) :=
  busAssemblyLine RecipeName.sulfur 4

def makePlastic : Petrolium 2400 -> Coal 120 -> Bus (Plastic 240) :=
  busAssemblyLine RecipeName.plasticBar 2

def makeCable : Copper 1050 -> Bus (Cable 2100) :=
  busAssemblyLine RecipeName.copperCable 7

def makeGreenCircuit : Iron 600 -> Cable 1800 -> Bus (GreenCircuit 600) :=
  busAssemblyLine RecipeName.electronicCircuit 4

def makeRedCircuit : GreenCircuit 100 -> Plastic 100 -> Cable 200 -> Bus (RedCircuit 50) :=
  busAssemblyLine RecipeName.advancedCircuit 4

def makeBlueCircuit : Acid (225/2) -> GreenCircuit 450 -> RedCircuit 45 -> Bus (BlueCircuit (45/2)) :=
  busAssemblyLine RecipeName.processingUnit 3

def makeSolidFuel : LightOil 2400 -> Bus (SolidFuel 240) :=
  busAssemblyLine RecipeName.solidFuelFromLightOil 4

def makeRocketFuel : LightOil 200 -> SolidFuel 200 -> Bus (RocketFuel 20) :=
  busAssemblyLine RecipeName.rocketFuel 4

def makeRocket : BlueCircuit 20 -> LowDensityStructure 20 -> RocketFuel 20 -> Bus Unit :=
  busAssemblyLine RecipeName.rocketPart 1

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
  let acid <- makeAcid water1 sulfur.less iron1
  let plastic <- makePlastic petrol1 coal
  let (plastic0, plastic1) <- split plastic

  let lowDensityStruct <- makeLowDensityStructure steel.less copper0 plastic0

  let solidFuel <- makeSolidFuel lightOil0
  let rocketFuel <- makeRocketFuel lightOil1 solidFuel.less

  let cable <- makeCable copper1.less
  let (cable0, cable1) <- split cable
  let greenCircuit <- makeGreenCircuit iron2.less cable0
  let (greenCircuit0, greenCircuit1) <- split greenCircuit
  let redCircuit <- makeRedCircuit greenCircuit0 plastic1.less cable1.less
  let blueCircuit <- makeBlueCircuit acid.less greenCircuit1.less redCircuit.less

  makeRocket blueCircuit.less lowDensityStruct rocketFuel

def main : IO Unit :=
  IO.println (rocketFactory.toBlueprint) --  (bootstrap := true))
