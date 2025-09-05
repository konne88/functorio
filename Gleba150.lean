import Functorio

instance : Config where
  generateBigPoles := true
  generateRoboports := true
  providerChestCapacity := 0
  adapterMinHeight := 3

abbrev AgriculturalScience := BusLane .agriculturalSciencePack
abbrev Bioflux := BusLane .bioflux
abbrev PentapodEgg := BusLane .pentapodEgg
abbrev Jelly := BusLane .jelly
abbrev Spoilage := BusLane .spoilage
abbrev YumakoMash := BusLane .yumakoMash

def makeBioflux :=

def makeAgriculturalScience : Bioflux 210 -> PentapodEgg 210 -> Bus (AgriculturalScience 315) :=
    busAssemblyLine RecipeName.agriculturalSciencePack 7




def makeLowDensityStructure : Copper 400 -> Steel 40 -> Plastic 100 -> Bus (LowDensityStructure 20) :=
  busAssemblyLine RecipeName.lowDensityStructure 4

def makeBioSulfur : Spoilage 900 -> Bioflux 180 -> Bus (Sulfur 540) :=
  busAssemblyLine RecipeName.biosulfur 3

def makeAcid : Water 6000 -> Iron 60 -> Sulfur 300 -> Bus (Acid 3000) :=
  busAssemblyLine RecipeName.sulfuricAcid 1

def makeCopper : CopperOre 1500 -> Bus (Copper 1500) :=
  busAssemblyLine RecipeName.copperPlate 40

def makeIron : IronOre 900 -> Bus (Iron 900) :=
  busAssemblyLine RecipeName.ironPlate 24

def makeSteel : Iron 225 -> Bus (Steel 45) :=
  busAssemblyLine RecipeName.steelPlate 6

def x : BusAssemblyLineType RecipeName.bioplastic 1 :=
  by simp!


def makeBioPlastic : Bioflux 60 -> YumakoMash 240 -> Bus (Plastic 270) :=
  busAssemblyLine RecipeName.bioplastic 1

def makeBioRocketFuel : Water 720 -> Jelly 720 -> Bioflux 48 -> Bus (RocketFuel 36) :=
  busAssemblyLine RecipeName.rocketFuelFromJelly 2

def makeCable : Copper 1050 -> Bus (Cable 2100) :=
  busAssemblyLine RecipeName.copperCable 7

def makeGreenCircuit : Iron 600 -> Cable 1800 -> Bus (GreenCircuit 600) :=
  busAssemblyLine RecipeName.electronicCircuit 4

def makeRedCircuit : GreenCircuit 100 -> Plastic 100 -> Cable 200 -> Bus (RedCircuit 50) :=
  busAssemblyLine RecipeName.advancedCircuit 4

def makeBlueCircuit : Acid (225/2) -> GreenCircuit 450 -> RedCircuit 45 -> Bus (BlueCircuit (45/2)) :=
  busAssemblyLine RecipeName.processingUnit 3

def makeRocket : BlueCircuit 20 -> LowDensityStructure 20 -> RocketFuel 20 -> Bus Unit :=
  busAssemblyLine RecipeName.rocketPart 1

-- output:
-- science
-- bioflux
-- carbon fiber
-- rocket fuel
def glebaFactory := bus do
  let bioflux <- input .bioflux 288
  let jelly <- input .jelly 720
  let spoilage <- input .spoilage 900
  let yumakoMash <- input .yumakoMash 240

  let copperOre <- input .copperOre 1500
  let ironOre <- input .ironOre 900

  let water <- input .water 6720
  let (water0, water1) <- split water

  let (bioflux0, bioflux) <- split bioflux
  let (bioflux1, bioflux2) <- split bioflux

  let copper <- makeCopper copperOre
  let iron <- makeIron ironOre
  let (iron0, iron) <- split iron
  let (iron1, iron2) <- split iron
  let (copper0, copper1) <- split copper
  let steel <- makeSteel iron0

  let sulfur <- makeBioSulfur spoilage bioflux0
  let acid <- makeAcid water0 iron1 sulfur.less
  let rocketFuel <- makeBioRocketFuel water1 jelly bioflux1
  let plastic <- makeBioPlastic bioflux2 yumakoMash
  let (plastic0, plastic1) <- split plastic

  let lowDensityStruct <- makeLowDensityStructure copper0 steel.less plastic0
  let cable <- makeCable copper1.less
  let (cable0, cable1) <- split cable
  let greenCircuit <- makeGreenCircuit iron2.less cable0
  let (greenCircuit0, greenCircuit1) <- split greenCircuit
  let redCircuit <- makeRedCircuit greenCircuit0 plastic1.less cable1.less
  let blueCircuit <- makeBlueCircuit acid.less greenCircuit1.less redCircuit.less

  makeRocket blueCircuit.less lowDensityStruct rocketFuel.less

def main : IO Unit :=
  IO.println (glebaFactory.toBlueprint) --  (bootstrap := true))
