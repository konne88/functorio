import Functorio.Factory
import Functorio.Ingredient
import Functorio.Bus
import Functorio.Ascii
import Functorio.AssemblyLine

/-
a : 20 crude -> 10 water -> (11 petrol, 9 light, 5 heavy)
b : 20 heavy -> 15 water -> 15 light
c : 15 light -> 15 water -> 10 petrol
d : 10 heavy -> 10 lube
-/

def advancedOilProcessingFactory : CrudeOil 38400 -> Water 19200 -> Bus (HeavyOil 9600 × LightOil 17280 × Petrolium 21120) :=
  sorry -- busAssemblyLine .advancedOilProcessing 32

def heavyOilCrackingFactory : HeavyOil 8400 -> Water 6300 -> Bus (LightOil 6300) :=
  busAssemblyLine .heavyOilCracking 7

def lightOilCrackingFactory : LightOil 23400 -> Water 23400 -> Bus (Petrolium 15600) :=
  busAssemblyLine .lightOilCracking 26

def lubricantFactory : HeavyOil 1200 -> Bus (Lubricant 1200) :=
  busAssemblyLine .lubricant 2

def oilFactory (water:Water 48900) (crude:CrudeOil 38400) : Bus (Lubricant 900 × Petrolium 36000) := do
  let (water0, rest) <- split (left:=19200) water
  let (water1, water2) <- split (left:=6300) rest

  let (heavy, light0, petrol0) <- advancedOilProcessingFactory crude water0
  let (heavy0, heavy1) <- split (left:=1200) heavy

  let lube <- lubricantFactory heavy0

  let light1 <- heavyOilCrackingFactory heavy1 water1
  let light <- merge light0 light1

  let petrol1 <- lightOilCrackingFactory light.less water2
  let petrol <- merge petrol0 petrol1

  return (lube.less, petrol.less)



def test0 := bus do
  let iron : Iron 300 <- input .ironPlate 300
  let copper : Copper 15 <- input .copperPlate 15

  let gear : Gear 150 <- busAssemblyLine .ironGearWheel 1 iron
  let red : RedScience 15 <- busAssemblyLine .automationSciencePack 1 copper gear.less

def test1 := bus do
  let copper : Copper 300 <- input .copperPlate 300
  let iron0 : Iron 600 <- input .ironPlate 600
  let iron1 : Iron 150 <- input .ironPlate 150
  let iron2 : Iron 150 <- input .ironPlate 150
  let iron3 : Iron 150 <- input .ironPlate 150

  let gear : Gear 300 <- busAssemblyLine .ironGearWheel 2 iron0
  let (gear0, gear1) <- split gear (left:=150) (right:=150)

  let cable : Cable 600 <- busAssemblyLine .copperCable 2 copper
  let circuit : GreenCircuit 150 <- busAssemblyLine .electronicCircuit 1 iron1 cable.less
  let inserter : Inserter 150 <- busAssemblyLine .inserter 1 iron2 gear1 circuit
  let belt : YellowBelt 300 <- busAssemblyLine .transportBelt 1 iron3 gear0

  let green : GreenScience 150 <- busAssemblyLine .logisticSciencePack 12 inserter belt.less



-- 10x as much ammonia as ice
def makeAmmonia : AmmoniacalSolution 6000 -> Bus (Ice 600 × Ammonia 6000) :=
  busAssemblyLine .ammonia 1

-- 8x as much ammonia as ice
def makeIcePlatform : Ammonia 1000 -> Ice 125 -> Bus (IcePlatform (5/2)) :=
  busAssemblyLine .icePlatform 1

def makeSolidFuelFromAmmonia : Ammonia 18000 -> CrudeOil 7200 -> Bus (SolidFuel 1200) :=
  busAssemblyLine .solidFuelFromAmmonia 5

def makeLithium : Ammonia 1800 ->  LithiumBrine 1800 -> Holmium 36 -> Bus (Lithium 180) :=
  busAssemblyLine .lithium 6

def makeLithiumPlate : Lithium 150 -> Bus (LithiumPlate 150) :=
  busAssemblyLine .lithiumPlate 16

def makeHotFluoroketone : Ammonia 600 -> Fluorine 600 -> SolidFuel 12 -> Lithium 12 -> Bus (HotFluoroketone 600) :=
 busAssemblyLine .hotFluoroketone 1

def makeColdFluoroketone : HotFluoroketone 960 → Bus (ColdFluoroketone 960) :=
 busAssemblyLine .coldFluoroketone 4

def makeCryogenicScience : ColdFluoroketone 900 -> Ice 450 -> LithiumPlate 150 -> Bus (CryogenicScience 150 × HotFluoroketone 450) :=
  busAssemblyLine .cryogenicSciencePack 25

def aquiloFactory := bus do
  let holmium <- input .holmiumPlate 36
  let crudeOil <- input .crudeOil 7200
  let ammoniacalSolution <- input .ammoniacalSolution 0
  let lithiumBrine <- input .lithiumBrine 1800
  let fluorine <- input .fluorine 600
  let hotFluoroketone0 <- input .hotFluoroketone 450


-- ammonica: 1800 + 600 = 2400 + 18000 = 20400
-- ice: 450

  let (ammonia, ice) <- _
  let (ice0, ice1) <- split (right:=450) ice
  let icePlatform_ <- _        --                  30000
  let (ammonia0, rest) <- split (left:=18000) ammonia
  let (ammonia1, ammonia2) <- split (left:=1800) (right:=600) rest
  let solidFuel <- makeSolidFuelFromAmmonia ammonia0 crudeOil
  let lithium <- makeLithium ammonia1 lithiumBrine holmium
  let (lithium0, lithium1) <- split lithium
  let lithiumPlate <- makeLithiumPlate lithium0

  let hotFluoroketone1 <- makeHotFluoroketone ammonia2 fluorine solidFuel lithium1
  let hotFluoroketone <- merge hotFluoroketone0 hotFluoroketone1
  let coldFluoroketone <- makeColdFluoroketone hotFluoroketone.less
  let (science_, hotFluoroketoneOut_) <- makeCryogenicScience coldFluoroketone.less ice1 lithiumPlate
