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

-- def x : BusAssemblyLineType (recipe .bioflux) 10 := by simp!

def makeBioflux (nutrients:Nutrients 990) (mash:Vector (YumakoMash 2700) 2) (jelly:Vector (Jelly 2160) 2) : Bus (Bioflux 2160 × Nutrients 720) := do
  let (nutrients0, nutrients) <- splitBalanced nutrients
  let bioflux0 : Bioflux 1080 <- busAssemblyLine (recipe .bioflux) 9 nutrients0 mash[0] jelly[0]

  let (nutrients1, nutrients) <- splitBalanced nutrients
  let bioflux1 : Bioflux 1080 <- busAssemblyLine (recipe .bioflux) 9 nutrients1 mash[1] jelly[1]

  let bioflux <- merge bioflux0 bioflux1
  return (bioflux, nutrients)

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

-- def x : BusAssemblyLineType (recipe .pentapodEgg) 5 := by simp!

-- 72 + 40 = 112
-- 120

def makePentapodEggs (eggsLoopIn:PentapodEgg 112) (water:Water 6720) (nutrients : Vector (Nutrients 2700) 2) : Bus (PentapodEgg 216 × Nutrients 1425) := do
  let (water0, water1) <- split water
--  let (eggs0, eggs1) <- splitBalanced eggs
  let (nutrients0, nutrientsOut) <- splitBalanced (left:=1275) nutrients[0]
  let eggsLoopOut <- busAssemblyLine (recipe .pentapodEgg) 5 water1 eggsLoopIn.less nutrients0
  let eggsOut <- busAssemblyLine (recipe .pentapodEgg) 9 water0 eggsLoopOut.less nutrients[1].less
--  let eggs <- merge eggs0 eggs1
  return (eggsOut, nutrientsOut)

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

-- def copperSpoilingChamber {n} (bacteria:CopperBacteria n) : Bus (CopperOre n) :=
--   let factory := {
--     width := 4
--     height := 9
--     wires := []
--     entities := [

--     ]
--     interface := {
--       n := #v[]
--       e := #v[]
--       s := #v[2,3]
--       w := #v[]
--     }
--     name := "spoilingChamber"
--   }



--   busTap [bacteria] factory

def spoilingChamber {n} {input:Ingredient} {output:Ingredient} (bacteria:BusLane input n) : Bus (BusLane output n) :=
  let factory : Factory [] [] [(input, .N), (output, .S)] [] := {
    name := s!"spoilingChamber {reprStr input}",
    width := 4,
    height := 9,
    entities := [
      belt 1 0 .E,
      belt 2 0 .E,
      belt 2 0 .S,

      belt 0 1 .E,
      belt 1 1 .N,
      belt 2 1 .W,
      belt 3 1 .S,

      belt 0 2 .N,
      splitter 1 2 .N,
      belt 3 2 .S,

      belt 0 3 .N,
      splitter 1 3 .E,
      belt 2 3 .N,
      belt 3 3 .S,

      beltUp 0 4 .N,
      beltUp 2 4 .N,
      belt 3 4 .S,

      inserter 0 5 .S [output],
      inserter 1 5 .S [output],
      inserter 2 5 .S [output],
      beltDown 3 5 .S,

      ironChest 0 6,
      ironChest 1 6,
      ironChest 2 6,
      pole 3 6,

      inserter 0 7 .S,
      inserter 1 7 .S,
      inserter 2 7 .S,
      beltUp 3 7 .S,

      belt 0 8 .E,
      belt 1 8 .E,
      belt 2 8 .E,
      belt 3 8 .S,
    ],
    wires := [],
    interface := {
      n := #v[],
      e := #v[],
      s := #v[2, 3],
      w := #v[]
    }
  }
  busTap [bacteria] (unsafeFactoryCast factory)

def makeBacteriaCopper (nutrients:Nutrients 1320) (mash:YumakoMash 720) (bioflux:Bioflux 360) : Bus (CopperOre 1500 × Spoilage 360 × Nutrients 1110) := do
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

def makeBacteriaIron (nutrients:Nutrients 120) (jelly:Jelly 1440) (bioflux:Bioflux 180) : Bus (IronOre 900 × Spoilage 1440) := do
  let (nutrients0, nutrients) <- splitBalanced nutrients
  let (nutrients1, nutrients2) <- splitBalanced nutrients

  let (bioflux0, bioflux1) <- splitBalanced bioflux
  let (spoilage, bacteria0) <- cultivateIronBacteria0 nutrients0 jelly
  let bacteria1 <- cultivateIronBacteria1 nutrients1 bacteria0.less bioflux0
  let bacteria2 <- cultivateIronBacteria2 nutrients2 bacteria1.less bioflux1
  let ore <- spoilingChamber bacteria2
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

def makeJellyFullBelt : Nutrients 60 -> Jellynut 480 -> Bus (Jelly 2700 × JellynutSeed (72/5)) :=
  busAssemblyLine (recipe .jellynutProcessing) 4

def makeMashFullBelt : Nutrients 120 -> Yumako 960 -> Bus (YumakoMash 2700 × YumakoSeed (144/5)) :=
  busAssemblyLine (recipe .yumakoProcessing) 8

-- def adfs : BusAssemblyLineType (recipe .jellynutProcessing) 4 :=
--   by
--   simp!


  -- unfold BusAssemblyLineType
  -- simp!






def makeMashPartialBelt : Nutrients 45 -> Yumako 360 -> Bus (YumakoMash 1080 × YumakoSeed (54/5)) :=
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

def makeJelly (nutrients:Nutrients 1455) (jellynut:Jellynut 1440) : Bus (Vector (Jelly 2700) 3 × JellynutSeed (216 / 5) × Nutrients 1275):= do
  let (jellynut0, jellynut) <- split jellynut
  let (nutrients0, nutrients) <- splitBalanced (left:=60) nutrients
  let (jelly0, jellySeed0) <- makeJellyFullBelt nutrients0 jellynut0

  let (jellynut1, jellynut) <- split jellynut
  let (nutrients1, nutrients) <- splitBalanced (left:=60) nutrients
  let (jelly1, jellySeed1) <- makeJellyFullBelt nutrients1 jellynut1

  let jellynut2 := jellynut
  let (nutrients2, nutrients) <- splitBalanced (left:=60) nutrients
  let (jelly2, jellySeed2) <- makeJellyFullBelt nutrients2 jellynut2

  let jellySeed <- merge jellySeed0 jellySeed1
  let jellySeed <- merge jellySeed jellySeed2

  return (#v[jelly0, jelly1, jelly2], jellySeed, nutrients)

def makeMash (nutrients:Nutrients 1275) (yumako:Yumako 2700) : Bus (Vector (YumakoMash 2700) 2 × YumakoMash 1080 × YumakoSeed (342 / 5) × Nutrients 990):= do
  let (yumako0, yumako) <- split yumako
  let (nutrients0, nutrients) <- splitBalanced (left:=120) nutrients
  let (mash0, yumakoSeed0) <- makeMashFullBelt nutrients0 yumako0

  let (yumako1, yumako) <- split yumako
  let (nutrients1, nutrients) <- splitBalanced (left:=120) nutrients
  let (mash1, yumakoSeed1) <- makeMashFullBelt nutrients1 yumako1

  let yumako2 := yumako.less -- TODO: need to process it all!
  let (nutrients2, nutrients) <- split (left:=45) nutrients
  let (mash2, yumakoSeed2) <- makeMashPartialBelt nutrients2 yumako2

  let yumakoSeed <- merge yumakoSeed0 yumakoSeed1
  let yumakoSeed <- merge yumakoSeed yumakoSeed2

  return (#v[mash0, mash1], mash2, yumakoSeed, nutrients)

def glebaFactory := bus do
  let yumako <- input .yumako 2700
  let jellynut <- input .jellynut 1440 -- TODO: 1350 would be perfect, since it would be half a belt
  let eggs <- input .pentapodEgg 112
  let bioChamberNutrients <- input .nutrients 1455
  let water <- input .water 13440

  let (jelly, jellySeed, bioChamberNutrients) <- makeJelly bioChamberNutrients jellynut

  let (mash, mashPartial, yumakoSeed, bioChamberNutrients) <- makeMash bioChamberNutrients yumako

  let (jelly0, _) <- splitBalanced jelly[0]
  let (jelly1, _) <- splitBalanced jelly[1]
  let (bioflux, bioChamberNutrients) <- makeBioflux bioChamberNutrients mash #v[jelly0, jelly1]

  let (water0, water) <- split (left:=6720) water
--  let (water1, water2) <- split (right:=6720) water

  let (nutrients, bioChamberNutrients) <- splitBalanced (left:=45/4) bioChamberNutrients
  let (bioflux0, bioflux) <- split bioflux
  let nutrients0 <- makeNutrients nutrients bioflux0

  let (nutrients, bioChamberNutrients) <- splitBalanced (left:=45/4) bioChamberNutrients
  let (bioflux1, bioflux) <- split bioflux
  let nutrients1 <- makeNutrients nutrients bioflux1

  let (eggs, bioChamberNutrients) <- makePentapodEggs eggs water0 #v[nutrients0, nutrients1]
--  let (eggs, _) <- splitBalanced (right:=126) eggs

  let (nutrients, bioChamberNutrients) <- splitBalanced (left:=105) bioChamberNutrients
  let (bioflux2, bioflux) <- split bioflux
  let _ <- makeAgriculturalScience nutrients bioflux2 eggs.less

  let (mash0, mash1) <- splitBalanced mashPartial

  -- let (nutrients, bioChamberNutrients) <- splitBalanced (left:=210) bioChamberNutrients
  let (bioflux3, bioflux) <- split bioflux
  let (copperOre, spoilage0, bioChamberNutrients) <- makeBacteriaCopper bioChamberNutrients mash0 bioflux3

  -- let (jelly0, jelly1) <- splitBalanced jelly[0]
  -- let (nutrients, bioChamberNutrients) <- splitBalanced (left:=120) bioChamberNutrients
  -- let (bioflux4, bioflux) <- splitBalanced bioflux
  -- let (ironOre, spoilage1) <- makeBacteriaIron nutrients jelly0 bioflux4
  -- let spoilage <- merge spoilage0 spoilage1

  -- let (nutrients, bioChamberNutrients) <- splitBalanced (left:=45) bioChamberNutrients
  -- let (bioflux5, bioflux) <- splitBalanced bioflux
  -- let sulfur <- makeBioSulfur nutrients spoilage.less bioflux5

  -- let (nutrients, bioChamberNutrients) <- splitBalanced (left:=15) bioChamberNutrients
  -- let (bioflux6, bioflux7) <- splitBalanced bioflux
  -- let plastic <- makeBioPlastic nutrients bioflux6 mash1.less

  -- let (nutrients, bioChamberNutrients) <- splitBalanced (left:=30) bioChamberNutrients
  -- let rocketFuel <- makeBioRocketFuel water0 nutrients jelly1.less bioflux7.less

  -- makeNonBiologicalComponents copperOre ironOre water1 sulfur plastic rocketFuel

def main : IO Unit :=
  IO.println (glebaFactory.toBlueprint) --  (bootstrap := true))
