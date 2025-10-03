import Functorio

instance : Config where
  adapterMinHeight := 3

def makeWater : Ice 240 -> Bus (Water 4800) :=
  busAssemblyLine (recipe .iceMelting) 4

def makeFuel : Water 1200 -> Carbon 24 -> Calcite 12 -> Bus (ThrusterFuel 18000) :=
  busAssemblyLine (recipe .advancedThrusterFuel) 2

def makeOxidizer : Water 1200 -> IronOre 24 -> Calcite 12 -> Bus (ThrusterOxidizer 18000) :=
  busAssemblyLine (recipe .advancedThrusterOxidizer) 2

def meltIronOre : IronOre 750 -> Calcite 15 -> Bus (MoltenIron 11250) :=
  busAssemblyLine (recipe .moltenIron) 2

def meltCopperOre : CopperOre 750 -> Calcite 15 -> Bus (MoltenCopper 11250) :=
  busAssemblyLine (recipe .moltenCopper) 2

def castIronPlate : MoltenIron 3000 -> Bus (Iron 450) :=
  busAssemblyLine (recipe .castingIron) 2

def castCable : MoltenCopper 2400 -> Bus (Cable 1440) :=
  busAssemblyLine (recipe .castingCopperCable) 2

def castSteel : MoltenIron 4500 -> Bus (Steel 225) :=
  busAssemblyLine (recipe .castingSteel) 2

def makeYellowAmmo : Iron 300 -> Bus (YellowAmmo 75) :=
  busAssemblyLine (recipe .firearmMagazine) 1

def makeCoal : Water 600 -> Carbon 300 -> Sulfur 60 -> Bus (Coal 60) :=
  busAssemblyLine (recipe .coalSynthesis) 2

def makeExplosives : Water 300 -> Sulfur 30 -> Coal 30 -> Bus (Explosives 60) :=
  busAssemblyLine (recipe .explosives) 2

def makeRockets : Explosives (75/2) -> Iron 75 -> Bus (Rocket (75/2)) :=
    busAssemblyLine (recipe .rocket) 2

def makeRailgunAmmo : Steel 30 -> Cable 60 -> Explosives 12 -> Bus (RailgunAmmo 6) :=
    busAssemblyLine (recipe .railgunAmmo) 2

def spaceship := bus do
  let ice <- input .ice 240
  let sulfur <- input .sulfur 90
  let calcite <- input .calcite 54
  let ironOre <- input .ironOre 774
  let copperOre <- input .copperOre 750
  let carbon <- input .carbon 324

  let (calcite0, calcite) <- split calcite
  let (calcite1, calcite) <- split calcite
  let (calcite2, calcite3) <- split calcite

  let (ironOre0, ironOre1) <- split ironOre
  let (carbon0, carbon1) <- split carbon
  let (sulfur0, sulfur1) <- split sulfur

  let water <- makeWater ice
  let (water0, water) <- split water
  let (water1, water) <- split water
  let (water2, water3) <- split water

  let coal <- makeCoal water0 carbon0 sulfur0
  let explosives <- makeExplosives water1 sulfur1 coal.less
  let (explosives0, explosives1) <- split explosives

  let moltenCopper <- meltCopperOre copperOre calcite0
  let cable <- castCable moltenCopper.less

  let moltenIron <- meltIronOre ironOre0 calcite1
  let (moltenIron0, moltenIron1) <- split moltenIron
  let ironPlate <- castIronPlate moltenIron0
  let (ironPlate0, ironPlate1) <- split ironPlate
  let steel <- castSteel moltenIron1.less

  let railgunAmmo <- makeRailgunAmmo steel.less cable.less explosives0
  let rockets <- makeRockets explosives1.less ironPlate0
  let bullets <- makeYellowAmmo ironPlate1.less

  let fuel <- makeFuel water2 carbon1 calcite2
  let oxidizer <- makeOxidizer water3.less ironOre1.less calcite3

def main : IO Unit :=
  IO.println (spaceship.toBlueprint)
