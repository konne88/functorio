import Functorio
import Functorio.AssemblyLine

instance : Config where
  generateBigPoles := true
  generateRoboports := true
  adapterMinHeight := 3
  -- extraStations := 1

def makeBootstrapMash : Yumako 300 -> Bus (YumakoMash 600 × YumakoSeed 6) :=
  busAssemblyLine { recipe := .yumakoProcessing, fabricator := .assemblingMachine3} 4

def makeNutrientsFromSpoilage: Spoilage 75 → Bus (Nutrients (15/2)) := by exact
  (busAssemblyLine (recipe .nutrientsFromSpoilage) (1/5))

def makeNutrientsFromYumakoMash0 : Nutrients 5 → YumakoMash 40 → Bus (Nutrients 90) := by exact
  (busAssemblyLine (recipe .nutrientsFromYumakoMash) (1/3))

def makeNutrientsFromYumakoMash1 : Nutrients 60 → YumakoMash 480 → Bus (Nutrients 1080) :=
  busAssemblyLine (recipe .nutrientsFromYumakoMash) 4

def bootstrapNutrients (yumako:Yumako 300) : Bus (Nutrients 810 × YumakoSeed 6) := do
  let (mash, seeds) <- makeBootstrapMash yumako
  let (mash0, mash) <- splitBalanced (left:=75) (input:=595) mash.less
  let (mash1, mash2) <- splitBalanced (left:=40) (right:=480) mash

  let spoilage <- spoilingChamber mash0

  let nutrients <- makeNutrientsFromSpoilage spoilage
  let nutrients <- makeNutrientsFromYumakoMash0 nutrients.less mash1
  let nutrients <- makeNutrientsFromYumakoMash1 nutrients.less mash2

  return (nutrients.less, seeds)

def makeBioflux (nutrients:Nutrients 345) (mash:Vector (YumakoMash 2700) 2) (jelly:Vector (Jelly 2160) 2) : Bus (Bioflux 2160 × Nutrients 75) := do
  let (nutrients0, nutrients) <- splitBalanced nutrients
  let bioflux0 : Bioflux 1080 <- busAssemblyLine (recipe .bioflux) 9 nutrients0 mash[0] jelly[0]

  let (nutrients1, nutrients) <- splitBalanced nutrients
  let bioflux1 : Bioflux 1080 <- busAssemblyLine (recipe .bioflux) 9 nutrients1 mash[1] jelly[1]

  let bioflux <- merge bioflux0 bioflux1
  return (bioflux, nutrients)

-- TODO: why do I need the "by exact" here?
def makeNutrients : Nutrients (45/4) -> Bioflux 225 -> Bus (Nutrients 2700) := by exact
  (busAssemblyLine (recipe .nutrientsFromBioflux) (3/4))

def makePentapodEggs (eggsLoopIn:PentapodEgg 112) (water:Water 8640) (nutrients : Vector (Nutrients 2700) 2) : Bus (PentapodEgg 216 × Nutrients 525) := do
  let (water0, water1) <- split water
--  let (eggs0, eggs1) <- splitBalanced eggs
  let (nutrients0, nutrientsOut) <- splitBalanced (input:=2565) nutrients[0].less
  let eggsLoopOut <- busAssemblyLine (recipe .pentapodEgg) 8 water1 eggsLoopIn.less nutrients0
  let eggsOut <- busAssemblyLine (recipe .pentapodEgg) 10 water0 eggsLoopOut.less nutrients[1].less
--  let eggs <- merge eggs0 eggs1
  return (eggsOut.less, nutrientsOut)

def makeAgriculturalScience : Nutrients 105 -> Bioflux 210 -> PentapodEgg 210 -> Bus (AgriculturalScience 315) :=
  busAssemblyLine (recipe .agriculturalSciencePack) 7

def cultivateCopperBacteria0 : Nutrients 30 -> YumakoMash 720 -> Bus (CopperBacteria 36 × Spoilage 360):=
  busAssemblyLine (recipe .copperBacteria) 2

def cultivateCopperBacteria1 : Nutrients 15 -> CopperBacteria 30 -> Bioflux 30 -> Bus (CopperBacteria 180):=
  busAssemblyLine (recipe .copperBacteriaCultivation) 1

def cultivateCopperBacteria2 : Nutrients 30 -> CopperBacteria 60 -> Bioflux 60 -> Bus (CopperBacteria 360):=
  busAssemblyLine (recipe .copperBacteriaCultivation) 2

def cultivateCopperBacteria3 : Nutrients 135 -> CopperBacteria 270 -> Bioflux 270 -> Bus (CopperBacteria 1620):=
  busAssemblyLine (recipe .copperBacteriaCultivation) 9

def makeBacteriaCopper (nutrients:Nutrients 420) (mash:YumakoMash 720) (bioflux:Bioflux 360) : Bus (CopperOre 1500 × Spoilage 360 × Nutrients 210) := do
  let (bioflux0, bioflux) <- split bioflux
  let (bioflux1, bioflux2) <- split bioflux

  let (nutrients0, nutrients) <- splitBalanced nutrients
  let (bacteria0, spoilage) <- cultivateCopperBacteria0 nutrients0 mash

  let (nutrients1, nutrients) <- splitBalanced nutrients
  let bacteria1 <- cultivateCopperBacteria1 nutrients1 bacteria0.less bioflux0

  let (nutrients2, nutrients) <- splitBalanced nutrients
  let bacteria2 <- cultivateCopperBacteria2 nutrients2 bacteria1.less bioflux1

  let (nutrients3, nutrients) <- splitBalanced nutrients
  let bacteria3 <- cultivateCopperBacteria3 nutrients3 bacteria2.less bioflux2

  let ore <- spoilingChamber bacteria3
  return (ore.less, spoilage, nutrients)

def cultivateIronBacteria0 : Nutrients 30 -> Jelly 1440 -> Bus (Spoilage 1440 × IronBacteria 36):=
  busAssemblyLine (recipe .ironBacteria) 2

def cultivateIronBacteria1 : Nutrients 15 -> IronBacteria 30 -> Bioflux 30 -> Bus (IronBacteria 180):=
  busAssemblyLine (recipe .ironBacteriaCultivation) 1

def cultivateIronBacteria2 : Nutrients 75 -> IronBacteria 150 -> Bioflux 150 -> Bus (IronBacteria 900):=
  busAssemblyLine (recipe .ironBacteriaCultivation) 5

def makeBacteriaIron (nutrients:Nutrients 210) (jelly:Jelly 1440) (bioflux:Bioflux 180) : Bus (IronOre 900 × Spoilage 1440 × Nutrients 90) := do
  let (bioflux0, bioflux1) <- split bioflux

  let (nutrients0, nutrients) <- splitBalanced nutrients
  let (spoilage, bacteria0) <- cultivateIronBacteria0 nutrients0 jelly
  let (nutrients1, nutrients) <- splitBalanced nutrients
  let bacteria1 <- cultivateIronBacteria1 nutrients1 bacteria0.less bioflux0
  let (nutrients2, nutrients) <- splitBalanced nutrients
  let bacteria2 <- cultivateIronBacteria2 nutrients2 bacteria1.less bioflux1
  let ore <- spoilingChamber bacteria2

  return (ore, spoilage, nutrients)

def makeLowDensityStructure : Steel 40 -> Copper 400 -> Plastic 100 -> Bus (LowDensityStructure 20) :=
  busAssemblyLine (recipe .lowDensityStructure) 4

def makeBioSulfur : Nutrients 45 -> Spoilage 900 -> Bioflux 180 -> Bus (Sulfur 540) :=
  busAssemblyLine (recipe .biosulfur) 3

def makeAcid : Water 6000 -> Sulfur 300 -> Iron 60 -> Bus (Acid 3000) :=
  busAssemblyLine (recipe .sulfuricAcid) 1

def makeCopper : CopperOre 1500 -> Bus (Copper 1500) :=
  busAssemblyLine (recipe .copperPlate) 40

def makeIron : IronOre 900 -> Bus (Iron 900) :=
  busAssemblyLine (recipe .ironPlate) 24

def makeSteel : Iron 225 -> Bus (Steel 45) :=
  busAssemblyLine (recipe .steelPlate) 6

def makeBioPlastic : Nutrients 15 -> Bioflux 60 -> YumakoMash 240 -> Bus (Plastic 270) :=
  busAssemblyLine (recipe .bioplastic) 1

def makeBioRocketFuel : Water 720 -> Nutrients 30 -> Jelly 720 -> Bioflux 48 -> Bus (RocketFuel 36) :=
  busAssemblyLine (recipe .rocketFuelFromJelly) 2

def makeCable : Copper 1050 -> Bus (Cable 2100) :=
  busAssemblyLine (recipe .copperCable) 7

def makeGreenCircuit : Iron 600 -> Cable 1800 -> Bus (GreenCircuit 600) :=
  busAssemblyLine (recipe .electronicCircuit) 4

def makeRedCircuit : GreenCircuit 100 -> Plastic 100 -> Cable 200 -> Bus (RedCircuit 50) :=
  busAssemblyLine (recipe .advancedCircuit) 4

def makeBlueCircuit : Acid (225/2) -> GreenCircuit 450 -> RedCircuit 45 -> Bus (BlueCircuit (45/2)) :=
  busAssemblyLine (recipe .processingUnit) 3

def makeRocket : BlueCircuit 20 -> LowDensityStructure 20 -> RocketFuel 20 -> Bus Unit :=
  busAssemblyLine (recipe .rocketPart) 1

def makeMashFullBelt : Nutrients 120 -> Yumako 960 -> Bus (YumakoMash 2700 × YumakoSeed (144/5)) :=
  busAssemblyLine (recipe .yumakoProcessing) 8

def makeMashPartialBelt : Nutrients 45 -> Yumako 360 -> Bus (YumakoMash 1080 × YumakoSeed (54/5)) :=
  busAssemblyLine (recipe .yumakoProcessing) 3

def makeNonBiologicalComponents
  (copperOre : CopperOre 1500) (ironOre: IronOre 900) (water:Water 6000)
  (sulfur : Sulfur 540) (plastic : Plastic 270) (rocketFuel : RocketFuel 36)
  : Bus Unit :=
do
  let (plastic0, plastic1) <- split plastic

  let copper <- makeCopper copperOre
  let iron <- makeIron ironOre
  let (iron0, iron) <- split iron
  let (iron1, iron2) <- split iron
  let (copper0, copper1) <- split copper
  let steel <- makeSteel iron0

  let acid <- makeAcid water sulfur.less iron1
  let lowDensityStruct <- makeLowDensityStructure steel.less copper0 plastic0
  let cable <- makeCable copper1.less
  let (cable0, cable1) <- split cable
  let greenCircuit <- makeGreenCircuit iron2.less cable0
  let (greenCircuit0, greenCircuit1) <- split greenCircuit
  let redCircuit <- makeRedCircuit greenCircuit0 plastic1.less cable1.less
  let blueCircuit <- makeBlueCircuit acid.less greenCircuit1.less redCircuit.less

  let _ <- makeRocket blueCircuit.less lowDensityStruct rocketFuel.less

def makeJelly (nutrients:Nutrients 810) (jellynut:Jellynut 1440) : Bus (Vector (Jelly 2700) 3 × JellynutSeed (216 / 5) × Nutrients 630):= do
  let (jellynut0, jellynut) <- split jellynut
  let (jellynut1, jellynut2) <- split jellynut

  let (jelly0, jellySeed0, nutrients) <- busAssemblyLine (recipe .jellynutProcessing [(750, .nutrients)]) 4 nutrients jellynut0
  let (jelly1, jellySeed1, nutrients) <- busAssemblyLine (recipe .jellynutProcessing [(690, .nutrients)]) 4 nutrients jellynut1
  let (jelly2, jellySeed2, nutrients) <- busAssemblyLine (recipe .jellynutProcessing [(630, .nutrients)]) 4 nutrients jellynut2

  let jellySeed <- merge jellySeed0 jellySeed1
  let jellySeed <- merge jellySeed jellySeed2

  return (#v[jelly0, jelly1, jelly2], jellySeed, nutrients)

def makeMash (nutrients:Nutrients 630) (yumako:Yumako 2280) : Bus (Vector (YumakoMash 2700) 2 × YumakoMash 1080 × YumakoSeed (342 / 5) × Nutrients 345):= do
  let (yumako0, yumako) <- split yumako
  let (yumako1, yumako2) <- split yumako

  let (mash0, yumakoSeed0, nutrients) <- busAssemblyLine (recipe .yumakoProcessing [(510, .nutrients)]) 8 nutrients yumako0
  let (mash1, yumakoSeed1, nutrients) <- busAssemblyLine (recipe .yumakoProcessing [(390, .nutrients)]) 8 nutrients yumako1
  let (mash2, yumakoSeed2, nutrients) <- busAssemblyLine (recipe .yumakoProcessing [(345, .nutrients)]) 3 nutrients yumako2

  let yumakoSeed <- merge yumakoSeed0 yumakoSeed1
  let yumakoSeed <- merge yumakoSeed yumakoSeed2

  return (#v[mash0, mash1], mash2, yumakoSeed, nutrients)

def glebaFactory := bus do
  let yumako <- input .yumako 2580
  let jellynut <- input .jellynut 1440
 -- let spoilage <- input .spoilage 750
  let eggs <- input .pentapodEgg 112
  let bioChamberNutrients <- input .nutrients 810
  let water <- input .water 15360

  let (yumako0, yumako1) <- split (left:=300) yumako

  -- let (bioChamberNutrients, yumakoSeed0) <- bootstrapNutrients yumako0

  let (jelly, jellySeed, bioChamberNutrients) <- makeJelly bioChamberNutrients jellynut

  let (mash, mashPartial, yumakoSeed, bioChamberNutrients) <- makeMash bioChamberNutrients yumako1
--  let yumakoSeed <- merge yumakoSeed0 yumakoSeed1

  let (bioflux, bioChamberNutrients) <- makeBioflux bioChamberNutrients mash #v[jelly[0].less, jelly[1].less]

  let (water0, water) <- split (left:=8640) water
  let (water1, water2) <- split (right:=6000) water

  let (nutrients, bioChamberNutrients) <- splitBalanced (left:=45/4) bioChamberNutrients
  let (bioflux0, bioflux) <- split bioflux
  let nutrients0 <- makeNutrients nutrients bioflux0

  let (bioflux1, bioflux) <- split bioflux
  let nutrients1 <- makeNutrients bioChamberNutrients.less bioflux1

  let (eggs, bioChamberNutrients) <- makePentapodEggs eggs water0 #v[nutrients0, nutrients1]

  let (nutrients, bioChamberNutrients) <- splitBalanced (left:=105) (input:=525) bioChamberNutrients
  let (bioflux2, bioflux) <- split bioflux
  let _ <- makeAgriculturalScience nutrients bioflux2 eggs.less

  pipePumps   -- Right around here, the pipes on the bus are so long that they need pumps.

  let (mash0, mash1) <- splitBalanced mashPartial
  let (bioflux3, bioflux) <- split bioflux
  let (copperOre, spoilage0, bioChamberNutrients) <- makeBacteriaCopper bioChamberNutrients mash0 bioflux3

  let (jelly0, jelly1) <- splitBalanced (input:=2160) jelly[2].less
  let (bioflux4, bioflux) <- split bioflux
  let (ironOre, spoilage1, bioChamberNutrients) <- makeBacteriaIron bioChamberNutrients jelly0 bioflux4

  let spoilage <- merge spoilage0 spoilage1

  let (bioflux5, bioflux) <- split bioflux
  let (nutrients, bioChamberNutrients) <- splitBalanced (left:=45) bioChamberNutrients
  let sulfur <- makeBioSulfur nutrients spoilage.less bioflux5

  let (bioflux6, bioflux) <- split bioflux
  let (nutrients, bioChamberNutrients) <- splitBalanced (left:=15) bioChamberNutrients
  let plastic <- makeBioPlastic nutrients bioflux6 mash1.less

  let (bioflux7, _biofluxOut) <- split bioflux
  let rocketFuel <- makeBioRocketFuel water1 bioChamberNutrients jelly1 bioflux7

--  makeNonBiologicalComponents copperOre ironOre water2 sulfur plastic rocketFuel

def main : IO Unit :=
  IO.println (glebaFactory.toBlueprint) --  (bootstrap := true))
