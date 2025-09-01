import Functorio

def makeIron : IronOre 300 -> Bus (Iron 300) :=
  busAssemblyLine RecipeName.ironPlate 8

def makeCopper : CopperOre 150 -> Bus (Copper 150) :=
  busAssemblyLine RecipeName.copperPlate 4

def makeGear : Iron 300 -> Bus (Gear 150) :=
  busAssemblyLine RecipeName.ironGearWheel 1

def makeRedScience : Copper 150 -> Gear 150 -> Bus (RedScience 150) :=
  busAssemblyLine RecipeName.automationSciencePack 10

def redScience := bus do
  let ironOre <- input .ironOre 300
  let copperOre <- input .copperOre 150

  let iron : Iron 300 <- makeIron ironOre
  let copper : Copper 150 <- makeCopper copperOre
  let gear : Gear 150 <- makeGear iron
  let _science : RedScience 150 <- makeRedScience copper gear

def main : IO Unit :=
  IO.println (redScience.toBlueprint) --  (bootstrap := true))
