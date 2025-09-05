import Functorio.Abbreviations
import Functorio.AssemblyLine
import Functorio.Bus

namespace Readme

def makeIron : IronOre 300 -> Bus (Iron 300) :=
  busAssemblyLine (recipe .ironPlate) 8

def makeCopper : CopperOre 150 -> Bus (Copper 150) :=
  busAssemblyLine (recipe .copperPlate) 4

def makeGear : Iron 300 -> Bus (Gear 150) :=
  busAssemblyLine (recipe .ironGearWheel) 1

def makeRedScience : Copper 150 -> Gear 150 -> Bus (RedScience 150) :=
  busAssemblyLine (recipe .automationSciencePack) 10

def makeSteel : Iron 2700 -> Bus (Steel 540) :=
  busAssemblyLine (recipe .steelPlate) 72

def makeBelt : Iron 150 -> Gear 150 -> Bus (YellowBelt 300):=
  busAssemblyLine (recipe .transportBelt) 1

def makeAcid : Water 6000 -> Sulfur 300 -> Iron 60 ->Bus (Acid 3000) :=
  busAssemblyLine (recipe .sulfuricAcid) 1

def redScience := bus do
  let ironOre <- input .ironOre 300
  let copperOre <- input .copperOre 150

  let iron : Iron 300 <- makeIron ironOre
  let copper : Copper 150 <- makeCopper copperOre
  let gear : Gear 150 <- makeGear iron
  let _science : RedScience 150 <- makeRedScience copper gear

def gearFactory := bus do
  let ironOre : IronOre 300 <- input .ironOre 300
  let iron : Iron 300 <- makeIron ironOre
  let _gear <- makeGear iron

def splitIron := bus do
  let iron : Iron 450 <- input .ironPlate 450
  let (iron0, iron1) <- split (left:=300) (right:=150) iron
  let gear <- makeGear iron0
  let belt <- makeBelt iron1 gear

def mergeSteel := bus do
  let iron0 <- input .ironPlate 2700
  let iron1 <- input .ironPlate 2700
  let steel0 <- makeSteel iron0
  let steel1 <- makeSteel iron1
  let steel <- merge steel0 steel1

def acidFactory := bus do
  let iron <- input .ironPlate 60
  let sulfur <- input .sulfur 300
  let water <- input .water 6000
  let _ <- makeAcid water sulfur iron

def gearFactory1 :=
  station (recipe .ironGearWheel)

def gearFactory3 :=
  assemblyLine (recipe .ironGearWheel) 3

def readme :=
  columnList [
    capAll redScience.refinedConcreteFloor,
    capAll gearFactory.refinedConcreteFloor,
    capAll splitIron.refinedConcreteFloor,
    capAll mergeSteel.refinedConcreteFloor,
    capAll acidFactory.refinedConcreteFloor,
    capAll gearFactory1.refinedConcreteFloor,
    capAll gearFactory3.refinedConcreteFloor
  ]

end Readme
