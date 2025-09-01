import Functorio

instance : Config where
  generateBigPoles := true
  generateRoboports := true
  providerChestCapacity := 3
  adapterMinHeight := 3

def ironFullBeltFactory : IronOre 2700 -> Bus (Iron 2700) :=
  busAssemblyLine RecipeName.ironPlate 72

def ironFactory (ore:Vector (IronOre 2700 ) 8) : Bus (Vector (Iron 2700) 8) := do
  let iron0 <- ironFullBeltFactory ore[0]
  let iron1 <- ironFullBeltFactory ore[1]
  let iron2 <- ironFullBeltFactory ore[2]
  let iron3 <- ironFullBeltFactory ore[3]
  let iron4 <- ironFullBeltFactory ore[4]
  let iron5 <- ironFullBeltFactory ore[5]
  let iron6 <- ironFullBeltFactory ore[6]
  let iron7 <- ironFullBeltFactory ore[7]
  return Array.toVector #[iron0, iron1, iron2, iron3, iron4, iron5, iron6, iron7]

def copperFullBeltFactory : CopperOre 2700 -> Bus (Copper 2700) :=
  busAssemblyLine RecipeName.copperPlate 72

def copperFactory (ore:Vector (CopperOre 2700 ) 6) : Bus (Vector (Copper 2700) 6) := do
  let copper0 <- copperFullBeltFactory ore[0]
  let copper1 <- copperFullBeltFactory ore[1]
  let copper2 <- copperFullBeltFactory ore[2]
  let copper3 <- copperFullBeltFactory ore[3]
  let copper4 <- copperFullBeltFactory ore[4]
  let copper5 <- copperFullBeltFactory ore[5]
  return Array.toVector #[copper0, copper1, copper2, copper3, copper4, copper5]

def steelPartialBeltFactory : Iron 2700 -> Bus (Steel 540) :=
  busAssemblyLine RecipeName.steelPlate 72

def steelFactory (iron:Vector (Iron 2700) 4) : Bus (Steel 2160) := do
  let steel0 <- steelPartialBeltFactory iron[0]
  let steel1 <- steelPartialBeltFactory iron[1]
  let steel2 <- steelPartialBeltFactory iron[2]
  let steel3 <- steelPartialBeltFactory iron[3]

  let steel01 <- merge steel0 steel1
  let steel23 <- merge steel2 steel3
  merge steel01 steel23

def brickFactory : Stone 2700 -> Bus (Brick 1350) :=
  busAssemblyLine RecipeName.stoneBrick 36

def gearFactory : Iron 1500 -> Bus (Gear 750) :=
  busAssemblyLine RecipeName.ironGearWheel 5

def redScienceFactory : Copper 150 -> Gear 150 -> Bus (RedScience 150) :=
  busAssemblyLine RecipeName.automationSciencePack 10

def inserterFactory : GreenCircuit 150 -> Gear 150 -> Iron 150 -> Bus (Inserter 150) :=
  busAssemblyLine RecipeName.inserter 1

def yellowBeltFactory : Iron 150 -> Gear 150 -> Bus (YellowBelt 300) :=
  busAssemblyLine RecipeName.transportBelt 1

def greenScienceFactory : Inserter 150 -> YellowBelt 150 -> Bus (GreenScience 150) :=
  busAssemblyLine RecipeName.logisticSciencePack 12

def yellowAmmoFactory : Iron 300 -> Bus (YellowAmmo 75) :=
  busAssemblyLine RecipeName.firearmMagazine 1

def redAmmoFactory : YellowAmmo 75 -> Steel (75/2) -> Copper 75 -> Bus (RedAmmo 75) :=
  busAssemblyLine RecipeName.piercingRoundsMagazine 3

def wallFactory : Brick 750 -> Bus (Wall 150) :=
  busAssemblyLine RecipeName.stoneWall 1

def grenadeFactory : Iron 375 -> Coal 750 -> Bus (Grenade 75) :=
  busAssemblyLine RecipeName.grenade 8

def blackScienceFactory : RedAmmo 75 -> Grenade 75 -> Wall 150 -> Bus (BlackScience 150) :=
  busAssemblyLine RecipeName.militarySciencePack 10

def plasticFactory (petrol:Petrolium 28800) (coal:Coal 1440) : Bus (Plastic 2000 × Plastic 750) := do
  let (petrol0, petrol1) <- split (left:=20400) petrol
  let (coal0, coal1) <- split (left:=1020) coal
  let plastic0 <- busAssemblyLine RecipeName.plasticBar 17 petrol0 coal0
  let plastic1 <- busAssemblyLine RecipeName.plasticBar 7 petrol1 coal1
  return (plastic0.less, plastic1.less)

def acidFactory : Water 6000 -> Sulfur 300 -> Iron 60 -> Bus (Acid 3000) :=
  busAssemblyLine RecipeName.sulfuricAcid 1

def pipeFactory : Iron 450 -> Bus (Pipe 450) :=
  busAssemblyLine RecipeName.pipe 3

def engineFactory : Steel 210 -> Gear 210 -> Pipe 420 -> Bus (Engine 210) :=
  busAssemblyLine RecipeName.engineUnit 28

def sulfurFactory : Water 7200 -> Petrolium 7200 -> Bus (Sulfur 480) :=
  busAssemblyLine RecipeName.sulfur 4

def blueScienceAssemblyLine : Engine 150 -> RedCircuit 225 -> Sulfur 75 -> Bus (BlueScience 150) :=
  busAssemblyLine RecipeName.chemicalSciencePack 24

def furnaceFactory : Steel 600 -> RedCircuit 300 -> Brick 600 -> Bus (Furnace 60) :=
  busAssemblyLine RecipeName.electricFurnace 4

def prodModuleFactory : RedCircuit 250 -> GreenCircuit 250 -> Bus (ProdModule 50) :=
  busAssemblyLine RecipeName.productivityModule 10

def ironStickFactory : Iron 450 -> Bus (IronStick 900) :=
  busAssemblyLine RecipeName.ironStick 3

def railFactory : Stone 750 -> IronStick 750-> Steel 750 -> Bus (Rail 1500) :=
  busAssemblyLine RecipeName.rail 5

def purpleScienceFactory : Furnace 50 -> ProdModule 50 -> Rail 1500 ->  Bus (PurpleScience 150) :=
  busAssemblyLine RecipeName.productionSciencePack 14

def batteryFactory : Acid 2400 -> Iron 120 -> Copper 120 -> Bus (Battery 120) :=
  busAssemblyLine RecipeName.battery 8

def electricEngineFactory : Lubricant 900 -> Engine 60 -> GreenCircuit 120 -> Bus (ElectricEngine 60) :=
  busAssemblyLine RecipeName.electricEngineUnit 8

def robotFrameFactory : ElectricEngine 60 -> Battery 120 -> Steel 60 ->GreenCircuit 180 -> Bus (RobotFrame 60) :=
  busAssemblyLine RecipeName.flyingRobotFrame 16

def lowDensityStructureFactory (copperA:Copper 300) (copperB:Copper 2700) (steel:Steel 300) (plastic:Plastic 750) : Bus (LowDensityStructure 150) := do
  let (steelA, steelB) <- split steel
  let (plasticA, plasticB) <- split plastic
  let structA <- busAssemblyLine RecipeName.lowDensityStructure 3 steelA copperA plasticA
  let structB <- busAssemblyLine RecipeName.lowDensityStructure 27 steelB copperB plasticB
  merge structA structB

def yellowScienceFactory : LowDensityStructure 150 -> BlueCircuit 100 -> RobotFrame 50 -> Bus (YellowScience 150) :=
  busAssemblyLine RecipeName.utilitySciencePack 14

def greenCircuitFactory (copper:Copper 1350) (iron:Iron 900) : Bus (GreenCircuit 900) := do
  let cable : Cable 2700 <- busAssemblyLine RecipeName.copperCable 9 copper
  busAssemblyLine RecipeName.electronicCircuit 6 iron cable

def greenCircuitFullBeltFactory (copper0:Copper 1350) (copper1:Copper 2700) (iron:Iron 2700) : Bus (GreenCircuit 2700) := do
  let (copper1, copper2) <- split copper1
  let (iron0, iron) <- split iron
  let (iron1, iron2) <- split iron

  let green0 <- greenCircuitFactory copper0 iron0
  let green1 <- greenCircuitFactory copper1 iron1
  let green2 <- greenCircuitFactory copper2 iron2

  let green <- merge green0 green1
  let green <- merge green green2
  return green

def redCircuitFactory (copper:Copper 1050) (greenCircuit:GreenCircuit 1000) (plastic:Plastic 1000) : Bus (RedCircuit 500) := do
  let cable : Cable 2100 <- busAssemblyLine RecipeName.copperCable 7 copper
  busAssemblyLine RecipeName.advancedCircuit 40 greenCircuit plastic cable.less

def blueCircuitFactory : Acid 525 -> GreenCircuit 2100 -> RedCircuit 210 -> Bus (BlueCircuit 105) :=
  busAssemblyLine RecipeName.processingUnit 14

def circuitFactory (copper: Vector (Copper 2700) 4) (iron: Vector (Iron 2700) 2) (plastic:Plastic 2000) (acid:Acid 525)
: Bus (GreenCircuit 700 × RedCircuit 775 × BlueCircuit 100)
:= do
  -- green
  let (copper0, copper1) <- split copper[0]
  let greenForRed <- greenCircuitFullBeltFactory copper0 copper[1] iron[0]
  let greenForBlue <- greenCircuitFullBeltFactory copper1 copper[2] iron[1]

  pipePumps   -- Right around here, the pipes on the bus are so long that they need pumps.

  -- red
  let (greenForRed0, greenForRed) <- split greenForRed
  let (greenForRed1, greenOut) <- split greenForRed
  let (copper0, copper1) <- split copper[3]
  let (plastic0, plastic1) <- split plastic
  let red0 <- redCircuitFactory copper0 greenForRed0 plastic0
  let red1 <- redCircuitFactory copper1.less greenForRed1 plastic1
  let red <- merge red0 red1
  let (redForBlue, redOut) <- split red

  -- blue
  let blueOut <- blueCircuitFactory acid greenForBlue.less redForBlue

  return (greenOut, redOut.less, blueOut.less)

def advancedOilProcessingFactory : Water 19200 -> CrudeOil 38400 -> Bus (HeavyOil 9600 × LightOil 17280 × Petrolium 21120) :=
  busAssemblyLine RecipeName.advancedOilProcessing 32

def heavyOilCrackingFactory : Water 6300 -> HeavyOil 8400 ->Bus (LightOil 6300) :=
  busAssemblyLine RecipeName.heavyOilCracking 7

def lightOilCrackingFactory :  Water 23400 -> LightOil 23400 ->Bus (Petrolium 15600) :=
  busAssemblyLine RecipeName.lightOilCracking 26

def lubricantFactory : HeavyOil 1200 -> Bus (Lubricant 1200) :=
  busAssemblyLine RecipeName.lubricant 2

def oilFactory (water:Water 48900) (crude:CrudeOil 38400) : Bus (Petrolium 36000 × Lubricant 900) := do
  let (water0, rest) <- split (left:=19200) water
  let (water1, water2) <- split (left:=6300) rest

  let (heavy, light0, petrol0) <- advancedOilProcessingFactory water0 crude
  let (heavy0, heavy1) <- split (left:=1200) heavy

  let light1 <- heavyOilCrackingFactory water1 heavy1
  let light <- merge light0 light1

  let petrol1 <- lightOilCrackingFactory water2 light.less
  let petrol <- merge petrol0 petrol1

  let lube <- lubricantFactory heavy0

  return (petrol.less, lube.less)

def nauvisFactory := bus do
  let copperOre <- inputs 6 .copperOre 2700
  let ironOre <- inputs 8 .ironOre 2700
  let stone0 <- input .stone 2700
  let stone1 <- input .stone 750
  let coal <- input .coal 2190
  let water <- input .water 62100
  let crudeOil <- input .crudeOil 38400

  let (water0, water) <- split (left:=48900) water
  let (water1, water2) <- split (left:=7200) water

  let (petrol, lubricant) <- oilFactory water0 crudeOil
  let (petrol0, petrol1) <- split (left:=7200) petrol

  let copper <- copperFactory copperOre
  let (copper0, rest) <- split (left:=150) copper[0]
  let (copper1, rest) <- split (left:=75) rest
  let (copper2, rest) <- split (left:=120) rest
  let copper3 : Copper 300 := rest.less

  let iron <- ironFactory ironOre
  let (iron0, rest) <- split (left:=60) iron[0]
  let (iron1, rest) <- split (left:=1500) rest
  let (iron2, rest) <- split (left:=150) rest
  let (iron3, rest) <- split (left:=150) rest
  let (iron4, rest) <- split (left:=300) rest
  let iron5 : Iron 375 := rest.less
  let (iron6, rest) <- split (left:=450) iron[1]
  let (iron7, repr) <- split (left:=450) rest
  let iron8 : Iron 120 := rest.less

  let brick <- brickFactory stone0
  let (brick0, brick1) <- split (left:=750) brick

  let steel <- steelFactory (iron.extract 2 6)
  let (steel0, rest) <- split (left:=75/2) steel
  let (steel1, rest) <- split (left:=210) rest
  let (steel2, rest) <- split (left:=600) rest
  let (steel3, rest) <- split (left:=750) rest
  let (steel4, rest) <- split (left:=60) rest
  let steel5 : Steel 300 := rest.less

  let (coal0, coal1) <- split (left:=1440) coal

  let sulfur <- sulfurFactory water1 petrol0
  let (sulfur0, sulfur1) <- split sulfur
  let acid <- acidFactory water2 sulfur0 iron0
  let (acid0, acid1) <- split (left:=525) acid

  let (plastic0, plastic1) <- plasticFactory petrol1 coal0

--  pipePumps   -- Right around here, the pipes on the bus are so long that they need pumps.

  let (greenCircuit, redCircuit, blueCircuit) <-
    circuitFactory (copper.extract 1 5) (iron.extract 6 8) plastic0 acid0
  let (greenCircuit0, rest) <- split (left:=150) greenCircuit
  let (greenCircuit1, rest) <- split (left:=250) rest
  let (greenCircuit2, greenCircuit3) <- split (left:=120) rest
  let (redCircuit0, rest) <- split (left:=225) redCircuit
  let (redCircuit1, redCircuit2) <- split (left:=300) rest

  let gear <- gearFactory iron1
  let (gear0, rest) <- split (left:=150) gear
  let (gear1, rest) <- split (left:=150) rest
  let (gear2, rest) <- split (left:=150) rest
  let gear3 : Gear 210 := rest.less

  let _ <- redScienceFactory copper0 gear0

  let inserter <- inserterFactory greenCircuit0 gear1 iron2
  let belt <- yellowBeltFactory iron3 gear2
  let _ <- greenScienceFactory inserter belt.less

  let yellowAmmo <- yellowAmmoFactory iron4
  let redAmmo <- redAmmoFactory yellowAmmo steel0 copper1
  let wall <- wallFactory brick0
  let grenade <- grenadeFactory iron5 coal1
  let _ <- blackScienceFactory redAmmo grenade wall

  let pipe <- pipeFactory iron6
  let engine <- engineFactory steel1 gear3 pipe.less
  let (engine0, engine1) <- split engine
  let _ <- blueScienceAssemblyLine engine0 redCircuit0 sulfur1.less

  let furnace <- furnaceFactory steel2 redCircuit1 brick1
  let prodModule <- prodModuleFactory redCircuit2 greenCircuit1
  let stick <- ironStickFactory iron7
  let rail <- railFactory stone1 stick.less steel3
  let _ <- purpleScienceFactory furnace.less prodModule rail

  let battery <- batteryFactory acid1.less iron8 copper2
  let electricEngine <- electricEngineFactory lubricant engine1 greenCircuit2
  let robotFrame <- robotFrameFactory electricEngine battery steel4 greenCircuit3
  let lowDensityStruct <- lowDensityStructureFactory copper3 copper[5] steel5 plastic1
  let _ <- yellowScienceFactory lowDensityStruct blueCircuit.less robotFrame.less

def main : IO Unit :=
  IO.println (nauvisFactory.toBlueprint) --  (bootstrap := true))
