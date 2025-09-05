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
abbrev IronBacteria := BusLane .ironBacteria
abbrev CopperBacteria := BusLane .copperBacteria

-- def makeBioflux :=

def makeAgriculturalScience : Bioflux 210 -> PentapodEgg 210 -> Bus (AgriculturalScience 315) :=
    busAssemblyLine RecipeName.agriculturalSciencePack 7



def x : BusAssemblyLineType RecipeName.copperBacteriaCultivation 2 :=
  by simp!


def y : BusAssemblyLineType RecipeName.copperBacteria 2 :=
  by simp!



def cultivateCopperBacteria0 : YumakoMash 720 -> Bus (CopperBacteria 36 × Spoilage 360):=
  busAssemblyLine RecipeName.copperBacteria 2

def cultivateCopperBacteria1 : CopperBacteria 30 -> Bioflux 30 -> Bus (CopperBacteria 180):=
  busAssemblyLine RecipeName.copperBacteriaCultivation 1

def cultivateCopperBacteria2 : CopperBacteria 60 -> Bioflux 60 -> Bus (CopperBacteria 360):=
  busAssemblyLine RecipeName.copperBacteriaCultivation 2

def cultivateCopperBacteria3 : CopperBacteria 270 -> Bioflux 270 -> Bus (CopperBacteria 1620):=
  busAssemblyLine RecipeName.copperBacteriaCultivation 9

def copperSpoilingChamber {n} : CopperBacteria n -> Bus (CopperOre n) :=
  sorry

def makeBacteriaCopper (mash:YumakoMash 720) (bioflux:Bioflux 360) : Bus (CopperOre 1500 × Spoilage 360) := do
  let (bioflux0, bioflux) <- split bioflux
  let (bioflux1, bioflux2) <- split bioflux
  let (bacteria0, spoilage) <- cultivateCopperBacteria0 mash
  let bacteria1 <- cultivateCopperBacteria1 bacteria0.less bioflux0
  let bacteria2 <- cultivateCopperBacteria2 bacteria1.less bioflux1
  let bacteria3 <- cultivateCopperBacteria3 bacteria2.less bioflux2
  let ore <- copperSpoilingChamber bacteria3
  return (ore.less, spoilage)

def cultivateIronBacteria0 : Jelly 1440 -> Bus (IronBacteria 36 × Spoilage 1440):=
  busAssemblyLine RecipeName.ironBacteria 2

def cultivateIronBacteria1 : IronBacteria 30 -> Bioflux 30 -> Bus (IronBacteria 180):=
  busAssemblyLine RecipeName.ironBacteriaCultivation 1

def cultivateIronBacteria2 : IronBacteria 150 -> Bioflux 150 -> Bus (IronBacteria 900):=
  busAssemblyLine RecipeName.ironBacteriaCultivation 5

def ironSpoilingChamber {n} : IronBacteria n -> Bus (IronOre n) :=
  sorry

def makeBacteriaIron (jelly:Jelly 1440) (bioflux:Bioflux 180) : Bus (IronOre 900 × Spoilage 1440) := do
  let (bioflux0, bioflux1) <- split bioflux
  let (bacteria0, spoilage) <- cultivateIronBacteria0 jelly
  let bacteria1 <- cultivateIronBacteria1 bacteria0.less bioflux0
  let bacteria2 <- cultivateIronBacteria2 bacteria1.less bioflux1
  let ore <- ironSpoilingChamber bacteria2
  return (ore, spoilage)

def makeLowDensityStructure : Steel 40 -> Copper 400 -> Plastic 100 -> Bus (LowDensityStructure 20) :=
  busAssemblyLine RecipeName.lowDensityStructure 4

def makeBioSulfur : Spoilage 900 -> Bioflux 180 -> Bus (Sulfur 540) :=
  busAssemblyLine RecipeName.biosulfur 3

def makeAcid : Water 6000 -> Sulfur 300 -> Iron 60 -> Bus (Acid 3000) :=
  busAssemblyLine RecipeName.sulfuricAcid 1

def makeCopper : CopperOre 1500 -> Bus (Copper 1500) :=
  busAssemblyLine RecipeName.copperPlate 40

def makeIron : IronOre 900 -> Bus (Iron 900) :=
  busAssemblyLine RecipeName.ironPlate 24

def makeSteel : Iron 225 -> Bus (Steel 45) :=
  busAssemblyLine RecipeName.steelPlate 6

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
-- rocket fuel (for energy)
def glebaFactory := bus do
  let water <- input .water 6720
  let (water0, water1) <- split water

  let bioflux <- input .bioflux 648
  let jelly <- input .jelly 2160
  let (jelly0, jelly1) <- split jelly

  -- let spoilage <- input .spoilage 900
  let mash <- input .yumakoMash 960
  let (mash0, mash1) <- split mash

  let (bioflux0, bioflux) <- split bioflux
  let (bioflux1, bioflux) <- split bioflux
  let (bioflux2, bioflux) <- split bioflux
  let (bioflux3, bioflux4) <- split bioflux

  let (copperOre, spoilage0) <- makeBacteriaCopper mash0 bioflux4
  let (ironOre, spoilage1) <- makeBacteriaIron jelly0 bioflux3
  let spoilage <- merge spoilage0 spoilage1

  let copper <- makeCopper copperOre
  let iron <- makeIron ironOre
  let (iron0, iron) <- split iron
  let (iron1, iron2) <- split iron
  let (copper0, copper1) <- split copper
  let steel <- makeSteel iron0

  let sulfur <- makeBioSulfur spoilage.less bioflux0
  let acid <- makeAcid water0 sulfur.less iron1
  let rocketFuel <- makeBioRocketFuel water1 jelly1 bioflux1
  let plastic <- makeBioPlastic bioflux2 mash1
  let (plastic0, plastic1) <- split plastic

  let lowDensityStruct <- makeLowDensityStructure steel.less copper0 plastic0
  let cable <- makeCable copper1.less
  let (cable0, cable1) <- split cable
  let greenCircuit <- makeGreenCircuit iron2.less cable0
  let (greenCircuit0, greenCircuit1) <- split greenCircuit
  let redCircuit <- makeRedCircuit greenCircuit0 plastic1.less cable1.less
  let blueCircuit <- makeBlueCircuit acid.less greenCircuit1.less redCircuit.less

  makeRocket blueCircuit.less lowDensityStruct rocketFuel.less

def main : IO Unit :=
  IO.println (glebaFactory.toBlueprint) --  (bootstrap := true))
