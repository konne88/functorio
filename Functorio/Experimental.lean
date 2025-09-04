import Functorio.Factory
import Functorio.Bus
import Functorio.Ascii
import Functorio.AssemblyLine

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
