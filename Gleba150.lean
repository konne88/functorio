import Functorio
import Functorio.AssemblyLine

instance : Config where
  generateBigPoles := true
  generateRoboports := true
  generateInputRateLimiters := false
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
abbrev Nutrients := BusLane .nutrients
abbrev Jellynut := BusLane .jellynut
abbrev JellynutSeed := BusLane .jellynutSeed
abbrev Yumako := BusLane .yumako
abbrev YumakoSeed := BusLane .yumakoSeed

-- 378

def makeBioflux (nutrients:Nutrients 270) (mash:Vector (YumakoMash 2700) 2) (jelly:Vector (Jelly 2160) 2) : Bus (Bioflux 2160) := do
  let (nutrients0, nutrients1) <- split nutrients
  let bioflux0 : Bioflux 1080 <- busAssemblyLine (recipe .bioflux) 9 nutrients0 mash[0] jelly[0]
  let bioflux1 : Bioflux 1080 <- busAssemblyLine (recipe .bioflux) 9 nutrients1 mash[1] jelly[1]
  let bioflux <- merge bioflux0 bioflux1
  return bioflux.less

--  return bioflux



--  busAssemblyLine (recipe .bioflux) 1



-- One unit of nutrients will power a biochamber for 4 seconds.

-- TODO: why do I need the "by exact" here?
def makeNutrients : Nutrients (45/4) -> Bioflux 225 -> Bus (Nutrients 2700) := by exact
  (busAssemblyLine (recipe .nutrientsFromBioflux) (3/4))

  -- by

  -- refine (let x := busAssemblyLine (recipe .nutrientsFromBioflux) (3/4); ?_)

  -- exact x






-- Nutrients (45/4) -> Bioflux 225 -> Bus (Nutrients 2700) :=

--  busAssemblyLine (recipe .nutrientsFromBioflux) (3/4)

-- def makePentapodEggs' : Water 6720 -> PentapodEgg 112 -> Nutrients 3360 -> Bus (PentapodEgg 336) :=
--   busAssemblyLine (recipe .pentapodEgg) 14

-- def makePentapodEggs'' : Water 3360 -> PentapodEgg 56 -> Nutrients 1680 -> Bus (PentapodEgg 168) :=
--   busAssemblyLine (recipe .pentapodEgg) 7

def makePentapodEggs (water:Water 6720) (eggs:PentapodEgg 112) (nutrients0 : Nutrients 2700) (nutrients1 : Nutrients 930) : Bus (PentapodEgg 336) := do
  let (water0, water1) <- split water
  let (eggs0, eggs1) <- split eggs
  let (nutrients1, nutrients2) <- split nutrients1
  let (nutrients2, nutrients3) <- split nutrients2
  let eggs0 <- busAssemblyLine (recipe .pentapodEgg) 11 water0 nutrients1 eggs0 nutrients0.less
  let eggs1 <- busAssemblyLine (recipe .pentapodEgg) 3 water1 nutrients2 eggs1 nutrients3
  merge eggs0 eggs1

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

def copperSpoilingChamber {n} (bacteria:CopperBacteria n) : Bus (CopperOre n) :=
  let factory := capN emptyFactoryH
  busTap [bacteria] factory

def makeBacteriaCopper (nutrients:Nutrients 210) (mash:YumakoMash 720) (bioflux:Bioflux 360) : Bus (CopperOre 1500 × Spoilage 360) := do
  let (nutrients0, nutrients) <- split nutrients
  let (nutrients1, nutrients) <- split nutrients
  let (nutrients2, nutrients3) <- split nutrients

  let (bioflux0, bioflux) <- split bioflux
  let (bioflux1, bioflux2) <- split bioflux
  let (bacteria0, spoilage) <- cultivateCopperBacteria0 nutrients0 mash
  let bacteria1 <- cultivateCopperBacteria1 nutrients1 bacteria0.less bioflux0
  let bacteria2 <- cultivateCopperBacteria2 nutrients2 bacteria1.less bioflux1
  let bacteria3 <- cultivateCopperBacteria3 nutrients3 bacteria2.less bioflux2
  let ore <- copperSpoilingChamber bacteria3
  return (ore.less, spoilage)

def cultivateIronBacteria0 : Nutrients 30 -> Jelly 1440 -> Bus (Spoilage 1440 × IronBacteria 36):=
  busAssemblyLine (recipe .ironBacteria) 2

def cultivateIronBacteria1 : Nutrients 15 -> IronBacteria 30 -> Bioflux 30 -> Bus (IronBacteria 180):=
  busAssemblyLine (recipe .ironBacteriaCultivation) 1

def cultivateIronBacteria2 : Nutrients 75 -> IronBacteria 150 -> Bioflux 150 -> Bus (IronBacteria 900):=
  busAssemblyLine (recipe .ironBacteriaCultivation) 5

def ironSpoilingChamber {n} (bacteria:IronBacteria n) : Bus (IronOre n) :=
  let factory := capN emptyFactoryH
  busTap [bacteria] factory

-- def busTap
--   {outputIngredient} {outputThroughput} (inputs:List BusLane')
--   (factory:Factory [] [] (busTapInterface inputs [outputIngredient]) [])
--   (adapterMinHeight:=0)
-- : Bus (BusLane outputIngredient outputThroughput) := do


def makeBacteriaIron (nutrients:Nutrients 120) (jelly:Jelly 1440) (bioflux:Bioflux 180) : Bus (IronOre 900 × Spoilage 1440) := do
  let (nutrients0, nutrients) <- split nutrients
  let (nutrients1, nutrients2) <- split nutrients

  let (bioflux0, bioflux1) <- split bioflux
  let (spoilage, bacteria0) <- cultivateIronBacteria0 nutrients0 jelly
  let bacteria1 <- cultivateIronBacteria1 nutrients1 bacteria0.less bioflux0
  let bacteria2 <- cultivateIronBacteria2 nutrients2 bacteria1.less bioflux1
  let ore <- ironSpoilingChamber bacteria2
  return (ore, spoilage)

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

-- def x : BusAssemblyLineType (recipe .yumakoProcessing) 3 :=
--   by simp!

def makeJelly : Nutrients 60 -> Jellynut 480 -> Bus (Jelly 2700 × JellynutSeed (72/5)) :=
  busAssemblyLine (recipe .jellynutProcessing) 4

def makeMash : Nutrients 120 -> Yumako 960 -> Bus (YumakoMash 2700 × YumakoSeed (144/5)) :=
  busAssemblyLine (recipe .yumakoProcessing) 8

-- def adfs : BusAssemblyLineType (recipe .jellynutProcessing) 4 :=
--   by
--   simp!


  -- unfold BusAssemblyLineType
  -- simp!






def makeMash' : Nutrients 45 -> Yumako 360 -> Bus (YumakoMash 1080 × YumakoSeed (54/5)) :=
  busAssemblyLine (recipe .yumakoProcessing) 3


-- abbrev Yumako := BusLane .yumako
-- abbrev YumakoSeed := BusLane .yumakoSeed

-- output:
-- science | done
-- bioflux | done
-- carbon fiber
-- rocket fuel (for energy)

-- set_option maxHeartbeats 200000000


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

def glebaFactory := bus do
  let yumako <- input .yumako 2700
  let jellynut <- input .jellynut 1440 -- 1350 would be perfect
  let eggs <- input .pentapodEgg 112
  let water <- input .water 13440

  let bioChamberNutrients <- input .nutrients 1455

  let (water0, water) <- split water
  let (water1, water2) <- split (right:=6720) water

  let (jellynut0, jellynut) <- splitBalanced jellynut
  let (jellynut1, jellynut2) <- splitBalanced jellynut
  let (nutrients, bioChamberNutrients) <- split (left:=60) bioChamberNutrients
  let (jelly, jellySeed0) <- makeJelly nutrients jellynut0
  let (jelly0, jelly1) <- split jelly
  let (nutrients, bioChamberNutrients) <- split (left:=60) bioChamberNutrients
  let (jelly2, jellySeed1) <- makeJelly nutrients jellynut1
  let (nutrients, bioChamberNutrients) <- split (left:=60) bioChamberNutrients
  let (jelly3, jellySeed2) <- makeJelly nutrients jellynut2

  let jellySeed <- merge jellySeed0 jellySeed1
  let jellySeed <- merge jellySeed jellySeed2

  let (yumako0, yumako) <- split yumako
  let (yumako1, yumako2) <- split yumako
  let (nutrients, bioChamberNutrients) <- split (left:=45) bioChamberNutrients
  let (mash, yumakoSeed0) <- makeMash' nutrients yumako0
  let (mash0, mash1) <- split mash
  let (nutrients, bioChamberNutrients) <- split (left:=120) bioChamberNutrients
  let (mash2, yumakoSeed1) <- makeMash nutrients yumako1
  let (nutrients, bioChamberNutrients) <- split (left:=120) bioChamberNutrients
  let (mash3, yumakoSeed2) <- makeMash nutrients yumako2.less

  let yumakoSeed <- merge yumakoSeed0 yumakoSeed1
  let yumakoSeed <- merge yumakoSeed yumakoSeed2

  let (nutrients, bioChamberNutrients) <- split (left:=270) bioChamberNutrients
  let bioflux <- makeBioflux nutrients #v[mash2, mash3] #v[jelly2.less, jelly3.less]
  let (bioflux0, bioflux) <- split bioflux
  let (bioflux1, bioflux) <- split bioflux
  let (bioflux2, bioflux) <- split bioflux
  let (bioflux3, bioflux) <- split bioflux
  let (bioflux4, bioflux) <- split bioflux
  let (bioflux5, bioflux) <- split bioflux
  let (bioflux6, bioflux7) <- split bioflux

  let (nutrients, bioChamberNutrients) <- split (left:=45/4) bioChamberNutrients
  let nutrients0 <- makeNutrients nutrients bioflux6
  let (nutrients, bioChamberNutrients) <- split (left:=45/4) bioChamberNutrients
  let nutrients1 <- makeNutrients nutrients bioflux7.less
  let (bioChamberNutrients, nutrients1) <- split (left:=525) nutrients1

  let eggs <- makePentapodEggs water2 eggs nutrients0 nutrients1.less
  let (eggs, _) <- split (right:=126) eggs

  let (nutrients, bioChamberNutrients) <- split (left:=105) bioChamberNutrients
  let _ <- makeAgriculturalScience nutrients bioflux5 eggs

  let (nutrients, bioChamberNutrients) <- split (left:=210) bioChamberNutrients
  let (copperOre, spoilage0) <- makeBacteriaCopper nutrients mash0 bioflux4
  let (nutrients, bioChamberNutrients) <- split (left:=120) bioChamberNutrients
  let (ironOre, spoilage1) <- makeBacteriaIron nutrients jelly0 bioflux3
  let spoilage <- merge spoilage0 spoilage1

  let (nutrients, bioChamberNutrients) <- split (left:=45) bioChamberNutrients
  let sulfur <- makeBioSulfur nutrients spoilage.less bioflux0
  let (nutrients, bioChamberNutrients) <- split (left:=15) bioChamberNutrients
  let plastic <- makeBioPlastic nutrients bioflux2 mash1.less
  let (nutrients, bioChamberNutrients) <- split (left:=30) bioChamberNutrients
  let rocketFuel <- makeBioRocketFuel water0 nutrients jelly1.less bioflux1

  makeNonBiologicalComponents copperOre ironOre water1 sulfur plastic rocketFuel


--  let (plastic0, plastic1) <- split plastic

  -- let copper <- makeCopper copperOre
  -- let iron <- makeIron ironOre
  -- let (iron0, iron) <- split iron
  -- let (iron1, iron2) <- split iron
  -- let (copper0, copper1) <- split copper
  -- let steel <- makeSteel iron0

  -- let (nutrients, bioChamberNutrients) <- split (left:=45) bioChamberNutrients
  -- let sulfur <- makeBioSulfur nutrients spoilage.less bioflux0
  -- let (nutrients, bioChamberNutrients) <- split (left:=30) bioChamberNutrients
  -- let rocketFuel <- makeBioRocketFuel water0 nutrients jelly1.less bioflux1
  -- let (nutrients, bioChamberNutrients) <- split (left:=15) bioChamberNutrients
  -- let plastic <- makeBioPlastic nutrients bioflux2 mash1.less
  -- let (plastic0, plastic1) <- split plastic

  -- let acid <- makeAcid water1 sulfur.less iron1
  -- let lowDensityStruct <- makeLowDensityStructure steel.less copper0 plastic0
  -- let cable <- makeCable copper1.less
  -- let (cable0, cable1) <- split cable
  -- let greenCircuit <- makeGreenCircuit iron2.less cable0
  -- let (greenCircuit0, greenCircuit1) <- split greenCircuit
  -- let redCircuit <- makeRedCircuit greenCircuit0 plastic1.less cable1.less
  -- let blueCircuit <- makeBlueCircuit acid.less greenCircuit1.less redCircuit.less

  -- let _ <- makeRocket blueCircuit.less lowDensityStruct rocketFuel.less

def main : IO Unit :=
  IO.println (glebaFactory.toBlueprint) --  (bootstrap := true))
