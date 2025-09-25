import Functorio
import Functorio.AssemblyLine

instance : Config where
  generateBigPoles := true
  generateRoboports := true
  adapterMinHeight := 3
  -- extraStations := 1

-- def x : BusAssemblyLineType { recipe := .yumakoProcessing, fabricator := .assemblingMachine2} 9 :=
--   by simp!


def makeBootstrapMash : Yumako 405 -> Bus (YumakoMash 810 × YumakoSeed (81/10)) :=
  busAssemblyLine { recipe := .yumakoProcessing, fabricator := .assemblingMachine2} 9

-- def makeNutrientsFromSpoilage: Spoilage 75 → Bus (Nutrients (15/2)) := by exact
--   (busAssemblyLine (recipe .nutrientsFromSpoilage) (1/5))


-- def x : (BusAssemblyLineType { recipe := .nutrientsFromSpoilage, fabricator := .assemblingMachine2} 1) :=
--   by simp!



def makeNutrientsFromSpoilage: Spoilage 225 → Bus (Nutrients (45/2)) := by exact
  (busAssemblyLine { recipe := .nutrientsFromSpoilage, fabricator := .assemblingMachine2} 1)

def makeNutrientsFromYumakoMash0 : Nutrients (45/2) → YumakoMash 585 → Bus (Nutrients 270 × YumakoMash 465 × Nutrients (15/2)) := by exact
  (busAssemblyLine (recipe .nutrientsFromYumakoMash [(465, .yumakoMash), (15/2, .nutrients)]) 1)

-- 165, 4

-- 915/4


-- def x : (BusAssemblyLineType (recipe .nutrientsFromYumakoMash) 3) :=
--   by simp!

-- def x : (BusAssemblyLineType (recipe .nutrientsFromYumakoMash) (11/4)) :=
--   by simp!


-- ⊢ BusLane Ingredient.nutrients (165, 4) →
--   BusLane Ingredient.yumakoMash (330, 1) → Bus (BusLane Ingredient.nutrients (1485, 2))
-- All Messages (3)


-- def makeNutrientsFromYumakoMash1 : Nutrients 270 → YumakoMash 330 → Bus (Nutrients (1485/2) × YumakoMash 0 × Nutrients (915/4)) :=
--   by exact (busAssemblyLine (recipe .nutrientsFromYumakoMash [(0, .yumakoMash), (915/4, .nutrients)]) (11/4))


def makeNutrientsFromYumakoMash1 : Nutrients (555/2) → YumakoMash 465 → Bus (Nutrients 810 × YumakoMash 105 × Nutrients (465/2)) :=
  by exact (busAssemblyLine (recipe .nutrientsFromYumakoMash [(105, .yumakoMash), (465/2, .nutrients)]) 3)

-- ⊢ BusLane Ingredient.nutrients (45, 1) →
--   BusLane Ingredient.yumakoMash (360, 1) → Bus (BusLane Ingredient.nutrients (810, 1))

-- 270 + 540

def bootstrapNutrients (yumako:Yumako 405) : Bus (Nutrients 810 × YumakoSeed (81/10)) := do
  let (mash, seeds) <- makeBootstrapMash yumako
  let (mashToSpoil, mash) <- splitBalanced (left:=225) mash
--  let (mash1, mash2) <- splitBalanced (left:=40) (right:=480) mash

  let spoilage <- spoilingChamber mashToSpoil
  let nutrients <- makeNutrientsFromSpoilage spoilage


  let (nutrients0, mash, nutrients1) <- makeNutrientsFromYumakoMash0 nutrients mash
  let nutrients <- merge nutrients0 nutrients1
  let (nutrients0, mash, nutrients1) <- makeNutrientsFromYumakoMash1 nutrients mash
  let nutrients <- merge nutrients0 nutrients1

  -- 495 + 540

  return (nutrients.less, seeds)


-- def x :   BusAssemblyLineType { recipe := .yumakoProcessing, fabricator := .assemblingMachine3} (56/10)
--  := by simp!


-- def makeBootstrapMash : Yumako 420 -> Bus (YumakoMash 840 × YumakoSeed (42/5)) := by exact
--   (busAssemblyLine { recipe := .yumakoProcessing, fabricator := .assemblingMachine3} (28/5))

-- def makeNutrientsFromSpoilage: Spoilage 375 → Bus (Nutrients (75/2)) := by exact
--   (busAssemblyLine (recipe .nutrientsFromSpoilage) 1)

-- def makeNutrientsFromYumakoMash0 : Nutrients 5 → YumakoMash 40 → Bus (Nutrients 90) := by exact
--   (busAssemblyLine (recipe .nutrientsFromYumakoMash) (1/3))

-- def makeNutrientsFromYumakoMash1 : Nutrients 60 → YumakoMash 480 → Bus (Nutrients 1080) :=
--   busAssemblyLine (recipe .nutrientsFromYumakoMash) 4

-- def bootstrapNutrients (yumako:Yumako 420) : Bus (Nutrients 810 × YumakoSeed 6) := do
--   let (mash, seeds) <- makeBootstrapMash yumako
--   let (mash0, mash) <- splitBalanced (left:=375) mash
-- --  let (mash1, mash2) <- splitBalanced (left:=40) (right:=480) mash

--   let spoilage <- spoilingChamber mash0
--   let nutrients <- makeNutrientsFromSpoilage spoilage
--   let nutrients <- makeNutrientsFromYumakoMash0 nutrients.less mash1
--   let nutrients <- makeNutrientsFromYumakoMash1 nutrients.less mash2

--   return (nutrients.less, seeds)


-- def x : BusAssemblyLineType
--     (recipe RecipeName.bioflux [(0, Ingredient.jelly), (0, Ingredient.yumakoMash), (210, Ingredient.nutrients)]) 9 :=


def makeBioflux0 : Nutrients 345 -> YumakoMash 2700 -> Jelly 2700 -> Bus (Bioflux 1080 × Jelly 540 × YumakoMash 0 × Nutrients 210) :=
  busAssemblyLine (recipe .bioflux [(540, .jelly), (0, .yumakoMash), (210, .nutrients) ]) 9

def makeBioflux1 : Nutrients 210 -> YumakoMash 2700 -> Jelly 2700 -> Bus (Bioflux 1080 × Jelly 540 × YumakoMash 0 × Nutrients 75) :=
  busAssemblyLine (recipe .bioflux [(540, .jelly), (0, .yumakoMash), (75, .nutrients) ]) 9


-- def makeBioflux (nutrients:Nutrients 345) (mash:Vector (YumakoMash 2700) 2) (jelly:Vector (Jelly 2160) 2) : Bus (Bioflux 2160 × Nutrients 75) := do
-- --  let (nutrients0, nutrients) <- splitBalanced nutrients


-- -- 135 nutrients each
-- -- [(160, .jelly), (100, .yumakoMash), (85, .nutrients) ]

--   let (bioflux0, nutrients) <- busAssemblyLine (recipe .bioflux [(210, .nutrients)]) 9 nutrients mash[0] jelly[0]
--   let (bioflux1, nutrients) <- busAssemblyLine (recipe .bioflux [(75, .nutrients)]) 9 nutrients mash[1] jelly[1]

--   let bioflux <- merge bioflux0 bioflux1
--   return (bioflux, nutrients)

-- TODO: why do I need the "by exact" here?





def makeNutrients0 : Nutrients 75 -> Bioflux 300 -> Bus (Nutrients 2700 × Nutrients 60) :=
  busAssemblyLine (recipe .nutrientsFromBioflux [(60, .nutrients)]) 1

def makeNutrients1 : Nutrients 60 -> Bioflux 300 -> Bus (Nutrients 2700 × Nutrients 45) :=
  busAssemblyLine (recipe .nutrientsFromBioflux [(45, .nutrients)]) 1

--  Bus
--         (BusLane Ingredient.pentapodEgg (192, 1) ×
--           BusLane Ingredient.pentapodEgg (10, 1) × BusLane Ingredient.nutrients (10, 1))

def loopbackPentapodEggs (water:Water 3840) (nutrients:Nutrients 2700) : Bus (Nutrients 660 × PentapodEgg 128) := do
  let process := recipe .pentapodEgg [(660, .nutrients), (128, .pentapodEgg)]
  let factoryNoLoopback := assemblyLine process 8
  let loopback : Factory (assemblyLineInterface process) [] [(.water, .N), (.nutrients, .N), (.nutrients, .S), (.pentapodEgg, .S)] [] := {
    entities := [
      pipe 1 0, pipe 1 1, pipe 1 2,
      belt 3 0 .N, belt 3 1 .N,
      belt 4 1 .W, belt 5 1 .W, belt 6 1 .W, belt 7 1 .W, belt 8 1 .W, belt 9 1 .W, belt 10 1 .W,
      beltUp 9 0 .N, beltDown 9 2 .N,
      belt 10 0 .S,
      belt 11 0 .S, belt 11 1 .S, belt 11 2 .S,
      belt 12 0 .S, belt 12 1 .S, belt 12 2 .S,
    ]
    interface := {
      n := #v[1, 3, 9, 10, 11, 12],
      e := #v[],
      s := #v[1, 9, 11, 12],
      w := #v[],
    }
    wires := []
    width := 13
    height := 3
    name := "makePentapodEggsLoopbackInner"
  }

  let factory := column factoryNoLoopback loopback
  let namedFactory := factory.setName "makePentapodEggsLoopback"

  let indexes <- busTapGeneric
    [water.toBusLane', nutrients.toBusLane']
    [.nutrients, .pentapodEgg]
    namedFactory

  return ({index:=indexes[0]!}, {index:=indexes[1]!})



-- def x : BusAssemblyLineType (recipe .pentapodEgg) 10 :=
--   by simp!


def amplifyPentapodEggs : Water 4800 -> PentapodEgg 128 -> Nutrients 2700 -> Bus (PentapodEgg 240 × Nutrients 150 × PentapodEgg 48) :=
  busAssemblyLine (recipe .pentapodEgg [(150, .nutrients), (48, .pentapodEgg)]) 10


-- ⊢ BusLane Ingredient.water (4800, 1) →
--   BusLane Ingredient.pentapodEgg (80, 1) →
--     BusLane Ingredient.nutrients (2550, 1) → Bus (BusLane Ingredient.pentapodEgg (240, 1))


-- (eggsLoopIn:PentapodEgg 112)
def makePentapodEggs (water:Water 8640) (nutrients : Vector (Nutrients 2700) 2) : Bus (PentapodEgg 288 × Nutrients 810) := do
  let (water0, water1) <- split water
  let (nutrients0, eggs) <- loopbackPentapodEggs water0 nutrients[0]
  let (eggs0, nutrients1, eggs1) <- amplifyPentapodEggs water1 eggs nutrients[1]

  let eggs <- merge eggs0 eggs1
  let nutrients <- merge nutrients0 nutrients1

  return (eggs, nutrients)

-- 810 -> 288
def makeAgriculturalScience : Nutrients 810 -> Bioflux 210 -> PentapodEgg 288 -> Bus (AgriculturalScience 315 × PentapodEgg 78 × Nutrients 705) :=
  busAssemblyLine (recipe .agriculturalSciencePack [(78, .pentapodEgg), (705, .nutrients)]) 7

-- attribute [simp] Nat.gcd

-- def x :   BusAssemblyLineType (recipe .copperBacteriaCultivation) 2 :=
-- by simp!


-- def x :   BusAssemblyLineType (recipe .copperBacteriaCultivation [(126, .copperBacteria), (630, .nutrients)]) 2 :=
-- by simp!


def cultivateCopperBacteria0 : Nutrients 705 -> YumakoMash 1080 -> Bus (CopperBacteria 36 × Spoilage 360 × YumakoMash 360 × Nutrients 675):=
  busAssemblyLine (recipe .copperBacteria [(360, .yumakoMash), (675, .nutrients)]) 2

def cultivateCopperBacteria1 : Nutrients 675 -> CopperBacteria 36 -> Bioflux 30 -> Bus (CopperBacteria 180 × CopperBacteria 6 × Nutrients 660):=
  busAssemblyLine (recipe .copperBacteriaCultivation [(6, .copperBacteria), (660, .nutrients)]) 1

def cultivateCopperBacteria2 : Nutrients 660 -> CopperBacteria 186 -> Bioflux 60 -> Bus (CopperBacteria 360 × CopperBacteria 126 × Nutrients 630):=
  busAssemblyLine (recipe .copperBacteriaCultivation [(126, .copperBacteria), (630, .nutrients)]) 2

def cultivateCopperBacteria3 : Nutrients 630 -> CopperBacteria 486 -> Bioflux 270 -> Bus (CopperBacteria 1620 × CopperBacteria 216 × Nutrients 495):=
  busAssemblyLine (recipe .copperBacteriaCultivation [(216, .copperBacteria), (495, .nutrients)]) 9


-- def cultivateCopperBacteria2 : Nutrients 30 -> CopperBacteria 60 -> Bioflux 60 -> Bus (CopperBacteria 360):=
--   busAssemblyLine (recipe .copperBacteriaCultivation) 2

-- def cultivateCopperBacteria3 : Nutrients 135 -> CopperBacteria 270 -> Bioflux 270 -> Bus (CopperBacteria 1620):=
--   busAssemblyLine (recipe .copperBacteriaCultivation) 9

def makeBacteriaCopper (nutrients:Nutrients 705) (mash:YumakoMash 1080) (bioflux:Bioflux 360) : Bus (CopperOre 1836 × YumakoMash 360 × Spoilage 360 × Nutrients 495) := do
  let (bioflux0, bioflux) <- split bioflux
  let (bioflux1, bioflux2) <- split bioflux

--  let (nutrients0, nutrients) <- splitBalanced nutrients
  let (bacteria, spoilage, mash, nutrients) <- cultivateCopperBacteria0 nutrients mash

--  let (nutrients1, nutrients) <- splitBalanced nutrients
  let (bacteria0, bacteria1, nutrients) <- cultivateCopperBacteria1 nutrients bacteria bioflux0
  let bacteria <- merge bacteria0 bacteria1

--  let (nutrients2, nutrients) <- splitBalanced nutrients
  let (bacteria0, bacteria1, nutrients) <- cultivateCopperBacteria2 nutrients bacteria bioflux1
  let bacteria <- merge bacteria0 bacteria1

--  let (nutrients3, nutrients) <- splitBalanced nutrients
  let (bacteria0, bacteria1, nutrients) <- cultivateCopperBacteria3 nutrients bacteria bioflux2
  let bacteria <- merge bacteria0 bacteria1

  let ore <- spoilingChamber bacteria
  return (ore, mash, spoilage, nutrients)



-- def cultivateIronBacteria0 : Nutrients 30 -> Jelly 1440 -> Bus (Spoilage 1440 × IronBacteria 36):=
--   busAssemblyLine (recipe .ironBacteria) 2


def cultivateIronBacteria0 : Nutrients 495 -> Jelly 2700 -> Bus (Spoilage 1440 × IronBacteria 36 × Jelly 1260 × Nutrients 465):=
  busAssemblyLine (recipe .ironBacteria [(1260, .jelly), (465, .nutrients)]) 2

-- def cultivateCopperBacteria0 : Nutrients 705 -> YumakoMash 1080 -> Bus (CopperBacteria 36 × Spoilage 360 × YumakoMash 360 × Nutrients 675):=
--   busAssemblyLine (recipe .copperBacteria [(360, .yumakoMash), (675, .nutrients)]) 2


-- def cultivateIronBacteria1 : Nutrients 15 -> IronBacteria 30 -> Bioflux 30 -> Bus (IronBacteria 180):=
--   busAssemblyLine (recipe .ironBacteriaCultivation) 1

def cultivateIronBacteria1 : Nutrients 465 -> IronBacteria 36 -> Bioflux 30 -> Bus (IronBacteria 180 × IronBacteria 6 × Nutrients 450) :=
  busAssemblyLine (recipe .ironBacteriaCultivation [(6, .ironBacteria), (450, .nutrients)]) 1

-- def cultivateIronBacteria2 : Nutrients 75 -> IronBacteria 150 -> Bioflux 150 -> Bus (IronBacteria 900):=
--   busAssemblyLine (recipe .ironBacteriaCultivation) 5

def cultivateIronBacteria2 : Nutrients 450 -> IronBacteria 186 -> Bioflux 150 -> Bus (IronBacteria 900 × IronBacteria 36 × Nutrients 375):=
  busAssemblyLine (recipe .ironBacteriaCultivation [(36, .ironBacteria), (375, .nutrients)]) 5

def makeBacteriaIron (nutrients:Nutrients 495) (jelly:Jelly 2700) (bioflux:Bioflux 180) : Bus (IronOre 936 × Jelly 1260 × Spoilage 1440 × Nutrients 375) := do
  let (bioflux0, bioflux1) <- split bioflux

--  let (nutrients0, nutrients) <- splitBalanced nutrients
  let (spoilage, bacteria, jelly, nutrients) <- cultivateIronBacteria0 nutrients jelly
--  let (nutrients1, nutrients) <- splitBalanced nutrients
  let (bacteria0, bacteria1, nutrients) <- cultivateIronBacteria1 nutrients bacteria bioflux0
  let bacteria <- merge bacteria0 bacteria1

--  let (nutrients2, nutrients) <- splitBalanced nutrients
  let (bacteria0, bacteria1, nutrients) <- cultivateIronBacteria2 nutrients bacteria bioflux1
  let bacteria <- merge bacteria0 bacteria1

  let ore <- spoilingChamber bacteria

  return (ore, jelly, spoilage, nutrients)

-- 360 + 1440 = 1800

def makeBioSulfur : Nutrients 375 -> Spoilage 1800 -> Bioflux 180 -> Bus (Sulfur 540 × Spoilage 900 × Nutrients 330) :=
  busAssemblyLine (recipe .biosulfur [(900, .spoilage), (330, .nutrients)]) 3

def makeBioPlastic : Nutrients 330 -> Bioflux 60 -> YumakoMash 360 -> Bus (Plastic 270 × YumakoMash 120 × Nutrients 315) :=
  busAssemblyLine (recipe .bioplastic [(120, .yumakoMash), (315, .nutrients)]) 1

def makeLowDensityStructure : Steel 40 -> Copper 400 -> Plastic 100 -> Bus (LowDensityStructure 20) :=
  busAssemblyLine (recipe .lowDensityStructure) 4

def makeAcid : Water 6000 -> Sulfur 300 -> Iron 60 -> Bus (Acid 3000) :=
  busAssemblyLine (recipe .sulfuricAcid) 1

def makeCopper : CopperOre 1500 -> Bus (Copper 1500) :=
  busAssemblyLine (recipe .copperPlate) 40

def makeIron : IronOre 900 -> Bus (Iron 900) :=
  busAssemblyLine (recipe .ironPlate) 24

def makeSteel : Iron 225 -> Bus (Steel 45) :=
  busAssemblyLine (recipe .steelPlate) 6

-- 720


-- 315
def makeBioRocketFuel : Water 720 -> Nutrients 315 -> Jelly 1260 -> Bioflux 48 -> Bus (RocketFuel 36 × Jelly 540 × Nutrients 285) :=
  busAssemblyLine (recipe .rocketFuelFromJelly [(540, .jelly), (285, .nutrients)]) 2

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
  let yumako <- input .yumako 2685
  let jellynut <- input .jellynut 1440
 -- let spoilage <- input .spoilage 750
--  let eggs <- input .pentapodEgg 112
  -- let bioChamberNutrients <- input .nutrients 810
  let water <- input .water 15360

  let (yumako0, yumako1) <- split (left:=405) (right:=2280) yumako

  let (bioChamberNutrients, yumakoSeed0) <- bootstrapNutrients yumako0

  let (jelly, jellySeed, bioChamberNutrients) <- makeJelly bioChamberNutrients jellynut

  let (mash, mashPartial, yumakoSeed, bioChamberNutrients) <- makeMash bioChamberNutrients yumako1
--  let yumakoSeed <- merge yumakoSeed0 yumakoSeed1

  let (bioflux0, _, _, bioChamberNutrients) <- makeBioflux0 bioChamberNutrients mash[0] jelly[0]
  let (bioflux1, _, _, bioChamberNutrients) <- makeBioflux1 bioChamberNutrients mash[1] jelly[1]
  let bioflux <- merge bioflux0 bioflux1
  let (bioflux0, bioflux) <- split bioflux
  let (bioflux1, bioflux) <- split bioflux
  let (bioflux2, bioflux) <- split bioflux

  let (water0, water) <- split (left:=8640) water

--  let (nutrients, bioChamberNutrients) <- splitBalanced (left:=45/4) bioChamberNutrients
  let (nutrients0, bioChamberNutrients) <- makeNutrients0 bioChamberNutrients bioflux0

--  let (bioflux1, bioflux) <- split bioflux
  let (nutrients1, _) <- makeNutrients1 bioChamberNutrients bioflux1

  let (eggs, bioChamberNutrients) <- makePentapodEggs water0 #v[nutrients0, nutrients1]

--  let (nutrients, bioChamberNutrients) <- splitBalanced (left:=105) (input:=525) bioChamberNutrients.less
  let (_, _, bioChamberNutrients) <- makeAgriculturalScience bioChamberNutrients bioflux2 eggs

  pipePumps   -- Right around here, the pipes on the bus are so long that they need pumps.

--  let (mash0, mash1) <- splitBalanced mashPartial
  let (bioflux3, bioflux) <- split bioflux
  let (copperOre, mash, spoilage0, bioChamberNutrients) <- makeBacteriaCopper bioChamberNutrients mashPartial bioflux3

--  let (jelly0, jelly1) <- splitBalanced (input:=2160) jelly[2].less

  let (bioflux4, bioflux) <- split bioflux
  let (ironOre, jelly, spoilage1, bioChamberNutrients) <- makeBacteriaIron bioChamberNutrients jelly[2] bioflux4

  let (water1, water2) <- split (right:=6000) water


  let spoilage <- merge spoilage0 spoilage1

  let (bioflux5, bioflux) <- split bioflux
  -- let (nutrients, bioChamberNutrients) <- splitBalanced (left:=45) bioChamberNutrients
  let (sulfur, _, bioChamberNutrients) <- makeBioSulfur bioChamberNutrients spoilage bioflux5

  let (bioflux6, bioflux) <- split bioflux
  -- let (nutrients, bioChamberNutrients) <- splitBalanced (left:=15) bioChamberNutrients
  let (plastic, _, bioChamberNutrients) <- makeBioPlastic bioChamberNutrients bioflux6 mash

  -- let (bioflux7, _) <- split bioflux
  let rocketFuel <- makeBioRocketFuel water1 bioChamberNutrients jelly bioflux.less

--  makeNonBiologicalComponents copperOre ironOre water2 sulfur plastic rocketFuel

def main : IO Unit :=
  IO.println (glebaFactory.toBlueprint) --  (bootstrap := true))
