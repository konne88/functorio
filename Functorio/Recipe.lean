import Functorio.Fraction

inductive Ingredient
  | accumulator
  | activeProviderChest
  | advancedCircuit
  | agriculturalSciencePack
  | agriculturalTower
  | ammonia
  | ammoniacalSolution
  | arithmeticCombinator
  | artificialJellynutSoil
  | artificialYumakoSoil
  | artilleryShell
  | artilleryTurret
  | artilleryWagon
  | assemblingMachine1
  | assemblingMachine2
  | assemblingMachine3
  | asteroidCollector
  | atomicBomb
  | automationSciencePack
  | barrel
  | battery
  | batteryEquipment
  | batteryMk2Equipment
  | batteryMk3Equipment
  | beacon
  | beltImmunityEquipment
  | bigElectricPole
  | bigMiningDrill
  | biochamber
  | bioflux
  | biolab
  | biterEgg
  | blueprint
  | blueprintBook
  | boiler
  | bottomlessChest
  | bufferChest
  | bulkInserter
  | burnerGenerator
  | burnerInserter
  | burnerMiningDrill
  | calcite
  | cannonShell
  | captiveBiterSpawner
  | captureRobotRocket
  | car
  | carbon
  | carbonFiber
  | carbonicAsteroidChunk
  | cargoBay
  | cargoLandingPad
  | cargoWagon
  | centrifuge
  | chemicalPlant
  | chemicalSciencePack
  | cliffExplosives
  | clusterGrenade
  | coal
  | coin
  | combatShotgun
  | concrete
  | constantCombinator
  | constructionRobot
  | copperBacteria
  | copperCable
  | copperOre
  | copperPlate
  | crudeOil
  | crudeOilBarrel
  | crusher
  | cryogenicPlant
  | cryogenicSciencePack
  | deciderCombinator
  | deconstructionPlanner
  | defenderCapsule
  | depletedUraniumFuelCell
  | destroyerCapsule
  | dischargeDefenseEquipment
  | displayPanel
  | distractorCapsule
  | efficiencyModule
  | efficiencyModule2
  | efficiencyModule3
  | electricEnergyInterface
  | electricEngineUnit
  | electricFurnace
  | electricMiningDrill
  | electrolyte
  | electromagneticPlant
  | electromagneticSciencePack
  | electronicCircuit
  | emptyModuleSlot
  | energyShieldEquipment
  | energyShieldMk2Equipment
  | engineUnit
  | exoskeletonEquipment
  | explosiveCannonShell
  | explosiveRocket
  | explosiveUraniumCannonShell
  | explosives
  | expressLoader
  | expressSplitter
  | expressTransportBelt
  | expressUndergroundBelt
  | fastInserter
  | fastLoader
  | fastSplitter
  | fastTransportBelt
  | fastUndergroundBelt
  | firearmMagazine
  | fissionReactorEquipment
  | flamethrower
  | flamethrowerAmmo
  | flamethrowerTurret
  | fluidWagon
  | fluorine
  | fluoroketoneCold
  | fluoroketoneColdBarrel
  | fluoroketoneHot
  | fluoroketoneHotBarrel
  | flyingRobotFrame
  | foundation
  | foundry
  | fusionGenerator
  | fusionPowerCell
  | fusionReactor
  | fusionReactorEquipment
  | gate
  | grenade
  | gunTurret
  | hazardConcrete
  | heatExchanger
  | heatInterface
  | heatPipe
  | heatingTower
  | heavyArmor
  | heavyOil
  | heavyOilBarrel
  | holmiumOre
  | holmiumPlate
  | holmiumSolution
  | ice
  | icePlatform
  | infinityCargoWagon
  | infinityChest
  | infinityPipe
  | inserter
  | ironBacteria
  | ironChest
  | ironGearWheel
  | ironOre
  | ironPlate
  | ironStick
  | itemUnknown
  | jelly
  | jellynut
  | jellynutSeed
  | lab
  | landMine
  | landfill
  | laneSplitter
  | laserTurret
  | lava
  | lightArmor
  | lightOil
  | lightOilBarrel
  | lightningCollector
  | lightningRod
  | linkedBelt
  | linkedChest
  | lithium
  | lithiumBrine
  | lithiumPlate
  | loader
  | locomotive
  | logisticRobot
  | logisticSciencePack
  | longHandedInserter
  | lowDensityStructure
  | lubricant
  | lubricantBarrel
  | mechArmor
  | mediumElectricPole
  | metallicAsteroidChunk
  | metallurgicSciencePack
  | militarySciencePack
  | modularArmor
  | moltenCopper
  | moltenIron
  | nightVisionEquipment
  | nuclearFuel
  | nuclearReactor
  | nutrients
  | offshorePump
  | oilRefinery
  | oneWayValve
  | overflowValve
  | overgrowthJellynutSoil
  | overgrowthYumakoSoil
  | oxideAsteroidChunk
  | passiveProviderChest
  | pentapodEgg
  | personalLaserDefenseEquipment
  | personalRoboportEquipment
  | personalRoboportMk2Equipment
  | petroleumGas
  | petroleumGasBarrel
  | piercingRoundsMagazine
  | piercingShotgunShell
  | pipe
  | pipeToGround
  | pistol
  | plasticBar
  | poisonCapsule
  | powerArmor
  | powerArmorMk2
  | powerSwitch
  | processingUnit
  | productionSciencePack
  | productivityModule
  | productivityModule2
  | productivityModule3
  | programmableSpeaker
  | promethiumAsteroidChunk
  | promethiumSciencePack
  | proxyContainer
  | pump
  | pumpjack
  | qualityModule
  | qualityModule2
  | qualityModule3
  | quantumProcessor
  | radar
  | rail
  | railChainSignal
  | railRamp
  | railSignal
  | railSupport
  | railgun
  | railgunAmmo
  | railgunTurret
  | rawFish
  | recycler
  | refinedConcrete
  | refinedHazardConcrete
  | repairPack
  | requesterChest
  | roboport
  | rocket
  | rocketFuel
  | rocketLauncher
  | rocketPart
  | rocketSilo
  | rocketTurret
  | science
  | scrap
  | selectionTool
  | selectorCombinator
  | shotgun
  | shotgunShell
  | simpleEntityWithForce
  | simpleEntityWithOwner
  | slowdownCapsule
  | smallElectricPole
  | smallLamp
  | solarPanel
  | solarPanelEquipment
  | solidFuel
  | spacePlatformFoundation
  | spacePlatformHub
  | spacePlatformStarterPack
  | spaceSciencePack
  | speedModule
  | speedModule2
  | speedModule3
  | spidertron
  | splitter
  | spoilage
  | stackInserter
  | steam
  | steamEngine
  | steamTurbine
  | steelChest
  | steelFurnace
  | steelPlate
  | stone
  | stoneBrick
  | stoneFurnace
  | stoneWall
  | storageChest
  | storageTank
  | submachineGun
  | substation
  | sulfur
  | sulfuricAcid
  | sulfuricAcidBarrel
  | supercapacitor
  | superconductor
  | tank
  | teslaAmmo
  | teslaTurret
  | teslagun
  | thruster
  | thrusterFuel
  | thrusterOxidizer
  | toolbeltEquipment
  | topUpValve
  | trainStop
  | transportBelt
  | treeSeed
  | tungstenCarbide
  | tungstenOre
  | tungstenPlate
  | turboLoader
  | turboSplitter
  | turboTransportBelt
  | turboUndergroundBelt
  | undergroundBelt
  | upgradePlanner
  | uranium235
  | uranium238
  | uraniumCannonShell
  | uraniumFuelCell
  | uraniumOre
  | uraniumRoundsMagazine
  | utilitySciencePack
  | water
  | waterBarrel
  | wood
  | woodenChest
  | yumako
  | yumakoMash
  | yumakoSeed
  deriving DecidableEq, Repr, Inhabited

namespace Ingredient

def isLiquid : Ingredient -> Bool
| .ammonia => true
| .ammoniacalSolution => true
| .crudeOil => true
| .electrolyte => true
| .fluorine => true
| .fluoroketoneCold => true
| .fluoroketoneHot => true
| .heavyOil => true
| .holmiumSolution => true
| .lava => true
| .lightOil => true
| .lithiumBrine => true
| .lubricant => true
| .moltenCopper => true
| .moltenIron => true
| .petroleumGas => true
| .steam => true
| .sulfuricAcid => true
| .water => true
| _ => false

end Ingredient

structure Recipe where
    name: Option String
    -- The `Fraction` indicates how many items are needed to execute the recipe.
    inputs : List (Fraction × Ingredient)
    -- The `Fraction` indicates how many output items are generated by executing the recipe.
    outputs : List (Fraction × Ingredient)
    -- Number of seconds that it takes the user to execute the recipe.
    time : Fraction
    deriving DecidableEq, Repr, Inhabited

inductive RecipeName
  | accumulator
  | accumulatorRecycling
  | acidNeutralisation
  | activeProviderChest
  | activeProviderChestRecycling
  | advancedCarbonicAsteroidCrushing
  | advancedCircuit
  | advancedCircuitRecycling
  | advancedMetallicAsteroidCrushing
  | advancedOilProcessing
  | advancedOxideAsteroidCrushing
  | advancedThrusterFuel
  | advancedThrusterOxidizer
  | agriculturalSciencePack
  | agriculturalSciencePackRecycling
  | agriculturalTower
  | agriculturalTowerRecycling
  | ammoniaRocketFuel
  | ammoniacalSolutionSeparation
  | arithmeticCombinator
  | arithmeticCombinatorRecycling
  | artificialJellynutSoil
  | artificialJellynutSoilRecycling
  | artificialYumakoSoil
  | artificialYumakoSoilRecycling
  | artilleryShell
  | artilleryShellRecycling
  | artilleryTurret
  | artilleryTurretRecycling
  | artilleryWagon
  | artilleryWagonRecycling
  | assemblingMachine1
  | assemblingMachine1Recycling
  | assemblingMachine2
  | assemblingMachine2Recycling
  | assemblingMachine3
  | assemblingMachine3Recycling
  | asteroidCollector
  | asteroidCollectorRecycling
  | atomicBomb
  | atomicBombRecycling
  | automationSciencePack
  | automationSciencePackRecycling
  | barrel
  | barrelRecycling
  | basicOilProcessing
  | battery
  | batteryEquipment
  | batteryEquipmentRecycling
  | batteryMk2Equipment
  | batteryMk2EquipmentRecycling
  | batteryMk3Equipment
  | batteryMk3EquipmentRecycling
  | batteryRecycling
  | beacon
  | beaconRecycling
  | beltImmunityEquipment
  | beltImmunityEquipmentRecycling
  | bigElectricPole
  | bigElectricPoleRecycling
  | bigMiningDrill
  | bigMiningDrillRecycling
  | biochamber
  | biochamberRecycling
  | bioflux
  | biofluxRecycling
  | biolab
  | biolabRecycling
  | biolubricant
  | bioplastic
  | biosulfur
  | biterEgg
  | biterEggRecycling
  | blueprintBookRecycling
  | blueprintRecycling
  | boiler
  | boilerRecycling
  | bottomlessChestRecycling
  | bufferChest
  | bufferChestRecycling
  | bulkInserter
  | bulkInserterRecycling
  | burnerGeneratorRecycling
  | burnerInserter
  | burnerInserterRecycling
  | burnerMiningDrill
  | burnerMiningDrillRecycling
  | burntSpoilage
  | calciteRecycling
  | cannonShell
  | cannonShellRecycling
  | captiveBiterSpawner
  | captiveBiterSpawnerRecycling
  | captureRobotRocket
  | captureRobotRocketRecycling
  | car
  | carRecycling
  | carbon
  | carbonFiber
  | carbonFiberRecycling
  | carbonRecycling
  | carbonicAsteroidChunkRecycling
  | carbonicAsteroidCrushing
  | carbonicAsteroidReprocessing
  | cargoBay
  | cargoBayRecycling
  | cargoLandingPad
  | cargoLandingPadRecycling
  | cargoWagon
  | cargoWagonRecycling
  | castingCopper
  | castingCopperCable
  | castingIron
  | castingIronGearWheel
  | castingIronStick
  | castingLowDensityStructure
  | castingPipe
  | castingPipeToGround
  | castingSteel
  | centrifuge
  | centrifugeRecycling
  | chemicalPlant
  | chemicalPlantRecycling
  | chemicalSciencePack
  | chemicalSciencePackRecycling
  | cliffExplosives
  | cliffExplosivesRecycling
  | clusterGrenade
  | clusterGrenadeRecycling
  | coalLiquefaction
  | coalRecycling
  | coalSynthesis
  | coinRecycling
  | combatShotgun
  | combatShotgunRecycling
  | concrete
  | concreteFromMoltenIron
  | concreteRecycling
  | constantCombinator
  | constantCombinatorRecycling
  | constructionRobot
  | constructionRobotRecycling
  | copperBacteria
  | copperBacteriaCultivation
  | copperBacteriaRecycling
  | copperCable
  | copperCableRecycling
  | copperOreRecycling
  | copperPlate
  | copperPlateRecycling
  | crudeOilBarrel
  | crudeOilBarrelRecycling
  | crusher
  | crusherRecycling
  | cryogenicPlant
  | cryogenicPlantRecycling
  | cryogenicSciencePack
  | cryogenicSciencePackRecycling
  | deciderCombinator
  | deciderCombinatorRecycling
  | deconstructionPlannerRecycling
  | defenderCapsule
  | defenderCapsuleRecycling
  | depletedUraniumFuelCellRecycling
  | destroyerCapsule
  | destroyerCapsuleRecycling
  | dischargeDefenseEquipment
  | dischargeDefenseEquipmentRecycling
  | displayPanel
  | displayPanelRecycling
  | distractorCapsule
  | distractorCapsuleRecycling
  | efficiencyModule
  | efficiencyModule2
  | efficiencyModule2Recycling
  | efficiencyModule3
  | efficiencyModule3Recycling
  | efficiencyModuleRecycling
  | electricEnergyInterfaceRecycling
  | electricEngineUnit
  | electricEngineUnitRecycling
  | electricFurnace
  | electricFurnaceRecycling
  | electricMiningDrill
  | electricMiningDrillRecycling
  | electrolyte
  | electromagneticPlant
  | electromagneticPlantRecycling
  | electromagneticSciencePack
  | electromagneticSciencePackRecycling
  | electronicCircuit
  | electronicCircuitRecycling
  | emptyCrudeOilBarrel
  | emptyFluoroketoneColdBarrel
  | emptyFluoroketoneHotBarrel
  | emptyHeavyOilBarrel
  | emptyLightOilBarrel
  | emptyLubricantBarrel
  | emptyModuleSlotRecycling
  | emptyPetroleumGasBarrel
  | emptySulfuricAcidBarrel
  | emptyWaterBarrel
  | energyShieldEquipment
  | energyShieldEquipmentRecycling
  | energyShieldMk2Equipment
  | energyShieldMk2EquipmentRecycling
  | engineUnit
  | engineUnitRecycling
  | exoskeletonEquipment
  | exoskeletonEquipmentRecycling
  | explosiveCannonShell
  | explosiveCannonShellRecycling
  | explosiveRocket
  | explosiveRocketRecycling
  | explosiveUraniumCannonShell
  | explosiveUraniumCannonShellRecycling
  | explosives
  | explosivesRecycling
  | expressLoader
  | expressLoaderRecycling
  | expressSplitter
  | expressSplitterRecycling
  | expressTransportBelt
  | expressTransportBeltRecycling
  | expressUndergroundBelt
  | expressUndergroundBeltRecycling
  | fastInserter
  | fastInserterRecycling
  | fastLoader
  | fastLoaderRecycling
  | fastSplitter
  | fastSplitterRecycling
  | fastTransportBelt
  | fastTransportBeltRecycling
  | fastUndergroundBelt
  | fastUndergroundBeltRecycling
  | firearmMagazine
  | firearmMagazineRecycling
  | fishBreeding
  | fissionReactorEquipment
  | fissionReactorEquipmentRecycling
  | flamethrower
  | flamethrowerAmmo
  | flamethrowerAmmoRecycling
  | flamethrowerRecycling
  | flamethrowerTurret
  | flamethrowerTurretRecycling
  | fluidWagon
  | fluidWagonRecycling
  | fluoroketone
  | fluoroketoneColdBarrel
  | fluoroketoneColdBarrelRecycling
  | fluoroketoneCooling
  | fluoroketoneHotBarrel
  | fluoroketoneHotBarrelRecycling
  | flyingRobotFrame
  | flyingRobotFrameRecycling
  | foundation
  | foundationRecycling
  | foundry
  | foundryRecycling
  | fusionGenerator
  | fusionGeneratorRecycling
  | fusionPowerCell
  | fusionPowerCellRecycling
  | fusionReactor
  | fusionReactorEquipment
  | fusionReactorEquipmentRecycling
  | fusionReactorRecycling
  | gate
  | gateRecycling
  | grenade
  | grenadeRecycling
  | gunTurret
  | gunTurretRecycling
  | hazardConcrete
  | hazardConcreteRecycling
  | heatExchanger
  | heatExchangerRecycling
  | heatInterface
  | heatInterfaceRecycling
  | heatPipe
  | heatPipeRecycling
  | heatingTower
  | heatingTowerRecycling
  | heavyArmor
  | heavyArmorRecycling
  | heavyOilBarrel
  | heavyOilBarrelRecycling
  | heavyOilCracking
  | holmiumOreRecycling
  | holmiumPlate
  | holmiumPlateRecycling
  | holmiumSolution
  | iceMelting
  | icePlatform
  | icePlatformRecycling
  | iceRecycling
  | infinityCargoWagonRecycling
  | infinityChest
  | infinityChestRecycling
  | infinityPipe
  | infinityPipeRecycling
  | inserter
  | inserterRecycling
  | ironBacteria
  | ironBacteriaCultivation
  | ironBacteriaRecycling
  | ironChest
  | ironChestRecycling
  | ironGearWheel
  | ironGearWheelRecycling
  | ironOreRecycling
  | ironPlate
  | ironPlateRecycling
  | ironStick
  | ironStickRecycling
  | itemUnknownRecycling
  | jellyRecycling
  | jellynutProcessing
  | jellynutRecycling
  | jellynutSeedRecycling
  | kovarexEnrichmentProcess
  | lab
  | labRecycling
  | landMine
  | landMineRecycling
  | landfill
  | landfillRecycling
  | laneSplitterRecycling
  | laserTurret
  | laserTurretRecycling
  | lightArmor
  | lightArmorRecycling
  | lightOilBarrel
  | lightOilBarrelRecycling
  | lightOilCracking
  | lightningCollector
  | lightningCollectorRecycling
  | lightningRod
  | lightningRodRecycling
  | linkedBeltRecycling
  | linkedChestRecycling
  | lithium
  | lithiumPlate
  | lithiumPlateRecycling
  | lithiumRecycling
  | loader
  | loaderRecycling
  | locomotive
  | locomotiveRecycling
  | logisticRobot
  | logisticRobotRecycling
  | logisticSciencePack
  | logisticSciencePackRecycling
  | longHandedInserter
  | longHandedInserterRecycling
  | lowDensityStructure
  | lowDensityStructureRecycling
  | lubricant
  | lubricantBarrel
  | lubricantBarrelRecycling
  | mechArmor
  | mechArmorRecycling
  | mediumElectricPole
  | mediumElectricPoleRecycling
  | metallicAsteroidChunkRecycling
  | metallicAsteroidCrushing
  | metallicAsteroidReprocessing
  | metallurgicSciencePack
  | metallurgicSciencePackRecycling
  | militarySciencePack
  | militarySciencePackRecycling
  | modularArmor
  | modularArmorRecycling
  | moltenCopper
  | moltenCopperFromLava
  | moltenIron
  | moltenIronFromLava
  | nightVisionEquipment
  | nightVisionEquipmentRecycling
  | nuclearFuel
  | nuclearFuelRecycling
  | nuclearFuelReprocessing
  | nuclearReactor
  | nuclearReactorRecycling
  | nutrientsFromBioflux
  | nutrientsFromBiterEgg
  | nutrientsFromFish
  | nutrientsFromSpoilage
  | nutrientsFromYumakoMash
  | nutrientsRecycling
  | offshorePump
  | offshorePumpRecycling
  | oilRefinery
  | oilRefineryRecycling
  | oneWayValveRecycling
  | overflowValveRecycling
  | overgrowthJellynutSoil
  | overgrowthJellynutSoilRecycling
  | overgrowthYumakoSoil
  | overgrowthYumakoSoilRecycling
  | oxideAsteroidChunkRecycling
  | oxideAsteroidCrushing
  | oxideAsteroidReprocessing
  | parameter0
  | parameter1
  | parameter2
  | parameter3
  | parameter4
  | parameter5
  | parameter6
  | parameter7
  | parameter8
  | parameter9
  | passiveProviderChest
  | passiveProviderChestRecycling
  | pentapodEgg
  | pentapodEggRecycling
  | personalLaserDefenseEquipment
  | personalLaserDefenseEquipmentRecycling
  | personalRoboportEquipment
  | personalRoboportEquipmentRecycling
  | personalRoboportMk2Equipment
  | personalRoboportMk2EquipmentRecycling
  | petroleumGasBarrel
  | petroleumGasBarrelRecycling
  | piercingRoundsMagazine
  | piercingRoundsMagazineRecycling
  | piercingShotgunShell
  | piercingShotgunShellRecycling
  | pipe
  | pipeRecycling
  | pipeToGround
  | pipeToGroundRecycling
  | pistol
  | pistolRecycling
  | plasticBar
  | plasticBarRecycling
  | poisonCapsule
  | poisonCapsuleRecycling
  | powerArmor
  | powerArmorMk2
  | powerArmorMk2Recycling
  | powerArmorRecycling
  | powerSwitch
  | powerSwitchRecycling
  | processingUnit
  | processingUnitRecycling
  | productionSciencePack
  | productionSciencePackRecycling
  | productivityModule
  | productivityModule2
  | productivityModule2Recycling
  | productivityModule3
  | productivityModule3Recycling
  | productivityModuleRecycling
  | programmableSpeaker
  | programmableSpeakerRecycling
  | promethiumAsteroidChunkRecycling
  | promethiumSciencePack
  | promethiumSciencePackRecycling
  | proxyContainerRecycling
  | pump
  | pumpRecycling
  | pumpjack
  | pumpjackRecycling
  | qualityModule
  | qualityModule2
  | qualityModule2Recycling
  | qualityModule3
  | qualityModule3Recycling
  | qualityModuleRecycling
  | quantumProcessor
  | quantumProcessorRecycling
  | radar
  | radarRecycling
  | rail
  | railChainSignal
  | railChainSignalRecycling
  | railRamp
  | railRampRecycling
  | railRecycling
  | railSignal
  | railSignalRecycling
  | railSupport
  | railSupportRecycling
  | railgun
  | railgunAmmo
  | railgunAmmoRecycling
  | railgunRecycling
  | railgunTurret
  | railgunTurretRecycling
  | rawFishRecycling
  | recipeUnknown
  | recycler
  | recyclerRecycling
  | refinedConcrete
  | refinedConcreteRecycling
  | refinedHazardConcrete
  | refinedHazardConcreteRecycling
  | repairPack
  | repairPackRecycling
  | requesterChest
  | requesterChestRecycling
  | roboport
  | roboportRecycling
  | rocket
  | rocketFuel
  | rocketFuelFromJelly
  | rocketFuelRecycling
  | rocketLauncher
  | rocketLauncherRecycling
  | rocketPart
  | rocketRecycling
  | rocketSilo
  | rocketSiloRecycling
  | rocketTurret
  | rocketTurretRecycling
  | scienceRecycling
  | scrapRecycling
  | selectionToolRecycling
  | selectorCombinator
  | selectorCombinatorRecycling
  | shotgun
  | shotgunRecycling
  | shotgunShell
  | shotgunShellRecycling
  | simpleCoalLiquefaction
  | simpleEntityWithForceRecycling
  | simpleEntityWithOwnerRecycling
  | slowdownCapsule
  | slowdownCapsuleRecycling
  | smallElectricPole
  | smallElectricPoleRecycling
  | smallLamp
  | smallLampRecycling
  | solarPanel
  | solarPanelEquipment
  | solarPanelEquipmentRecycling
  | solarPanelRecycling
  | solidFuelFromAmmonia
  | solidFuelFromHeavyOil
  | solidFuelFromLightOil
  | solidFuelFromPetroleumGas
  | solidFuelRecycling
  | spacePlatformFoundation
  | spacePlatformFoundationRecycling
  | spacePlatformHubRecycling
  | spacePlatformStarterPack
  | spacePlatformStarterPackRecycling
  | spaceSciencePack
  | spaceSciencePackRecycling
  | speedModule
  | speedModule2
  | speedModule2Recycling
  | speedModule3
  | speedModule3Recycling
  | speedModuleRecycling
  | spidertron
  | spidertronRecycling
  | splitter
  | splitterRecycling
  | spoilageRecycling
  | stackInserter
  | stackInserterRecycling
  | steamCondensation
  | steamEngine
  | steamEngineRecycling
  | steamTurbine
  | steamTurbineRecycling
  | steelChest
  | steelChestRecycling
  | steelFurnace
  | steelFurnaceRecycling
  | steelPlate
  | steelPlateRecycling
  | stoneBrick
  | stoneBrickRecycling
  | stoneFurnace
  | stoneFurnaceRecycling
  | stoneRecycling
  | stoneWall
  | stoneWallRecycling
  | storageChest
  | storageChestRecycling
  | storageTank
  | storageTankRecycling
  | submachineGun
  | submachineGunRecycling
  | substation
  | substationRecycling
  | sulfur
  | sulfurRecycling
  | sulfuricAcid
  | sulfuricAcidBarrel
  | sulfuricAcidBarrelRecycling
  | supercapacitor
  | supercapacitorRecycling
  | superconductor
  | superconductorRecycling
  | tank
  | tankRecycling
  | teslaAmmo
  | teslaAmmoRecycling
  | teslaTurret
  | teslaTurretRecycling
  | teslagun
  | teslagunRecycling
  | thruster
  | thrusterFuel
  | thrusterOxidizer
  | thrusterRecycling
  | toolbeltEquipment
  | toolbeltEquipmentRecycling
  | topUpValveRecycling
  | trainStop
  | trainStopRecycling
  | transportBelt
  | transportBeltRecycling
  | treeSeedRecycling
  | tungstenCarbide
  | tungstenCarbideRecycling
  | tungstenOreRecycling
  | tungstenPlate
  | tungstenPlateRecycling
  | turboLoader
  | turboLoaderRecycling
  | turboSplitter
  | turboSplitterRecycling
  | turboTransportBelt
  | turboTransportBeltRecycling
  | turboUndergroundBelt
  | turboUndergroundBeltRecycling
  | undergroundBelt
  | undergroundBeltRecycling
  | upgradePlannerRecycling
  | uranium235Recycling
  | uranium238Recycling
  | uraniumCannonShell
  | uraniumCannonShellRecycling
  | uraniumFuelCell
  | uraniumFuelCellRecycling
  | uraniumOreRecycling
  | uraniumProcessing
  | uraniumRoundsMagazine
  | uraniumRoundsMagazineRecycling
  | utilitySciencePack
  | utilitySciencePackRecycling
  | waterBarrel
  | waterBarrelRecycling
  | woodProcessing
  | woodRecycling
  | woodenChest
  | woodenChestRecycling
  | yumakoMashRecycling
  | yumakoProcessing
  | yumakoRecycling
  | yumakoSeedRecycling
  deriving DecidableEq, Repr, Inhabited

namespace RecipeName

def getRecipe : RecipeName -> Recipe
| .accumulator => {
  name := "accumulator",
  inputs := [(2, .ironPlate), (5, .battery)],
  outputs := [(1, .accumulator)],
  time := 10
}
| .accumulatorRecycling => {
  name := "accumulator-recycling",
  inputs := [(1, .accumulator)],
  outputs := [(0, .ironPlate), (1, .battery)],
  time := 5/8
}
| .acidNeutralisation => {
  name := "acid-neutralisation",
  inputs := [(1, .calcite), (1000, .sulfuricAcid)],
  outputs := [(10000, .steam)],
  time := 5
}
| .activeProviderChest => {
  name := "active-provider-chest",
  inputs := [(3, .electronicCircuit), (1, .advancedCircuit), (1, .steelChest)],
  outputs := [(1, .activeProviderChest)],
  time := 1/2
}
| .activeProviderChestRecycling => {
  name := "active-provider-chest-recycling",
  inputs := [(1, .activeProviderChest)],
  outputs := [(0, .steelChest), (0, .electronicCircuit), (0, .advancedCircuit)],
  time := 1/32
}
| .advancedCarbonicAsteroidCrushing => {
  name := "advanced-carbonic-asteroid-crushing",
  inputs := [(1, .carbonicAsteroidChunk)],
  outputs := [(5, .carbon), (2, .sulfur), (1/20, .carbonicAsteroidChunk)],
  time := 5
}
| .advancedCircuit => {
  name := "advanced-circuit",
  inputs := [(2, .plasticBar), (4, .copperCable), (2, .electronicCircuit)],
  outputs := [(1, .advancedCircuit)],
  time := 6
}
| .advancedCircuitRecycling => {
  name := "advanced-circuit-recycling",
  inputs := [(1, .advancedCircuit)],
  outputs := [(0, .electronicCircuit), (0, .plasticBar), (1, .copperCable)],
  time := 3/8
}
| .advancedMetallicAsteroidCrushing => {
  name := "advanced-metallic-asteroid-crushing",
  inputs := [(1, .metallicAsteroidChunk)],
  outputs := [(10, .ironOre), (4, .copperOre), (1/20, .metallicAsteroidChunk)],
  time := 5
}
| .advancedOilProcessing => {
  name := "advanced-oil-processing",
  inputs := [(50, .water), (100, .crudeOil)],
  outputs := [(25, .heavyOil), (45, .lightOil), (55, .petroleumGas)],
  time := 5
}
| .advancedOxideAsteroidCrushing => {
  name := "advanced-oxide-asteroid-crushing",
  inputs := [(1, .oxideAsteroidChunk)],
  outputs := [(3, .ice), (2, .calcite), (1/20, .oxideAsteroidChunk)],
  time := 5
}
| .advancedThrusterFuel => {
  name := "advanced-thruster-fuel",
  inputs := [(2, .carbon), (1, .calcite), (100, .water)],
  outputs := [(1500, .thrusterFuel)],
  time := 10
}
| .advancedThrusterOxidizer => {
  name := "advanced-thruster-oxidizer",
  inputs := [(2, .ironOre), (1, .calcite), (100, .water)],
  outputs := [(1500, .thrusterOxidizer)],
  time := 10
}
| .agriculturalSciencePack => {
  name := "agricultural-science-pack",
  inputs := [(1, .bioflux), (1, .pentapodEgg)],
  outputs := [(1, .agriculturalSciencePack)],
  time := 4
}
| .agriculturalSciencePackRecycling => {
  name := "agricultural-science-pack-recycling",
  inputs := [(1, .agriculturalSciencePack)],
  outputs := [(1/4, .agriculturalSciencePack)],
  time := 1/4
}
| .agriculturalTower => {
  name := "agricultural-tower",
  inputs := [(10, .steelPlate), (3, .electronicCircuit), (20, .spoilage), (1, .landfill)],
  outputs := [(1, .agriculturalTower)],
  time := 10
}
| .agriculturalTowerRecycling => {
  name := "agricultural-tower-recycling",
  inputs := [(1, .agriculturalTower)],
  outputs := [(2, .steelPlate), (0, .electronicCircuit), (5, .spoilage), (0, .landfill)],
  time := 5/8
}
| .ammoniaRocketFuel => {
  name := "ammonia-rocket-fuel",
  inputs := [(10, .solidFuel), (50, .water), (500, .ammonia)],
  outputs := [(1, .rocketFuel)],
  time := 10
}
| .ammoniacalSolutionSeparation => {
  name := "ammoniacal-solution-separation",
  inputs := [(50, .ammoniacalSolution)],
  outputs := [(5, .ice), (50, .ammonia)],
  time := 1
}
| .arithmeticCombinator => {
  name := "arithmetic-combinator",
  inputs := [(5, .copperCable), (5, .electronicCircuit)],
  outputs := [(1, .arithmeticCombinator)],
  time := 1/2
}
| .arithmeticCombinatorRecycling => {
  name := "arithmetic-combinator-recycling",
  inputs := [(1, .arithmeticCombinator)],
  outputs := [(1, .copperCable), (1, .electronicCircuit)],
  time := 1/32
}
| .artificialJellynutSoil => {
  name := "artificial-jellynut-soil",
  inputs := [(2, .jellynutSeed), (50, .nutrients), (5, .landfill)],
  outputs := [(10, .artificialJellynutSoil)],
  time := 2
}
| .artificialJellynutSoilRecycling => {
  name := "artificial-jellynut-soil-recycling",
  inputs := [(1, .artificialJellynutSoil)],
  outputs := [(0, .jellynutSeed), (1, .nutrients), (0, .landfill)],
  time := 1/8
}
| .artificialYumakoSoil => {
  name := "artificial-yumako-soil",
  inputs := [(2, .yumakoSeed), (50, .nutrients), (5, .landfill)],
  outputs := [(10, .artificialYumakoSoil)],
  time := 2
}
| .artificialYumakoSoilRecycling => {
  name := "artificial-yumako-soil-recycling",
  inputs := [(1, .artificialYumakoSoil)],
  outputs := [(0, .yumakoSeed), (1, .nutrients), (0, .landfill)],
  time := 1/8
}
| .artilleryShell => {
  name := "artillery-shell",
  inputs := [(8, .explosives), (1, .calcite), (4, .tungstenPlate), (1, .radar)],
  outputs := [(1, .artilleryShell)],
  time := 15
}
| .artilleryShellRecycling => {
  name := "artillery-shell-recycling",
  inputs := [(1, .artilleryShell)],
  outputs := [(0, .radar), (0, .calcite), (1, .tungstenPlate), (2, .explosives)],
  time := 15/16
}
| .artilleryTurret => {
  name := "artillery-turret",
  inputs := [(40, .ironGearWheel), (10, .processingUnit), (60, .tungstenPlate), (60, .refinedConcrete)],
  outputs := [(1, .artilleryTurret)],
  time := 40
}
| .artilleryTurretRecycling => {
  name := "artillery-turret-recycling",
  inputs := [(1, .artilleryTurret)],
  outputs := [(15, .tungstenPlate), (15, .refinedConcrete), (10, .ironGearWheel), (2, .processingUnit)],
  time := 5/2
}
| .artilleryWagon => {
  name := "artillery-wagon",
  inputs := [(40, .ironGearWheel), (10, .processingUnit), (60, .engineUnit), (60, .tungstenPlate), (60, .refinedConcrete)],
  outputs := [(1, .artilleryWagon)],
  time := 4
}
| .artilleryWagonRecycling => {
  name := "artillery-wagon-recycling",
  inputs := [(1, .artilleryWagon)],
  outputs := [(15, .engineUnit), (15, .tungstenPlate), (15, .refinedConcrete), (10, .ironGearWheel), (2, .processingUnit)],
  time := 1/4
}
| .assemblingMachine1 => {
  name := "assembling-machine-1",
  inputs := [(9, .ironPlate), (5, .ironGearWheel), (3, .electronicCircuit)],
  outputs := [(1, .assemblingMachine1)],
  time := 1/2
}
| .assemblingMachine1Recycling => {
  name := "assembling-machine-1-recycling",
  inputs := [(1, .assemblingMachine1)],
  outputs := [(0, .electronicCircuit), (1, .ironGearWheel), (2, .ironPlate)],
  time := 1/32
}
| .assemblingMachine2 => {
  name := "assembling-machine-2",
  inputs := [(2, .steelPlate), (5, .ironGearWheel), (3, .electronicCircuit), (1, .assemblingMachine1)],
  outputs := [(1, .assemblingMachine2)],
  time := 1/2
}
| .assemblingMachine2Recycling => {
  name := "assembling-machine-2-recycling",
  inputs := [(1, .assemblingMachine2)],
  outputs := [(0, .steelPlate), (0, .electronicCircuit), (1, .ironGearWheel), (0, .assemblingMachine1)],
  time := 1/32
}
| .assemblingMachine3 => {
  name := "assembling-machine-3",
  inputs := [(2, .assemblingMachine2), (4, .speedModule)],
  outputs := [(1, .assemblingMachine3)],
  time := 1/2
}
| .assemblingMachine3Recycling => {
  name := "assembling-machine-3-recycling",
  inputs := [(1, .assemblingMachine3)],
  outputs := [(0, .assemblingMachine2), (1, .speedModule)],
  time := 1/32
}
| .asteroidCollector => {
  name := "asteroid-collector",
  inputs := [(5, .processingUnit), (8, .electricEngineUnit), (20, .lowDensityStructure)],
  outputs := [(1, .asteroidCollector)],
  time := 10
}
| .asteroidCollectorRecycling => {
  name := "asteroid-collector-recycling",
  inputs := [(1, .asteroidCollector)],
  outputs := [(5, .lowDensityStructure), (2, .electricEngineUnit), (1, .processingUnit)],
  time := 5/8
}
| .atomicBomb => {
  name := "atomic-bomb",
  inputs := [(10, .explosives), (10, .processingUnit), (100, .uranium235)],
  outputs := [(1, .atomicBomb)],
  time := 50
}
| .atomicBombRecycling => {
  name := "atomic-bomb-recycling",
  inputs := [(1, .atomicBomb)],
  outputs := [(2, .processingUnit), (2, .explosives), (25, .uranium235)],
  time := 25/8
}
| .automationSciencePack => {
  name := "automation-science-pack",
  inputs := [(1, .copperPlate), (1, .ironGearWheel)],
  outputs := [(1, .automationSciencePack)],
  time := 5
}
| .automationSciencePackRecycling => {
  name := "automation-science-pack-recycling",
  inputs := [(1, .automationSciencePack)],
  outputs := [(1/4, .automationSciencePack)],
  time := 5/16
}
| .barrel => {
  name := "barrel",
  inputs := [(1, .steelPlate)],
  outputs := [(1, .barrel)],
  time := 1
}
| .barrelRecycling => {
  name := "barrel-recycling",
  inputs := [(1, .barrel)],
  outputs := [(0, .steelPlate)],
  time := 1/16
}
| .basicOilProcessing => {
  name := "basic-oil-processing",
  inputs := [(100, .crudeOil)],
  outputs := [(45, .petroleumGas)],
  time := 5
}
| .battery => {
  name := "battery",
  inputs := [(1, .ironPlate), (1, .copperPlate), (20, .sulfuricAcid)],
  outputs := [(1, .battery)],
  time := 4
}
| .batteryEquipment => {
  name := "battery-equipment",
  inputs := [(10, .steelPlate), (5, .battery)],
  outputs := [(1, .batteryEquipment)],
  time := 10
}
| .batteryEquipmentRecycling => {
  name := "battery-equipment-recycling",
  inputs := [(1, .batteryEquipment)],
  outputs := [(1, .battery), (2, .steelPlate)],
  time := 5/8
}
| .batteryMk2Equipment => {
  name := "battery-mk2-equipment",
  inputs := [(15, .processingUnit), (5, .lowDensityStructure), (10, .batteryEquipment)],
  outputs := [(1, .batteryMk2Equipment)],
  time := 10
}
| .batteryMk2EquipmentRecycling => {
  name := "battery-mk2-equipment-recycling",
  inputs := [(1, .batteryMk2Equipment)],
  outputs := [(2, .batteryEquipment), (3, .processingUnit), (1, .lowDensityStructure)],
  time := 5/8
}
| .batteryMk3Equipment => {
  name := "battery-mk3-equipment",
  inputs := [(10, .supercapacitor), (5, .batteryMk2Equipment)],
  outputs := [(1, .batteryMk3Equipment)],
  time := 10
}
| .batteryMk3EquipmentRecycling => {
  name := "battery-mk3-equipment-recycling",
  inputs := [(1, .batteryMk3Equipment)],
  outputs := [(1, .batteryMk2Equipment), (2, .supercapacitor)],
  time := 5/8
}
| .batteryRecycling => {
  name := "battery-recycling",
  inputs := [(1, .battery)],
  outputs := [(0, .ironPlate), (0, .copperPlate)],
  time := 1/4
}
| .beacon => {
  name := "beacon",
  inputs := [(10, .steelPlate), (10, .copperCable), (20, .electronicCircuit), (20, .advancedCircuit)],
  outputs := [(1, .beacon)],
  time := 15
}
| .beaconRecycling => {
  name := "beacon-recycling",
  inputs := [(1, .beacon)],
  outputs := [(5, .electronicCircuit), (5, .advancedCircuit), (2, .steelPlate), (2, .copperCable)],
  time := 15/16
}
| .beltImmunityEquipment => {
  name := "belt-immunity-equipment",
  inputs := [(10, .steelPlate), (5, .advancedCircuit)],
  outputs := [(1, .beltImmunityEquipment)],
  time := 10
}
| .beltImmunityEquipmentRecycling => {
  name := "belt-immunity-equipment-recycling",
  inputs := [(1, .beltImmunityEquipment)],
  outputs := [(1, .advancedCircuit), (2, .steelPlate)],
  time := 5/8
}
| .bigElectricPole => {
  name := "big-electric-pole",
  inputs := [(5, .steelPlate), (8, .ironStick), (4, .copperCable)],
  outputs := [(1, .bigElectricPole)],
  time := 1/2
}
| .bigElectricPoleRecycling => {
  name := "big-electric-pole-recycling",
  inputs := [(1, .bigElectricPole)],
  outputs := [(2, .ironStick), (1, .steelPlate), (1, .copperCable)],
  time := 1/32
}
| .bigMiningDrill => {
  name := "big-mining-drill",
  inputs := [(10, .advancedCircuit), (10, .electricEngineUnit), (20, .tungstenCarbide), (1, .electricMiningDrill), (200, .moltenIron)],
  outputs := [(1, .bigMiningDrill)],
  time := 30
}
| .bigMiningDrillRecycling => {
  name := "big-mining-drill-recycling",
  inputs := [(1, .bigMiningDrill)],
  outputs := [(0, .electricMiningDrill), (5, .tungstenCarbide), (2, .electricEngineUnit), (2, .advancedCircuit)],
  time := 15/8
}
| .biochamber => {
  name := "biochamber",
  inputs := [(20, .ironPlate), (5, .electronicCircuit), (5, .nutrients), (1, .pentapodEgg), (1, .landfill)],
  outputs := [(1, .biochamber)],
  time := 20
}
| .biochamberRecycling => {
  name := "biochamber-recycling",
  inputs := [(1, .biochamber)],
  outputs := [(1, .nutrients), (0, .pentapodEgg), (5, .ironPlate), (1, .electronicCircuit), (0, .landfill)],
  time := 5/4
}
| .bioflux => {
  name := "bioflux",
  inputs := [(15, .yumakoMash), (12, .jelly)],
  outputs := [(4, .bioflux)],
  time := 6
}
| .biofluxRecycling => {
  name := "bioflux-recycling",
  inputs := [(1, .bioflux)],
  outputs := [(1/4, .bioflux)],
  time := 3/8
}
| .biolab => {
  name := "biolab",
  inputs := [(3, .uranium235), (10, .biterEgg), (25, .refinedConcrete), (1, .lab), (2, .captureRobotRocket)],
  outputs := [(1, .biolab)],
  time := 10
}
| .biolabRecycling => {
  name := "biolab-recycling",
  inputs := [(1, .biolab)],
  outputs := [(1/4, .biolab)],
  time := 5/8
}
| .biolubricant => {
  name := "biolubricant",
  inputs := [(60, .jelly)],
  outputs := [(20, .lubricant)],
  time := 3
}
| .bioplastic => {
  name := "bioplastic",
  inputs := [(1, .bioflux), (4, .yumakoMash)],
  outputs := [(3, .plasticBar)],
  time := 2
}
| .biosulfur => {
  name := "biosulfur",
  inputs := [(5, .spoilage), (1, .bioflux)],
  outputs := [(2, .sulfur)],
  time := 2
}
| .biterEgg => {
  name := "biter-egg",
  inputs := [],
  outputs := [(5, .biterEgg)],
  time := 10
}
| .biterEggRecycling => {
  name := "biter-egg-recycling",
  inputs := [(1, .biterEgg)],
  outputs := [(1/4, .biterEgg)],
  time := 5/8
}
| .blueprintBookRecycling => {
  name := "blueprint-book-recycling",
  inputs := [(1, .blueprintBook)],
  outputs := [(1/4, .blueprintBook)],
  time := 1/32
}
| .blueprintRecycling => {
  name := "blueprint-recycling",
  inputs := [(1, .blueprint)],
  outputs := [(1/4, .blueprint)],
  time := 1/32
}
| .boiler => {
  name := "boiler",
  inputs := [(4, .pipe), (1, .stoneFurnace)],
  outputs := [(1, .boiler)],
  time := 1/2
}
| .boilerRecycling => {
  name := "boiler-recycling",
  inputs := [(1, .boiler)],
  outputs := [(0, .stoneFurnace), (1, .pipe)],
  time := 1/32
}
| .bottomlessChestRecycling => {
  name := "bottomless-chest-recycling",
  inputs := [(1, .bottomlessChest)],
  outputs := [(1/4, .bottomlessChest)],
  time := 1/32
}
| .bufferChest => {
  name := "buffer-chest",
  inputs := [(3, .electronicCircuit), (1, .advancedCircuit), (1, .steelChest)],
  outputs := [(1, .bufferChest)],
  time := 1/2
}
| .bufferChestRecycling => {
  name := "buffer-chest-recycling",
  inputs := [(1, .bufferChest)],
  outputs := [(0, .steelChest), (0, .electronicCircuit), (0, .advancedCircuit)],
  time := 1/32
}
| .bulkInserter => {
  name := "bulk-inserter",
  inputs := [(15, .ironGearWheel), (15, .electronicCircuit), (1, .advancedCircuit), (1, .fastInserter)],
  outputs := [(1, .bulkInserter)],
  time := 1/2
}
| .bulkInserterRecycling => {
  name := "bulk-inserter-recycling",
  inputs := [(1, .bulkInserter)],
  outputs := [(3, .ironGearWheel), (3, .electronicCircuit), (0, .advancedCircuit), (0, .fastInserter)],
  time := 1/32
}
| .burnerGeneratorRecycling => {
  name := "burner-generator-recycling",
  inputs := [(1, .burnerGenerator)],
  outputs := [(1/4, .burnerGenerator)],
  time := 1/32
}
| .burnerInserter => {
  name := "burner-inserter",
  inputs := [(1, .ironPlate), (1, .ironGearWheel)],
  outputs := [(1, .burnerInserter)],
  time := 1/2
}
| .burnerInserterRecycling => {
  name := "burner-inserter-recycling",
  inputs := [(1, .burnerInserter)],
  outputs := [(0, .ironPlate), (0, .ironGearWheel)],
  time := 1/32
}
| .burnerMiningDrill => {
  name := "burner-mining-drill",
  inputs := [(3, .ironPlate), (3, .ironGearWheel), (1, .stoneFurnace)],
  outputs := [(1, .burnerMiningDrill)],
  time := 2
}
| .burnerMiningDrillRecycling => {
  name := "burner-mining-drill-recycling",
  inputs := [(1, .burnerMiningDrill)],
  outputs := [(0, .ironGearWheel), (0, .stoneFurnace), (0, .ironPlate)],
  time := 1/8
}
| .burntSpoilage => {
  name := "burnt-spoilage",
  inputs := [(6, .spoilage)],
  outputs := [(1, .carbon)],
  time := 12
}
| .calciteRecycling => {
  name := "calcite-recycling",
  inputs := [(1, .calcite)],
  outputs := [(1/4, .calcite)],
  time := 1/32
}
| .cannonShell => {
  name := "cannon-shell",
  inputs := [(2, .steelPlate), (2, .plasticBar), (1, .explosives)],
  outputs := [(1, .cannonShell)],
  time := 8
}
| .cannonShellRecycling => {
  name := "cannon-shell-recycling",
  inputs := [(1, .cannonShell)],
  outputs := [(0, .steelPlate), (0, .plasticBar), (0, .explosives)],
  time := 1/2
}
| .captiveBiterSpawner => {
  name := "captive-biter-spawner",
  inputs := [(15, .uranium235), (10, .biterEgg), (1, .captureRobotRocket), (100, .fluoroketoneCold)],
  outputs := [(1, .captiveBiterSpawner)],
  time := 10
}
| .captiveBiterSpawnerRecycling => {
  name := "captive-biter-spawner-recycling",
  inputs := [(1, .captiveBiterSpawner)],
  outputs := [(1/4, .captiveBiterSpawner)],
  time := 5/8
}
| .captureRobotRocket => {
  name := "capture-robot-rocket",
  inputs := [(2, .steelPlate), (2, .processingUnit), (1, .flyingRobotFrame), (20, .bioflux)],
  outputs := [(1, .captureRobotRocket)],
  time := 10
}
| .captureRobotRocketRecycling => {
  name := "capture-robot-rocket-recycling",
  inputs := [(1, .captureRobotRocket)],
  outputs := [(0, .flyingRobotFrame), (0, .steelPlate), (5, .bioflux), (0, .processingUnit)],
  time := 5/8
}
| .car => {
  name := "car",
  inputs := [(20, .ironPlate), (5, .steelPlate), (8, .engineUnit)],
  outputs := [(1, .car)],
  time := 2
}
| .carRecycling => {
  name := "car-recycling",
  inputs := [(1, .car)],
  outputs := [(2, .engineUnit), (5, .ironPlate), (1, .steelPlate)],
  time := 1/8
}
| .carbon => {
  name := "carbon",
  inputs := [(2, .coal), (20, .sulfuricAcid)],
  outputs := [(1, .carbon)],
  time := 1
}
| .carbonFiber => {
  name := "carbon-fiber",
  inputs := [(1, .carbon), (10, .yumakoMash)],
  outputs := [(1, .carbonFiber)],
  time := 5
}
| .carbonFiberRecycling => {
  name := "carbon-fiber-recycling",
  inputs := [(1, .carbonFiber)],
  outputs := [(1/4, .carbonFiber)],
  time := 5/16
}
| .carbonRecycling => {
  name := "carbon-recycling",
  inputs := [(1, .carbon)],
  outputs := [(1/4, .carbon)],
  time := 1/16
}
| .carbonicAsteroidChunkRecycling => {
  name := "carbonic-asteroid-chunk-recycling",
  inputs := [(1, .carbonicAsteroidChunk)],
  outputs := [(1/4, .carbonicAsteroidChunk)],
  time := 1/32
}
| .carbonicAsteroidCrushing => {
  name := "carbonic-asteroid-crushing",
  inputs := [(1, .carbonicAsteroidChunk)],
  outputs := [(10, .carbon), (1/5, .carbonicAsteroidChunk)],
  time := 2
}
| .carbonicAsteroidReprocessing => {
  name := "carbonic-asteroid-reprocessing",
  inputs := [(1, .carbonicAsteroidChunk)],
  outputs := [(2/5, .carbonicAsteroidChunk), (1/5, .metallicAsteroidChunk), (1/5, .oxideAsteroidChunk)],
  time := 2
}
| .cargoBay => {
  name := "cargo-bay",
  inputs := [(20, .steelPlate), (5, .processingUnit), (20, .lowDensityStructure)],
  outputs := [(1, .cargoBay)],
  time := 10
}
| .cargoBayRecycling => {
  name := "cargo-bay-recycling",
  inputs := [(1, .cargoBay)],
  outputs := [(5, .steelPlate), (5, .lowDensityStructure), (1, .processingUnit)],
  time := 5/8
}
| .cargoLandingPad => {
  name := "cargo-landing-pad",
  inputs := [(25, .steelPlate), (10, .processingUnit), (200, .concrete)],
  outputs := [(1, .cargoLandingPad)],
  time := 30
}
| .cargoLandingPadRecycling => {
  name := "cargo-landing-pad-recycling",
  inputs := [(1, .cargoLandingPad)],
  outputs := [(50, .concrete), (6, .steelPlate), (2, .processingUnit)],
  time := 15/8
}
| .cargoWagon => {
  name := "cargo-wagon",
  inputs := [(20, .ironPlate), (20, .steelPlate), (10, .ironGearWheel)],
  outputs := [(1, .cargoWagon)],
  time := 1
}
| .cargoWagonRecycling => {
  name := "cargo-wagon-recycling",
  inputs := [(1, .cargoWagon)],
  outputs := [(2, .ironGearWheel), (5, .ironPlate), (5, .steelPlate)],
  time := 1/16
}
| .castingCopper => {
  name := "casting-copper",
  inputs := [(20, .moltenCopper)],
  outputs := [(2, .copperPlate)],
  time := 16/5
}
| .castingCopperCable => {
  name := "casting-copper-cable",
  inputs := [(5, .moltenCopper)],
  outputs := [(2, .copperCable)],
  time := 1
}
| .castingIron => {
  name := "casting-iron",
  inputs := [(20, .moltenIron)],
  outputs := [(2, .ironPlate)],
  time := 16/5
}
| .castingIronGearWheel => {
  name := "casting-iron-gear-wheel",
  inputs := [(10, .moltenIron)],
  outputs := [(1, .ironGearWheel)],
  time := 1
}
| .castingIronStick => {
  name := "casting-iron-stick",
  inputs := [(20, .moltenIron)],
  outputs := [(4, .ironStick)],
  time := 1
}
| .castingLowDensityStructure => {
  name := "casting-low-density-structure",
  inputs := [(5, .plasticBar), (80, .moltenIron), (250, .moltenCopper)],
  outputs := [(1, .lowDensityStructure)],
  time := 15
}
| .castingPipe => {
  name := "casting-pipe",
  inputs := [(10, .moltenIron)],
  outputs := [(1, .pipe)],
  time := 1
}
| .castingPipeToGround => {
  name := "casting-pipe-to-ground",
  inputs := [(10, .pipe), (50, .moltenIron)],
  outputs := [(2, .pipeToGround)],
  time := 1
}
| .castingSteel => {
  name := "casting-steel",
  inputs := [(30, .moltenIron)],
  outputs := [(1, .steelPlate)],
  time := 16/5
}
| .centrifuge => {
  name := "centrifuge",
  inputs := [(50, .steelPlate), (100, .ironGearWheel), (100, .advancedCircuit), (100, .concrete)],
  outputs := [(1, .centrifuge)],
  time := 4
}
| .centrifugeRecycling => {
  name := "centrifuge-recycling",
  inputs := [(1, .centrifuge)],
  outputs := [(25, .concrete), (12, .steelPlate), (25, .advancedCircuit), (25, .ironGearWheel)],
  time := 1/4
}
| .chemicalPlant => {
  name := "chemical-plant",
  inputs := [(5, .steelPlate), (5, .ironGearWheel), (5, .electronicCircuit), (5, .pipe)],
  outputs := [(1, .chemicalPlant)],
  time := 5
}
| .chemicalPlantRecycling => {
  name := "chemical-plant-recycling",
  inputs := [(1, .chemicalPlant)],
  outputs := [(1, .steelPlate), (1, .ironGearWheel), (1, .electronicCircuit), (1, .pipe)],
  time := 5/16
}
| .chemicalSciencePack => {
  name := "chemical-science-pack",
  inputs := [(1, .sulfur), (3, .advancedCircuit), (2, .engineUnit)],
  outputs := [(2, .chemicalSciencePack)],
  time := 24
}
| .chemicalSciencePackRecycling => {
  name := "chemical-science-pack-recycling",
  inputs := [(1, .chemicalSciencePack)],
  outputs := [(1/4, .chemicalSciencePack)],
  time := 3/2
}
| .cliffExplosives => {
  name := "cliff-explosives",
  inputs := [(10, .explosives), (1, .barrel), (10, .calcite), (1, .grenade)],
  outputs := [(1, .cliffExplosives)],
  time := 8
}
| .cliffExplosivesRecycling => {
  name := "cliff-explosives-recycling",
  inputs := [(1, .cliffExplosives)],
  outputs := [(2, .explosives), (2, .calcite), (0, .grenade), (0, .barrel)],
  time := 1/2
}
| .clusterGrenade => {
  name := "cluster-grenade",
  inputs := [(5, .steelPlate), (5, .explosives), (7, .grenade)],
  outputs := [(1, .clusterGrenade)],
  time := 8
}
| .clusterGrenadeRecycling => {
  name := "cluster-grenade-recycling",
  inputs := [(1, .clusterGrenade)],
  outputs := [(1, .grenade), (1, .explosives), (1, .steelPlate)],
  time := 1/2
}
| .coalLiquefaction => {
  name := "coal-liquefaction",
  inputs := [(10, .coal), (25, .heavyOil), (50, .steam)],
  outputs := [(90, .heavyOil), (20, .lightOil), (10, .petroleumGas)],
  time := 5
}
| .coalRecycling => {
  name := "coal-recycling",
  inputs := [(1, .coal)],
  outputs := [(1/4, .coal)],
  time := 1/32
}
| .coalSynthesis => {
  name := "coal-synthesis",
  inputs := [(1, .sulfur), (5, .carbon), (10, .water)],
  outputs := [(1, .coal)],
  time := 2
}
| .coinRecycling => {
  name := "coin-recycling",
  inputs := [(1, .coin)],
  outputs := [(1/4, .coin)],
  time := 1/32
}
| .combatShotgun => {
  name := "combat-shotgun",
  inputs := [(10, .wood), (10, .copperPlate), (15, .steelPlate), (5, .ironGearWheel)],
  outputs := [(1, .combatShotgun)],
  time := 10
}
| .combatShotgunRecycling => {
  name := "combat-shotgun-recycling",
  inputs := [(1, .combatShotgun)],
  outputs := [(3, .steelPlate), (1, .ironGearWheel), (2, .copperPlate), (2, .wood)],
  time := 5/8
}
| .concrete => {
  name := "concrete",
  inputs := [(1, .ironOre), (5, .stoneBrick), (100, .water)],
  outputs := [(10, .concrete)],
  time := 10
}
| .concreteFromMoltenIron => {
  name := "concrete-from-molten-iron",
  inputs := [(5, .stoneBrick), (20, .moltenIron), (100, .water)],
  outputs := [(10, .concrete)],
  time := 10
}
| .concreteRecycling => {
  name := "concrete-recycling",
  inputs := [(1, .concrete)],
  outputs := [(0, .stoneBrick), (0, .ironOre)],
  time := 5/8
}
| .constantCombinator => {
  name := "constant-combinator",
  inputs := [(5, .copperCable), (2, .electronicCircuit)],
  outputs := [(1, .constantCombinator)],
  time := 1/2
}
| .constantCombinatorRecycling => {
  name := "constant-combinator-recycling",
  inputs := [(1, .constantCombinator)],
  outputs := [(1, .copperCable), (0, .electronicCircuit)],
  time := 1/32
}
| .constructionRobot => {
  name := "construction-robot",
  inputs := [(2, .electronicCircuit), (1, .flyingRobotFrame)],
  outputs := [(1, .constructionRobot)],
  time := 1/2
}
| .constructionRobotRecycling => {
  name := "construction-robot-recycling",
  inputs := [(1, .constructionRobot)],
  outputs := [(0, .flyingRobotFrame), (0, .electronicCircuit)],
  time := 1/32
}
| .copperBacteria => {
  name := "copper-bacteria",
  inputs := [(3, .yumakoMash)],
  outputs := [(1/10, .copperBacteria), (1, .spoilage)],
  time := 1
}
| .copperBacteriaCultivation => {
  name := "copper-bacteria-cultivation",
  inputs := [(1, .copperBacteria), (1, .bioflux)],
  outputs := [(4, .copperBacteria)],
  time := 4
}
| .copperBacteriaRecycling => {
  name := "copper-bacteria-recycling",
  inputs := [(1, .copperBacteria)],
  outputs := [(1/4, .copperBacteria)],
  time := 1/16
}
| .copperCable => {
  name := "copper-cable",
  inputs := [(1, .copperPlate)],
  outputs := [(2, .copperCable)],
  time := 1/2
}
| .copperCableRecycling => {
  name := "copper-cable-recycling",
  inputs := [(1, .copperCable)],
  outputs := [(0, .copperPlate)],
  time := 1/32
}
| .copperOreRecycling => {
  name := "copper-ore-recycling",
  inputs := [(1, .copperOre)],
  outputs := [(1/4, .copperOre)],
  time := 1/32
}
| .copperPlate => {
  name := "copper-plate",
  inputs := [(1, .copperOre)],
  outputs := [(1, .copperPlate)],
  time := 16/5
}
| .copperPlateRecycling => {
  name := "copper-plate-recycling",
  inputs := [(1, .copperPlate)],
  outputs := [(1/4, .copperPlate)],
  time := 1/5
}
| .crudeOilBarrel => {
  name := "crude-oil-barrel",
  inputs := [(1, .barrel), (50, .crudeOil)],
  outputs := [(1, .crudeOilBarrel)],
  time := 1/5
}
| .crudeOilBarrelRecycling => {
  name := "crude-oil-barrel-recycling",
  inputs := [(1, .crudeOilBarrel)],
  outputs := [(0, .barrel)],
  time := 1/80
}
| .crusher => {
  name := "crusher",
  inputs := [(10, .steelPlate), (10, .electricEngineUnit), (20, .lowDensityStructure)],
  outputs := [(1, .crusher)],
  time := 10
}
| .crusherRecycling => {
  name := "crusher-recycling",
  inputs := [(1, .crusher)],
  outputs := [(5, .lowDensityStructure), (2, .steelPlate), (2, .electricEngineUnit)],
  time := 5/8
}
| .cryogenicPlant => {
  name := "cryogenic-plant",
  inputs := [(20, .processingUnit), (20, .superconductor), (20, .lithiumPlate), (40, .refinedConcrete)],
  outputs := [(1, .cryogenicPlant)],
  time := 10
}
| .cryogenicPlantRecycling => {
  name := "cryogenic-plant-recycling",
  inputs := [(1, .cryogenicPlant)],
  outputs := [(10, .refinedConcrete), (5, .superconductor), (5, .processingUnit), (5, .lithiumPlate)],
  time := 5/8
}
| .cryogenicSciencePack => {
  name := "cryogenic-science-pack",
  inputs := [(3, .ice), (1, .lithiumPlate), (6, .fluoroketoneCold)],
  outputs := [(1, .cryogenicSciencePack), (3, .fluoroketoneHot)],
  time := 20
}
| .cryogenicSciencePackRecycling => {
  name := "cryogenic-science-pack-recycling",
  inputs := [(1, .cryogenicSciencePack)],
  outputs := [(1/4, .cryogenicSciencePack)],
  time := 5/4
}
| .deciderCombinator => {
  name := "decider-combinator",
  inputs := [(5, .copperCable), (5, .electronicCircuit)],
  outputs := [(1, .deciderCombinator)],
  time := 1/2
}
| .deciderCombinatorRecycling => {
  name := "decider-combinator-recycling",
  inputs := [(1, .deciderCombinator)],
  outputs := [(1, .copperCable), (1, .electronicCircuit)],
  time := 1/32
}
| .deconstructionPlannerRecycling => {
  name := "deconstruction-planner-recycling",
  inputs := [(1, .deconstructionPlanner)],
  outputs := [(1/4, .deconstructionPlanner)],
  time := 1/32
}
| .defenderCapsule => {
  name := "defender-capsule",
  inputs := [(3, .ironGearWheel), (3, .electronicCircuit), (3, .piercingRoundsMagazine)],
  outputs := [(1, .defenderCapsule)],
  time := 8
}
| .defenderCapsuleRecycling => {
  name := "defender-capsule-recycling",
  inputs := [(1, .defenderCapsule)],
  outputs := [(0, .piercingRoundsMagazine), (0, .electronicCircuit), (0, .ironGearWheel)],
  time := 1/2
}
| .depletedUraniumFuelCellRecycling => {
  name := "depleted-uranium-fuel-cell-recycling",
  inputs := [(1, .depletedUraniumFuelCell)],
  outputs := [(1/4, .depletedUraniumFuelCell)],
  time := 1/32
}
| .destroyerCapsule => {
  name := "destroyer-capsule",
  inputs := [(4, .steelPlate), (1, .processingUnit), (4, .distractorCapsule)],
  outputs := [(1, .destroyerCapsule)],
  time := 15
}
| .destroyerCapsuleRecycling => {
  name := "destroyer-capsule-recycling",
  inputs := [(1, .destroyerCapsule)],
  outputs := [(1, .distractorCapsule), (1, .steelPlate), (0, .processingUnit)],
  time := 15/16
}
| .dischargeDefenseEquipment => {
  name := "discharge-defense-equipment",
  inputs := [(20, .steelPlate), (5, .processingUnit), (10, .laserTurret)],
  outputs := [(1, .dischargeDefenseEquipment)],
  time := 10
}
| .dischargeDefenseEquipmentRecycling => {
  name := "discharge-defense-equipment-recycling",
  inputs := [(1, .dischargeDefenseEquipment)],
  outputs := [(1, .processingUnit), (5, .steelPlate), (2, .laserTurret)],
  time := 5/8
}
| .displayPanel => {
  name := "display-panel",
  inputs := [(1, .ironPlate), (1, .electronicCircuit)],
  outputs := [(1, .displayPanel)],
  time := 1/2
}
| .displayPanelRecycling => {
  name := "display-panel-recycling",
  inputs := [(1, .displayPanel)],
  outputs := [(0, .ironPlate), (0, .electronicCircuit)],
  time := 1/32
}
| .distractorCapsule => {
  name := "distractor-capsule",
  inputs := [(3, .advancedCircuit), (4, .defenderCapsule)],
  outputs := [(1, .distractorCapsule)],
  time := 15
}
| .distractorCapsuleRecycling => {
  name := "distractor-capsule-recycling",
  inputs := [(1, .distractorCapsule)],
  outputs := [(1, .defenderCapsule), (0, .advancedCircuit)],
  time := 15/16
}
| .efficiencyModule => {
  name := "efficiency-module",
  inputs := [(5, .electronicCircuit), (5, .advancedCircuit)],
  outputs := [(1, .efficiencyModule)],
  time := 15
}
| .efficiencyModule2 => {
  name := "efficiency-module-2",
  inputs := [(5, .advancedCircuit), (5, .processingUnit), (4, .efficiencyModule)],
  outputs := [(1, .efficiencyModule2)],
  time := 30
}
| .efficiencyModule2Recycling => {
  name := "efficiency-module-2-recycling",
  inputs := [(1, .efficiencyModule2)],
  outputs := [(1, .efficiencyModule), (1, .advancedCircuit), (1, .processingUnit)],
  time := 15/8
}
| .efficiencyModule3 => {
  name := "efficiency-module-3",
  inputs := [(5, .advancedCircuit), (5, .processingUnit), (5, .spoilage), (4, .efficiencyModule2)],
  outputs := [(1, .efficiencyModule3)],
  time := 60
}
| .efficiencyModule3Recycling => {
  name := "efficiency-module-3-recycling",
  inputs := [(1, .efficiencyModule3)],
  outputs := [(1, .efficiencyModule2), (1, .advancedCircuit), (1, .processingUnit), (1, .spoilage)],
  time := 15/4
}
| .efficiencyModuleRecycling => {
  name := "efficiency-module-recycling",
  inputs := [(1, .efficiencyModule)],
  outputs := [(1, .advancedCircuit), (1, .electronicCircuit)],
  time := 15/16
}
| .electricEnergyInterfaceRecycling => {
  name := "electric-energy-interface-recycling",
  inputs := [(1, .electricEnergyInterface)],
  outputs := [(1/4, .electricEnergyInterface)],
  time := 1/32
}
| .electricEngineUnit => {
  name := "electric-engine-unit",
  inputs := [(2, .electronicCircuit), (1, .engineUnit), (15, .lubricant)],
  outputs := [(1, .electricEngineUnit)],
  time := 10
}
| .electricEngineUnitRecycling => {
  name := "electric-engine-unit-recycling",
  inputs := [(1, .electricEngineUnit)],
  outputs := [(0, .engineUnit), (0, .electronicCircuit)],
  time := 5/8
}
| .electricFurnace => {
  name := "electric-furnace",
  inputs := [(10, .steelPlate), (5, .advancedCircuit), (10, .stoneBrick)],
  outputs := [(1, .electricFurnace)],
  time := 5
}
| .electricFurnaceRecycling => {
  name := "electric-furnace-recycling",
  inputs := [(1, .electricFurnace)],
  outputs := [(2, .steelPlate), (1, .advancedCircuit), (2, .stoneBrick)],
  time := 5/16
}
| .electricMiningDrill => {
  name := "electric-mining-drill",
  inputs := [(10, .ironPlate), (5, .ironGearWheel), (3, .electronicCircuit)],
  outputs := [(1, .electricMiningDrill)],
  time := 2
}
| .electricMiningDrillRecycling => {
  name := "electric-mining-drill-recycling",
  inputs := [(1, .electricMiningDrill)],
  outputs := [(0, .electronicCircuit), (1, .ironGearWheel), (2, .ironPlate)],
  time := 1/8
}
| .electrolyte => {
  name := "electrolyte",
  inputs := [(1, .stone), (10, .heavyOil), (10, .holmiumSolution)],
  outputs := [(10, .electrolyte)],
  time := 5
}
| .electromagneticPlant => {
  name := "electromagnetic-plant",
  inputs := [(50, .steelPlate), (50, .processingUnit), (150, .holmiumPlate), (50, .refinedConcrete)],
  outputs := [(1, .electromagneticPlant)],
  time := 10
}
| .electromagneticPlantRecycling => {
  name := "electromagnetic-plant-recycling",
  inputs := [(1, .electromagneticPlant)],
  outputs := [(37, .holmiumPlate), (12, .steelPlate), (12, .processingUnit), (12, .refinedConcrete)],
  time := 5/8
}
| .electromagneticSciencePack => {
  name := "electromagnetic-science-pack",
  inputs := [(1, .supercapacitor), (1, .accumulator), (25, .electrolyte), (25, .holmiumSolution)],
  outputs := [(1, .electromagneticSciencePack)],
  time := 10
}
| .electromagneticSciencePackRecycling => {
  name := "electromagnetic-science-pack-recycling",
  inputs := [(1, .electromagneticSciencePack)],
  outputs := [(1/4, .electromagneticSciencePack)],
  time := 5/8
}
| .electronicCircuit => {
  name := "electronic-circuit",
  inputs := [(1, .ironPlate), (3, .copperCable)],
  outputs := [(1, .electronicCircuit)],
  time := 1/2
}
| .electronicCircuitRecycling => {
  name := "electronic-circuit-recycling",
  inputs := [(1, .electronicCircuit)],
  outputs := [(0, .ironPlate), (0, .copperCable)],
  time := 1/32
}
| .emptyCrudeOilBarrel => {
  name := "empty-crude-oil-barrel",
  inputs := [(1, .crudeOilBarrel)],
  outputs := [(1, .barrel), (50, .crudeOil)],
  time := 1/5
}
| .emptyFluoroketoneColdBarrel => {
  name := "empty-fluoroketone-cold-barrel",
  inputs := [(1, .fluoroketoneColdBarrel)],
  outputs := [(1, .barrel), (50, .fluoroketoneCold)],
  time := 1/5
}
| .emptyFluoroketoneHotBarrel => {
  name := "empty-fluoroketone-hot-barrel",
  inputs := [(1, .fluoroketoneHotBarrel)],
  outputs := [(1, .barrel), (50, .fluoroketoneHot)],
  time := 1/5
}
| .emptyHeavyOilBarrel => {
  name := "empty-heavy-oil-barrel",
  inputs := [(1, .heavyOilBarrel)],
  outputs := [(1, .barrel), (50, .heavyOil)],
  time := 1/5
}
| .emptyLightOilBarrel => {
  name := "empty-light-oil-barrel",
  inputs := [(1, .lightOilBarrel)],
  outputs := [(1, .barrel), (50, .lightOil)],
  time := 1/5
}
| .emptyLubricantBarrel => {
  name := "empty-lubricant-barrel",
  inputs := [(1, .lubricantBarrel)],
  outputs := [(1, .barrel), (50, .lubricant)],
  time := 1/5
}
| .emptyModuleSlotRecycling => {
  name := "empty-module-slot-recycling",
  inputs := [(1, .emptyModuleSlot)],
  outputs := [(1/4, .emptyModuleSlot)],
  time := 1/32
}
| .emptyPetroleumGasBarrel => {
  name := "empty-petroleum-gas-barrel",
  inputs := [(1, .petroleumGasBarrel)],
  outputs := [(1, .barrel), (50, .petroleumGas)],
  time := 1/5
}
| .emptySulfuricAcidBarrel => {
  name := "empty-sulfuric-acid-barrel",
  inputs := [(1, .sulfuricAcidBarrel)],
  outputs := [(1, .barrel), (50, .sulfuricAcid)],
  time := 1/5
}
| .emptyWaterBarrel => {
  name := "empty-water-barrel",
  inputs := [(1, .waterBarrel)],
  outputs := [(1, .barrel), (50, .water)],
  time := 1/5
}
| .energyShieldEquipment => {
  name := "energy-shield-equipment",
  inputs := [(10, .steelPlate), (5, .advancedCircuit)],
  outputs := [(1, .energyShieldEquipment)],
  time := 10
}
| .energyShieldEquipmentRecycling => {
  name := "energy-shield-equipment-recycling",
  inputs := [(1, .energyShieldEquipment)],
  outputs := [(1, .advancedCircuit), (2, .steelPlate)],
  time := 5/8
}
| .energyShieldMk2Equipment => {
  name := "energy-shield-mk2-equipment",
  inputs := [(5, .processingUnit), (5, .lowDensityStructure), (10, .energyShieldEquipment)],
  outputs := [(1, .energyShieldMk2Equipment)],
  time := 10
}
| .energyShieldMk2EquipmentRecycling => {
  name := "energy-shield-mk2-equipment-recycling",
  inputs := [(1, .energyShieldMk2Equipment)],
  outputs := [(2, .energyShieldEquipment), (1, .processingUnit), (1, .lowDensityStructure)],
  time := 5/8
}
| .engineUnit => {
  name := "engine-unit",
  inputs := [(1, .steelPlate), (1, .ironGearWheel), (2, .pipe)],
  outputs := [(1, .engineUnit)],
  time := 10
}
| .engineUnitRecycling => {
  name := "engine-unit-recycling",
  inputs := [(1, .engineUnit)],
  outputs := [(0, .steelPlate), (0, .ironGearWheel), (0, .pipe)],
  time := 5/8
}
| .exoskeletonEquipment => {
  name := "exoskeleton-equipment",
  inputs := [(20, .steelPlate), (10, .processingUnit), (30, .electricEngineUnit)],
  outputs := [(1, .exoskeletonEquipment)],
  time := 10
}
| .exoskeletonEquipmentRecycling => {
  name := "exoskeleton-equipment-recycling",
  inputs := [(1, .exoskeletonEquipment)],
  outputs := [(2, .processingUnit), (7, .electricEngineUnit), (5, .steelPlate)],
  time := 5/8
}
| .explosiveCannonShell => {
  name := "explosive-cannon-shell",
  inputs := [(2, .steelPlate), (2, .plasticBar), (2, .explosives)],
  outputs := [(1, .explosiveCannonShell)],
  time := 8
}
| .explosiveCannonShellRecycling => {
  name := "explosive-cannon-shell-recycling",
  inputs := [(1, .explosiveCannonShell)],
  outputs := [(0, .steelPlate), (0, .plasticBar), (0, .explosives)],
  time := 1/2
}
| .explosiveRocket => {
  name := "explosive-rocket",
  inputs := [(2, .explosives), (1, .rocket)],
  outputs := [(1, .explosiveRocket)],
  time := 8
}
| .explosiveRocketRecycling => {
  name := "explosive-rocket-recycling",
  inputs := [(1, .explosiveRocket)],
  outputs := [(0, .rocket), (0, .explosives)],
  time := 1/2
}
| .explosiveUraniumCannonShell => {
  name := "explosive-uranium-cannon-shell",
  inputs := [(1, .uranium238), (1, .explosiveCannonShell)],
  outputs := [(1, .explosiveUraniumCannonShell)],
  time := 12
}
| .explosiveUraniumCannonShellRecycling => {
  name := "explosive-uranium-cannon-shell-recycling",
  inputs := [(1, .explosiveUraniumCannonShell)],
  outputs := [(0, .explosiveCannonShell), (0, .uranium238)],
  time := 3/4
}
| .explosives => {
  name := "explosives",
  inputs := [(1, .coal), (1, .sulfur), (10, .water)],
  outputs := [(2, .explosives)],
  time := 4
}
| .explosivesRecycling => {
  name := "explosives-recycling",
  inputs := [(1, .explosives)],
  outputs := [(1/4, .explosives)],
  time := 1/4
}
| .expressLoader => {
  name := "express-loader",
  inputs := [(5, .expressTransportBelt), (1, .fastLoader)],
  outputs := [(1, .expressLoader)],
  time := 10
}
| .expressLoaderRecycling => {
  name := "express-loader-recycling",
  inputs := [(1, .expressLoader)],
  outputs := [(1, .expressTransportBelt), (0, .fastLoader)],
  time := 5/8
}
| .expressSplitter => {
  name := "express-splitter",
  inputs := [(10, .ironGearWheel), (10, .advancedCircuit), (1, .fastSplitter), (80, .lubricant)],
  outputs := [(1, .expressSplitter)],
  time := 2
}
| .expressSplitterRecycling => {
  name := "express-splitter-recycling",
  inputs := [(1, .expressSplitter)],
  outputs := [(0, .fastSplitter), (2, .ironGearWheel), (2, .advancedCircuit)],
  time := 1/8
}
| .expressTransportBelt => {
  name := "express-transport-belt",
  inputs := [(10, .ironGearWheel), (1, .fastTransportBelt), (20, .lubricant)],
  outputs := [(1, .expressTransportBelt)],
  time := 1/2
}
| .expressTransportBeltRecycling => {
  name := "express-transport-belt-recycling",
  inputs := [(1, .expressTransportBelt)],
  outputs := [(2, .ironGearWheel), (0, .fastTransportBelt)],
  time := 1/32
}
| .expressUndergroundBelt => {
  name := "express-underground-belt",
  inputs := [(80, .ironGearWheel), (2, .fastUndergroundBelt), (40, .lubricant)],
  outputs := [(2, .expressUndergroundBelt)],
  time := 2
}
| .expressUndergroundBeltRecycling => {
  name := "express-underground-belt-recycling",
  inputs := [(1, .expressUndergroundBelt)],
  outputs := [(10, .ironGearWheel), (0, .fastUndergroundBelt)],
  time := 1/8
}
| .fastInserter => {
  name := "fast-inserter",
  inputs := [(2, .ironPlate), (2, .electronicCircuit), (1, .inserter)],
  outputs := [(1, .fastInserter)],
  time := 1/2
}
| .fastInserterRecycling => {
  name := "fast-inserter-recycling",
  inputs := [(1, .fastInserter)],
  outputs := [(0, .electronicCircuit), (0, .ironPlate), (0, .inserter)],
  time := 1/32
}
| .fastLoader => {
  name := "fast-loader",
  inputs := [(5, .fastTransportBelt), (1, .loader)],
  outputs := [(1, .fastLoader)],
  time := 3
}
| .fastLoaderRecycling => {
  name := "fast-loader-recycling",
  inputs := [(1, .fastLoader)],
  outputs := [(1, .fastTransportBelt), (0, .loader)],
  time := 3/16
}
| .fastSplitter => {
  name := "fast-splitter",
  inputs := [(10, .ironGearWheel), (10, .electronicCircuit), (1, .splitter)],
  outputs := [(1, .fastSplitter)],
  time := 2
}
| .fastSplitterRecycling => {
  name := "fast-splitter-recycling",
  inputs := [(1, .fastSplitter)],
  outputs := [(0, .splitter), (2, .ironGearWheel), (2, .electronicCircuit)],
  time := 1/8
}
| .fastTransportBelt => {
  name := "fast-transport-belt",
  inputs := [(5, .ironGearWheel), (1, .transportBelt)],
  outputs := [(1, .fastTransportBelt)],
  time := 1/2
}
| .fastTransportBeltRecycling => {
  name := "fast-transport-belt-recycling",
  inputs := [(1, .fastTransportBelt)],
  outputs := [(1, .ironGearWheel), (0, .transportBelt)],
  time := 1/32
}
| .fastUndergroundBelt => {
  name := "fast-underground-belt",
  inputs := [(40, .ironGearWheel), (2, .undergroundBelt)],
  outputs := [(2, .fastUndergroundBelt)],
  time := 2
}
| .fastUndergroundBeltRecycling => {
  name := "fast-underground-belt-recycling",
  inputs := [(1, .fastUndergroundBelt)],
  outputs := [(5, .ironGearWheel), (0, .undergroundBelt)],
  time := 1/8
}
| .firearmMagazine => {
  name := "firearm-magazine",
  inputs := [(4, .ironPlate)],
  outputs := [(1, .firearmMagazine)],
  time := 1
}
| .firearmMagazineRecycling => {
  name := "firearm-magazine-recycling",
  inputs := [(1, .firearmMagazine)],
  outputs := [(1, .ironPlate)],
  time := 1/16
}
| .fishBreeding => {
  name := "fish-breeding",
  inputs := [(2, .rawFish), (100, .nutrients), (100, .water)],
  outputs := [(3, .rawFish)],
  time := 6
}
| .fissionReactorEquipment => {
  name := "fission-reactor-equipment",
  inputs := [(200, .processingUnit), (50, .lowDensityStructure), (4, .uraniumFuelCell)],
  outputs := [(1, .fissionReactorEquipment)],
  time := 10
}
| .fissionReactorEquipmentRecycling => {
  name := "fission-reactor-equipment-recycling",
  inputs := [(1, .fissionReactorEquipment)],
  outputs := [(50, .processingUnit), (12, .lowDensityStructure), (1, .uraniumFuelCell)],
  time := 5/8
}
| .flamethrower => {
  name := "flamethrower",
  inputs := [(5, .steelPlate), (10, .ironGearWheel)],
  outputs := [(1, .flamethrower)],
  time := 10
}
| .flamethrowerAmmo => {
  name := "flamethrower-ammo",
  inputs := [(5, .steelPlate), (100, .crudeOil)],
  outputs := [(1, .flamethrowerAmmo)],
  time := 6
}
| .flamethrowerAmmoRecycling => {
  name := "flamethrower-ammo-recycling",
  inputs := [(1, .flamethrowerAmmo)],
  outputs := [(1/4, .flamethrowerAmmo)],
  time := 3/8
}
| .flamethrowerRecycling => {
  name := "flamethrower-recycling",
  inputs := [(1, .flamethrower)],
  outputs := [(1, .steelPlate), (2, .ironGearWheel)],
  time := 5/8
}
| .flamethrowerTurret => {
  name := "flamethrower-turret",
  inputs := [(30, .steelPlate), (15, .ironGearWheel), (5, .engineUnit), (10, .pipe)],
  outputs := [(1, .flamethrowerTurret)],
  time := 20
}
| .flamethrowerTurretRecycling => {
  name := "flamethrower-turret-recycling",
  inputs := [(1, .flamethrowerTurret)],
  outputs := [(7, .steelPlate), (3, .ironGearWheel), (2, .pipe), (1, .engineUnit)],
  time := 5/4
}
| .fluidWagon => {
  name := "fluid-wagon",
  inputs := [(16, .steelPlate), (10, .ironGearWheel), (1, .storageTank), (8, .pipe)],
  outputs := [(1, .fluidWagon)],
  time := 3/2
}
| .fluidWagonRecycling => {
  name := "fluid-wagon-recycling",
  inputs := [(1, .fluidWagon)],
  outputs := [(2, .ironGearWheel), (4, .steelPlate), (2, .pipe), (0, .storageTank)],
  time := 3/32
}
| .fluoroketone => {
  name := "fluoroketone",
  inputs := [(1, .solidFuel), (1, .lithium), (50, .fluorine), (50, .ammonia)],
  outputs := [(50, .fluoroketoneHot)],
  time := 10
}
| .fluoroketoneColdBarrel => {
  name := "fluoroketone-cold-barrel",
  inputs := [(1, .barrel), (50, .fluoroketoneCold)],
  outputs := [(1, .fluoroketoneColdBarrel)],
  time := 1/5
}
| .fluoroketoneColdBarrelRecycling => {
  name := "fluoroketone-cold-barrel-recycling",
  inputs := [(1, .fluoroketoneColdBarrel)],
  outputs := [(0, .barrel)],
  time := 1/80
}
| .fluoroketoneCooling => {
  name := "fluoroketone-cooling",
  inputs := [(10, .fluoroketoneHot)],
  outputs := [(10, .fluoroketoneCold)],
  time := 5
}
| .fluoroketoneHotBarrel => {
  name := "fluoroketone-hot-barrel",
  inputs := [(1, .barrel), (50, .fluoroketoneHot)],
  outputs := [(1, .fluoroketoneHotBarrel)],
  time := 1/5
}
| .fluoroketoneHotBarrelRecycling => {
  name := "fluoroketone-hot-barrel-recycling",
  inputs := [(1, .fluoroketoneHotBarrel)],
  outputs := [(0, .barrel)],
  time := 1/80
}
| .flyingRobotFrame => {
  name := "flying-robot-frame",
  inputs := [(1, .steelPlate), (2, .battery), (3, .electronicCircuit), (1, .electricEngineUnit)],
  outputs := [(1, .flyingRobotFrame)],
  time := 20
}
| .flyingRobotFrameRecycling => {
  name := "flying-robot-frame-recycling",
  inputs := [(1, .flyingRobotFrame)],
  outputs := [(0, .electricEngineUnit), (0, .battery), (0, .steelPlate), (0, .electronicCircuit)],
  time := 5/4
}
| .foundation => {
  name := "foundation",
  inputs := [(20, .stone), (4, .tungstenPlate), (4, .carbonFiber), (4, .lithiumPlate), (20, .fluoroketoneCold)],
  outputs := [(1, .foundation)],
  time := 30
}
| .foundationRecycling => {
  name := "foundation-recycling",
  inputs := [(1, .foundation)],
  outputs := [(1, .tungstenPlate), (1, .lithiumPlate), (1, .carbonFiber), (5, .stone)],
  time := 15/8
}
| .foundry => {
  name := "foundry",
  inputs := [(50, .steelPlate), (30, .electronicCircuit), (50, .tungstenCarbide), (20, .refinedConcrete), (20, .lubricant)],
  outputs := [(1, .foundry)],
  time := 10
}
| .foundryRecycling => {
  name := "foundry-recycling",
  inputs := [(1, .foundry)],
  outputs := [(12, .tungstenCarbide), (12, .steelPlate), (7, .electronicCircuit), (5, .refinedConcrete)],
  time := 5/8
}
| .fusionGenerator => {
  name := "fusion-generator",
  inputs := [(100, .tungstenPlate), (100, .superconductor), (50, .quantumProcessor)],
  outputs := [(1, .fusionGenerator)],
  time := 30
}
| .fusionGeneratorRecycling => {
  name := "fusion-generator-recycling",
  inputs := [(1, .fusionGenerator)],
  outputs := [(25, .tungstenPlate), (25, .superconductor), (12, .quantumProcessor)],
  time := 15/8
}
| .fusionPowerCell => {
  name := "fusion-power-cell",
  inputs := [(1, .holmiumPlate), (5, .lithiumPlate), (100, .ammonia)],
  outputs := [(1, .fusionPowerCell)],
  time := 10
}
| .fusionPowerCellRecycling => {
  name := "fusion-power-cell-recycling",
  inputs := [(1, .fusionPowerCell)],
  outputs := [(1/4, .fusionPowerCell)],
  time := 5/8
}
| .fusionReactor => {
  name := "fusion-reactor",
  inputs := [(200, .tungstenPlate), (200, .superconductor), (250, .quantumProcessor)],
  outputs := [(1, .fusionReactor)],
  time := 60
}
| .fusionReactorEquipment => {
  name := "fusion-reactor-equipment",
  inputs := [(250, .tungstenPlate), (25, .supercapacitor), (100, .carbonFiber), (250, .quantumProcessor), (10, .fusionPowerCell), (1, .fissionReactorEquipment)],
  outputs := [(1, .fusionReactorEquipment)],
  time := 30
}
| .fusionReactorEquipmentRecycling => {
  name := "fusion-reactor-equipment-recycling",
  inputs := [(1, .fusionReactorEquipment)],
  outputs := [(0, .fissionReactorEquipment), (2, .fusionPowerCell), (62, .tungstenPlate), (25, .carbonFiber), (6, .supercapacitor), (62, .quantumProcessor)],
  time := 15/8
}
| .fusionReactorRecycling => {
  name := "fusion-reactor-recycling",
  inputs := [(1, .fusionReactor)],
  outputs := [(50, .tungstenPlate), (50, .superconductor), (62, .quantumProcessor)],
  time := 15/4
}
| .gate => {
  name := "gate",
  inputs := [(2, .steelPlate), (2, .electronicCircuit), (1, .stoneWall)],
  outputs := [(1, .gate)],
  time := 1/2
}
| .gateRecycling => {
  name := "gate-recycling",
  inputs := [(1, .gate)],
  outputs := [(0, .stoneWall), (0, .steelPlate), (0, .electronicCircuit)],
  time := 1/32
}
| .grenade => {
  name := "grenade",
  inputs := [(10, .coal), (5, .ironPlate)],
  outputs := [(1, .grenade)],
  time := 8
}
| .grenadeRecycling => {
  name := "grenade-recycling",
  inputs := [(1, .grenade)],
  outputs := [(1, .ironPlate), (2, .coal)],
  time := 1/2
}
| .gunTurret => {
  name := "gun-turret",
  inputs := [(20, .ironPlate), (10, .copperPlate), (10, .ironGearWheel)],
  outputs := [(1, .gunTurret)],
  time := 8
}
| .gunTurretRecycling => {
  name := "gun-turret-recycling",
  inputs := [(1, .gunTurret)],
  outputs := [(2, .ironGearWheel), (2, .copperPlate), (5, .ironPlate)],
  time := 1/2
}
| .hazardConcrete => {
  name := "hazard-concrete",
  inputs := [(10, .concrete)],
  outputs := [(10, .hazardConcrete)],
  time := 1/4
}
| .hazardConcreteRecycling => {
  name := "hazard-concrete-recycling",
  inputs := [(1, .hazardConcrete)],
  outputs := [(0, .concrete)],
  time := 1/64
}
| .heatExchanger => {
  name := "heat-exchanger",
  inputs := [(100, .copperPlate), (10, .steelPlate), (10, .pipe)],
  outputs := [(1, .heatExchanger)],
  time := 3
}
| .heatExchangerRecycling => {
  name := "heat-exchanger-recycling",
  inputs := [(1, .heatExchanger)],
  outputs := [(2, .steelPlate), (25, .copperPlate), (2, .pipe)],
  time := 3/16
}
| .heatInterface => {
  name := "heat-interface",
  inputs := [(5, .electronicCircuit), (1, .heatPipe)],
  outputs := [(1, .heatInterface)],
  time := 1/2
}
| .heatInterfaceRecycling => {
  name := "heat-interface-recycling",
  inputs := [(1, .heatInterface)],
  outputs := [(0, .heatPipe), (1, .electronicCircuit)],
  time := 1/32
}
| .heatPipe => {
  name := "heat-pipe",
  inputs := [(20, .copperPlate), (10, .steelPlate)],
  outputs := [(1, .heatPipe)],
  time := 1
}
| .heatPipeRecycling => {
  name := "heat-pipe-recycling",
  inputs := [(1, .heatPipe)],
  outputs := [(2, .steelPlate), (5, .copperPlate)],
  time := 1/16
}
| .heatingTower => {
  name := "heating-tower",
  inputs := [(20, .concrete), (2, .boiler), (5, .heatPipe)],
  outputs := [(1, .heatingTower)],
  time := 10
}
| .heatingTowerRecycling => {
  name := "heating-tower-recycling",
  inputs := [(1, .heatingTower)],
  outputs := [(0, .boiler), (1, .heatPipe), (5, .concrete)],
  time := 5/8
}
| .heavyArmor => {
  name := "heavy-armor",
  inputs := [(100, .copperPlate), (50, .steelPlate)],
  outputs := [(1, .heavyArmor)],
  time := 8
}
| .heavyArmorRecycling => {
  name := "heavy-armor-recycling",
  inputs := [(1, .heavyArmor)],
  outputs := [(25, .copperPlate), (12, .steelPlate)],
  time := 1/2
}
| .heavyOilBarrel => {
  name := "heavy-oil-barrel",
  inputs := [(1, .barrel), (50, .heavyOil)],
  outputs := [(1, .heavyOilBarrel)],
  time := 1/5
}
| .heavyOilBarrelRecycling => {
  name := "heavy-oil-barrel-recycling",
  inputs := [(1, .heavyOilBarrel)],
  outputs := [(0, .barrel)],
  time := 1/80
}
| .heavyOilCracking => {
  name := "heavy-oil-cracking",
  inputs := [(30, .water), (40, .heavyOil)],
  outputs := [(30, .lightOil)],
  time := 2
}
| .holmiumOreRecycling => {
  name := "holmium-ore-recycling",
  inputs := [(1, .holmiumOre)],
  outputs := [(1/4, .holmiumOre)],
  time := 1/32
}
| .holmiumPlate => {
  name := "holmium-plate",
  inputs := [(20, .holmiumSolution)],
  outputs := [(1, .holmiumPlate)],
  time := 1
}
| .holmiumPlateRecycling => {
  name := "holmium-plate-recycling",
  inputs := [(1, .holmiumPlate)],
  outputs := [(1/4, .holmiumPlate)],
  time := 1/16
}
| .holmiumSolution => {
  name := "holmium-solution",
  inputs := [(1, .stone), (2, .holmiumOre), (10, .water)],
  outputs := [(100, .holmiumSolution)],
  time := 10
}
| .iceMelting => {
  name := "ice-melting",
  inputs := [(1, .ice)],
  outputs := [(20, .water)],
  time := 1
}
| .icePlatform => {
  name := "ice-platform",
  inputs := [(50, .ice), (400, .ammonia)],
  outputs := [(1, .icePlatform)],
  time := 30
}
| .icePlatformRecycling => {
  name := "ice-platform-recycling",
  inputs := [(1, .icePlatform)],
  outputs := [(12, .ice)],
  time := 15/8
}
| .iceRecycling => {
  name := "ice-recycling",
  inputs := [(1, .ice)],
  outputs := [(1/4, .ice)],
  time := 1/32
}
| .infinityCargoWagonRecycling => {
  name := "infinity-cargo-wagon-recycling",
  inputs := [(1, .infinityCargoWagon)],
  outputs := [(1/4, .infinityCargoWagon)],
  time := 1/32
}
| .infinityChest => {
  name := "infinity-chest",
  inputs := [(5, .electronicCircuit), (1, .steelChest)],
  outputs := [(1, .infinityChest)],
  time := 1/2
}
| .infinityChestRecycling => {
  name := "infinity-chest-recycling",
  inputs := [(1, .infinityChest)],
  outputs := [(0, .steelChest), (1, .electronicCircuit)],
  time := 1/32
}
| .infinityPipe => {
  name := "infinity-pipe",
  inputs := [(5, .electronicCircuit), (1, .pipe)],
  outputs := [(1, .infinityPipe)],
  time := 1/2
}
| .infinityPipeRecycling => {
  name := "infinity-pipe-recycling",
  inputs := [(1, .infinityPipe)],
  outputs := [(0, .pipe), (1, .electronicCircuit)],
  time := 1/32
}
| .inserter => {
  name := "inserter",
  inputs := [(1, .ironPlate), (1, .ironGearWheel), (1, .electronicCircuit)],
  outputs := [(1, .inserter)],
  time := 1/2
}
| .inserterRecycling => {
  name := "inserter-recycling",
  inputs := [(1, .inserter)],
  outputs := [(0, .electronicCircuit), (0, .ironGearWheel), (0, .ironPlate)],
  time := 1/32
}
| .ironBacteria => {
  name := "iron-bacteria",
  inputs := [(6, .jelly)],
  outputs := [(1/10, .ironBacteria), (4, .spoilage)],
  time := 1
}
| .ironBacteriaCultivation => {
  name := "iron-bacteria-cultivation",
  inputs := [(1, .ironBacteria), (1, .bioflux)],
  outputs := [(4, .ironBacteria)],
  time := 4
}
| .ironBacteriaRecycling => {
  name := "iron-bacteria-recycling",
  inputs := [(1, .ironBacteria)],
  outputs := [(1/4, .ironBacteria)],
  time := 1/16
}
| .ironChest => {
  name := "iron-chest",
  inputs := [(8, .ironPlate)],
  outputs := [(1, .ironChest)],
  time := 1/2
}
| .ironChestRecycling => {
  name := "iron-chest-recycling",
  inputs := [(1, .ironChest)],
  outputs := [(2, .ironPlate)],
  time := 1/32
}
| .ironGearWheel => {
  name := "iron-gear-wheel",
  inputs := [(2, .ironPlate)],
  outputs := [(1, .ironGearWheel)],
  time := 1/2
}
| .ironGearWheelRecycling => {
  name := "iron-gear-wheel-recycling",
  inputs := [(1, .ironGearWheel)],
  outputs := [(0, .ironPlate)],
  time := 1/32
}
| .ironOreRecycling => {
  name := "iron-ore-recycling",
  inputs := [(1, .ironOre)],
  outputs := [(1/4, .ironOre)],
  time := 1/32
}
| .ironPlate => {
  name := "iron-plate",
  inputs := [(1, .ironOre)],
  outputs := [(1, .ironPlate)],
  time := 16/5
}
| .ironPlateRecycling => {
  name := "iron-plate-recycling",
  inputs := [(1, .ironPlate)],
  outputs := [(1/4, .ironPlate)],
  time := 1/5
}
| .ironStick => {
  name := "iron-stick",
  inputs := [(1, .ironPlate)],
  outputs := [(2, .ironStick)],
  time := 1/2
}
| .ironStickRecycling => {
  name := "iron-stick-recycling",
  inputs := [(1, .ironStick)],
  outputs := [(0, .ironPlate)],
  time := 1/32
}
| .itemUnknownRecycling => {
  name := "item-unknown-recycling",
  inputs := [(1, .itemUnknown)],
  outputs := [(1/4, .itemUnknown)],
  time := 1/32
}
| .jellyRecycling => {
  name := "jelly-recycling",
  inputs := [(1, .jelly)],
  outputs := [(1/4, .jelly)],
  time := 1/32
}
| .jellynutProcessing => {
  name := "jellynut-processing",
  inputs := [(1, .jellynut)],
  outputs := [(1/50, .jellynutSeed), (4, .jelly)],
  time := 1
}
| .jellynutRecycling => {
  name := "jellynut-recycling",
  inputs := [(1, .jellynut)],
  outputs := [(1/4, .jellynut)],
  time := 1/32
}
| .jellynutSeedRecycling => {
  name := "jellynut-seed-recycling",
  inputs := [(1, .jellynutSeed)],
  outputs := [(1/4, .jellynutSeed)],
  time := 1/32
}
| .kovarexEnrichmentProcess => {
  name := "kovarex-enrichment-process",
  inputs := [(40, .uranium235), (5, .uranium238)],
  outputs := [(41, .uranium235), (2, .uranium238)],
  time := 60
}
| .lab => {
  name := "lab",
  inputs := [(10, .ironGearWheel), (10, .electronicCircuit), (4, .transportBelt)],
  outputs := [(1, .lab)],
  time := 2
}
| .labRecycling => {
  name := "lab-recycling",
  inputs := [(1, .lab)],
  outputs := [(2, .electronicCircuit), (2, .ironGearWheel), (1, .transportBelt)],
  time := 1/8
}
| .landMine => {
  name := "land-mine",
  inputs := [(1, .steelPlate), (2, .explosives)],
  outputs := [(4, .landMine)],
  time := 5
}
| .landMineRecycling => {
  name := "land-mine-recycling",
  inputs := [(1, .landMine)],
  outputs := [(0, .steelPlate), (0, .explosives)],
  time := 5/16
}
| .landfill => {
  name := "landfill",
  inputs := [(50, .stone)],
  outputs := [(1, .landfill)],
  time := 1/2
}
| .landfillRecycling => {
  name := "landfill-recycling",
  inputs := [(1, .landfill)],
  outputs := [(1/4, .landfill)],
  time := 1/32
}
| .laneSplitterRecycling => {
  name := "lane-splitter-recycling",
  inputs := [(1, .laneSplitter)],
  outputs := [(1/4, .laneSplitter)],
  time := 1/32
}
| .laserTurret => {
  name := "laser-turret",
  inputs := [(20, .steelPlate), (12, .battery), (20, .electronicCircuit)],
  outputs := [(1, .laserTurret)],
  time := 20
}
| .laserTurretRecycling => {
  name := "laser-turret-recycling",
  inputs := [(1, .laserTurret)],
  outputs := [(5, .steelPlate), (5, .electronicCircuit), (3, .battery)],
  time := 5/4
}
| .lightArmor => {
  name := "light-armor",
  inputs := [(40, .ironPlate)],
  outputs := [(1, .lightArmor)],
  time := 3
}
| .lightArmorRecycling => {
  name := "light-armor-recycling",
  inputs := [(1, .lightArmor)],
  outputs := [(10, .ironPlate)],
  time := 3/16
}
| .lightOilBarrel => {
  name := "light-oil-barrel",
  inputs := [(1, .barrel), (50, .lightOil)],
  outputs := [(1, .lightOilBarrel)],
  time := 1/5
}
| .lightOilBarrelRecycling => {
  name := "light-oil-barrel-recycling",
  inputs := [(1, .lightOilBarrel)],
  outputs := [(0, .barrel)],
  time := 1/80
}
| .lightOilCracking => {
  name := "light-oil-cracking",
  inputs := [(30, .water), (30, .lightOil)],
  outputs := [(20, .petroleumGas)],
  time := 2
}
| .lightningCollector => {
  name := "lightning-collector",
  inputs := [(8, .supercapacitor), (1, .accumulator), (1, .lightningRod), (80, .electrolyte)],
  outputs := [(1, .lightningCollector)],
  time := 5
}
| .lightningCollectorRecycling => {
  name := "lightning-collector-recycling",
  inputs := [(1, .lightningCollector)],
  outputs := [(0, .lightningRod), (2, .supercapacitor), (0, .accumulator)],
  time := 5/16
}
| .lightningRod => {
  name := "lightning-rod",
  inputs := [(8, .steelPlate), (12, .copperCable), (4, .stoneBrick)],
  outputs := [(1, .lightningRod)],
  time := 5
}
| .lightningRodRecycling => {
  name := "lightning-rod-recycling",
  inputs := [(1, .lightningRod)],
  outputs := [(3, .copperCable), (2, .steelPlate), (1, .stoneBrick)],
  time := 5/16
}
| .linkedBeltRecycling => {
  name := "linked-belt-recycling",
  inputs := [(1, .linkedBelt)],
  outputs := [(1/4, .linkedBelt)],
  time := 1/32
}
| .linkedChestRecycling => {
  name := "linked-chest-recycling",
  inputs := [(1, .linkedChest)],
  outputs := [(1/4, .linkedChest)],
  time := 1/32
}
| .lithium => {
  name := "lithium",
  inputs := [(1, .holmiumPlate), (50, .lithiumBrine), (50, .ammonia)],
  outputs := [(5, .lithium)],
  time := 20
}
| .lithiumPlate => {
  name := "lithium-plate",
  inputs := [(1, .lithium)],
  outputs := [(1, .lithiumPlate)],
  time := 32/5
}
| .lithiumPlateRecycling => {
  name := "lithium-plate-recycling",
  inputs := [(1, .lithiumPlate)],
  outputs := [(1/4, .lithiumPlate)],
  time := 2/5
}
| .lithiumRecycling => {
  name := "lithium-recycling",
  inputs := [(1, .lithium)],
  outputs := [(1/4, .lithium)],
  time := 5/4
}
| .loader => {
  name := "loader",
  inputs := [(5, .ironPlate), (5, .ironGearWheel), (5, .electronicCircuit), (5, .transportBelt), (5, .inserter)],
  outputs := [(1, .loader)],
  time := 1
}
| .loaderRecycling => {
  name := "loader-recycling",
  inputs := [(1, .loader)],
  outputs := [(1, .inserter), (1, .electronicCircuit), (1, .ironGearWheel), (1, .ironPlate), (1, .transportBelt)],
  time := 1/16
}
| .locomotive => {
  name := "locomotive",
  inputs := [(30, .steelPlate), (10, .electronicCircuit), (20, .engineUnit)],
  outputs := [(1, .locomotive)],
  time := 4
}
| .locomotiveRecycling => {
  name := "locomotive-recycling",
  inputs := [(1, .locomotive)],
  outputs := [(5, .engineUnit), (2, .electronicCircuit), (7, .steelPlate)],
  time := 1/4
}
| .logisticRobot => {
  name := "logistic-robot",
  inputs := [(2, .advancedCircuit), (1, .flyingRobotFrame)],
  outputs := [(1, .logisticRobot)],
  time := 1/2
}
| .logisticRobotRecycling => {
  name := "logistic-robot-recycling",
  inputs := [(1, .logisticRobot)],
  outputs := [(0, .flyingRobotFrame), (0, .advancedCircuit)],
  time := 1/32
}
| .logisticSciencePack => {
  name := "logistic-science-pack",
  inputs := [(1, .transportBelt), (1, .inserter)],
  outputs := [(1, .logisticSciencePack)],
  time := 6
}
| .logisticSciencePackRecycling => {
  name := "logistic-science-pack-recycling",
  inputs := [(1, .logisticSciencePack)],
  outputs := [(1/4, .logisticSciencePack)],
  time := 3/8
}
| .longHandedInserter => {
  name := "long-handed-inserter",
  inputs := [(1, .ironPlate), (1, .ironGearWheel), (1, .inserter)],
  outputs := [(1, .longHandedInserter)],
  time := 1/2
}
| .longHandedInserterRecycling => {
  name := "long-handed-inserter-recycling",
  inputs := [(1, .longHandedInserter)],
  outputs := [(0, .ironGearWheel), (0, .ironPlate), (0, .inserter)],
  time := 1/32
}
| .lowDensityStructure => {
  name := "low-density-structure",
  inputs := [(20, .copperPlate), (2, .steelPlate), (5, .plasticBar)],
  outputs := [(1, .lowDensityStructure)],
  time := 15
}
| .lowDensityStructureRecycling => {
  name := "low-density-structure-recycling",
  inputs := [(1, .lowDensityStructure)],
  outputs := [(0, .steelPlate), (5, .copperPlate), (1, .plasticBar)],
  time := 15/16
}
| .lubricant => {
  name := "lubricant",
  inputs := [(10, .heavyOil)],
  outputs := [(10, .lubricant)],
  time := 1
}
| .lubricantBarrel => {
  name := "lubricant-barrel",
  inputs := [(1, .barrel), (50, .lubricant)],
  outputs := [(1, .lubricantBarrel)],
  time := 1/5
}
| .lubricantBarrelRecycling => {
  name := "lubricant-barrel-recycling",
  inputs := [(1, .lubricantBarrel)],
  outputs := [(0, .barrel)],
  time := 1/80
}
| .mechArmor => {
  name := "mech-armor",
  inputs := [(100, .processingUnit), (200, .holmiumPlate), (50, .superconductor), (50, .supercapacitor), (1, .powerArmorMk2)],
  outputs := [(1, .mechArmor)],
  time := 60
}
| .mechArmorRecycling => {
  name := "mech-armor-recycling",
  inputs := [(1, .mechArmor)],
  outputs := [(0, .powerArmorMk2), (50, .holmiumPlate), (25, .processingUnit), (12, .superconductor), (12, .supercapacitor)],
  time := 15/4
}
| .mediumElectricPole => {
  name := "medium-electric-pole",
  inputs := [(2, .steelPlate), (4, .ironStick), (2, .copperCable)],
  outputs := [(1, .mediumElectricPole)],
  time := 1/2
}
| .mediumElectricPoleRecycling => {
  name := "medium-electric-pole-recycling",
  inputs := [(1, .mediumElectricPole)],
  outputs := [(1, .ironStick), (0, .steelPlate), (0, .copperCable)],
  time := 1/32
}
| .metallicAsteroidChunkRecycling => {
  name := "metallic-asteroid-chunk-recycling",
  inputs := [(1, .metallicAsteroidChunk)],
  outputs := [(1/4, .metallicAsteroidChunk)],
  time := 1/32
}
| .metallicAsteroidCrushing => {
  name := "metallic-asteroid-crushing",
  inputs := [(1, .metallicAsteroidChunk)],
  outputs := [(20, .ironOre), (1/5, .metallicAsteroidChunk)],
  time := 2
}
| .metallicAsteroidReprocessing => {
  name := "metallic-asteroid-reprocessing",
  inputs := [(1, .metallicAsteroidChunk)],
  outputs := [(2/5, .metallicAsteroidChunk), (1/5, .carbonicAsteroidChunk), (1/5, .oxideAsteroidChunk)],
  time := 2
}
| .metallurgicSciencePack => {
  name := "metallurgic-science-pack",
  inputs := [(3, .tungstenCarbide), (2, .tungstenPlate), (200, .moltenCopper)],
  outputs := [(1, .metallurgicSciencePack)],
  time := 10
}
| .metallurgicSciencePackRecycling => {
  name := "metallurgic-science-pack-recycling",
  inputs := [(1, .metallurgicSciencePack)],
  outputs := [(1/4, .metallurgicSciencePack)],
  time := 5/8
}
| .militarySciencePack => {
  name := "military-science-pack",
  inputs := [(1, .piercingRoundsMagazine), (1, .grenade), (2, .stoneWall)],
  outputs := [(2, .militarySciencePack)],
  time := 10
}
| .militarySciencePackRecycling => {
  name := "military-science-pack-recycling",
  inputs := [(1, .militarySciencePack)],
  outputs := [(1/4, .militarySciencePack)],
  time := 5/8
}
| .modularArmor => {
  name := "modular-armor",
  inputs := [(50, .steelPlate), (30, .advancedCircuit)],
  outputs := [(1, .modularArmor)],
  time := 15
}
| .modularArmorRecycling => {
  name := "modular-armor-recycling",
  inputs := [(1, .modularArmor)],
  outputs := [(7, .advancedCircuit), (12, .steelPlate)],
  time := 15/16
}
| .moltenCopper => {
  name := "molten-copper",
  inputs := [(50, .copperOre), (1, .calcite)],
  outputs := [(500, .moltenCopper)],
  time := 32
}
| .moltenCopperFromLava => {
  name := "molten-copper-from-lava",
  inputs := [(1, .calcite), (500, .lava)],
  outputs := [(15, .stone), (250, .moltenCopper)],
  time := 16
}
| .moltenIron => {
  name := "molten-iron",
  inputs := [(50, .ironOre), (1, .calcite)],
  outputs := [(500, .moltenIron)],
  time := 32
}
| .moltenIronFromLava => {
  name := "molten-iron-from-lava",
  inputs := [(1, .calcite), (500, .lava)],
  outputs := [(10, .stone), (250, .moltenIron)],
  time := 16
}
| .nightVisionEquipment => {
  name := "night-vision-equipment",
  inputs := [(10, .steelPlate), (5, .advancedCircuit)],
  outputs := [(1, .nightVisionEquipment)],
  time := 10
}
| .nightVisionEquipmentRecycling => {
  name := "night-vision-equipment-recycling",
  inputs := [(1, .nightVisionEquipment)],
  outputs := [(1, .advancedCircuit), (2, .steelPlate)],
  time := 5/8
}
| .nuclearFuel => {
  name := "nuclear-fuel",
  inputs := [(1, .rocketFuel), (1, .uranium235)],
  outputs := [(1, .nuclearFuel)],
  time := 90
}
| .nuclearFuelRecycling => {
  name := "nuclear-fuel-recycling",
  inputs := [(1, .nuclearFuel)],
  outputs := [(0, .uranium235), (0, .rocketFuel)],
  time := 45/8
}
| .nuclearFuelReprocessing => {
  name := "nuclear-fuel-reprocessing",
  inputs := [(5, .depletedUraniumFuelCell)],
  outputs := [(3, .uranium238)],
  time := 60
}
| .nuclearReactor => {
  name := "nuclear-reactor",
  inputs := [(500, .copperPlate), (500, .steelPlate), (500, .advancedCircuit), (500, .concrete)],
  outputs := [(1, .nuclearReactor)],
  time := 8
}
| .nuclearReactorRecycling => {
  name := "nuclear-reactor-recycling",
  inputs := [(1, .nuclearReactor)],
  outputs := [(125, .concrete), (125, .steelPlate), (125, .advancedCircuit), (125, .copperPlate)],
  time := 1/2
}
| .nutrientsFromBioflux => {
  name := "nutrients-from-bioflux",
  inputs := [(5, .bioflux)],
  outputs := [(40, .nutrients)],
  time := 2
}
| .nutrientsFromBiterEgg => {
  name := "nutrients-from-biter-egg",
  inputs := [(1, .biterEgg)],
  outputs := [(20, .nutrients)],
  time := 2
}
| .nutrientsFromFish => {
  name := "nutrients-from-fish",
  inputs := [(1, .rawFish)],
  outputs := [(20, .nutrients)],
  time := 2
}
| .nutrientsFromSpoilage => {
  name := "nutrients-from-spoilage",
  inputs := [(10, .spoilage)],
  outputs := [(1, .nutrients)],
  time := 2
}
| .nutrientsFromYumakoMash => {
  name := "nutrients-from-yumako-mash",
  inputs := [(4, .yumakoMash)],
  outputs := [(6, .nutrients)],
  time := 4
}
| .nutrientsRecycling => {
  name := "nutrients-recycling",
  inputs := [(1, .nutrients)],
  outputs := [(2, .spoilage)],
  time := 1/8
}
| .offshorePump => {
  name := "offshore-pump",
  inputs := [(2, .ironGearWheel), (3, .pipe)],
  outputs := [(1, .offshorePump)],
  time := 1/2
}
| .offshorePumpRecycling => {
  name := "offshore-pump-recycling",
  inputs := [(1, .offshorePump)],
  outputs := [(0, .pipe), (0, .ironGearWheel)],
  time := 1/32
}
| .oilRefinery => {
  name := "oil-refinery",
  inputs := [(15, .steelPlate), (10, .ironGearWheel), (10, .electronicCircuit), (10, .pipe), (10, .stoneBrick)],
  outputs := [(1, .oilRefinery)],
  time := 8
}
| .oilRefineryRecycling => {
  name := "oil-refinery-recycling",
  inputs := [(1, .oilRefinery)],
  outputs := [(3, .steelPlate), (2, .ironGearWheel), (2, .stoneBrick), (2, .electronicCircuit), (2, .pipe)],
  time := 1/2
}
| .oneWayValveRecycling => {
  name := "one-way-valve-recycling",
  inputs := [(1, .oneWayValve)],
  outputs := [(1/4, .oneWayValve)],
  time := 1/32
}
| .overflowValveRecycling => {
  name := "overflow-valve-recycling",
  inputs := [(1, .overflowValve)],
  outputs := [(1/4, .overflowValve)],
  time := 1/32
}
| .overgrowthJellynutSoil => {
  name := "overgrowth-jellynut-soil",
  inputs := [(5, .jellynutSeed), (50, .spoilage), (10, .biterEgg), (2, .artificialJellynutSoil), (100, .water)],
  outputs := [(1, .overgrowthJellynutSoil)],
  time := 10
}
| .overgrowthJellynutSoilRecycling => {
  name := "overgrowth-jellynut-soil-recycling",
  inputs := [(1, .overgrowthJellynutSoil)],
  outputs := [(0, .artificialJellynutSoil), (1, .jellynutSeed), (2, .biterEgg), (12, .spoilage)],
  time := 5/8
}
| .overgrowthYumakoSoil => {
  name := "overgrowth-yumako-soil",
  inputs := [(5, .yumakoSeed), (50, .spoilage), (10, .biterEgg), (2, .artificialYumakoSoil), (100, .water)],
  outputs := [(1, .overgrowthYumakoSoil)],
  time := 10
}
| .overgrowthYumakoSoilRecycling => {
  name := "overgrowth-yumako-soil-recycling",
  inputs := [(1, .overgrowthYumakoSoil)],
  outputs := [(0, .artificialYumakoSoil), (1, .yumakoSeed), (2, .biterEgg), (12, .spoilage)],
  time := 5/8
}
| .oxideAsteroidChunkRecycling => {
  name := "oxide-asteroid-chunk-recycling",
  inputs := [(1, .oxideAsteroidChunk)],
  outputs := [(1/4, .oxideAsteroidChunk)],
  time := 1/32
}
| .oxideAsteroidCrushing => {
  name := "oxide-asteroid-crushing",
  inputs := [(1, .oxideAsteroidChunk)],
  outputs := [(5, .ice), (1/5, .oxideAsteroidChunk)],
  time := 2
}
| .oxideAsteroidReprocessing => {
  name := "oxide-asteroid-reprocessing",
  inputs := [(1, .oxideAsteroidChunk)],
  outputs := [(2/5, .oxideAsteroidChunk), (1/5, .metallicAsteroidChunk), (1/5, .carbonicAsteroidChunk)],
  time := 1
}
| .parameter0 => {
  name := "parameter-0",
  inputs := [],
  outputs := [],
  time := 1/2
}
| .parameter1 => {
  name := "parameter-1",
  inputs := [],
  outputs := [],
  time := 1/2
}
| .parameter2 => {
  name := "parameter-2",
  inputs := [],
  outputs := [],
  time := 1/2
}
| .parameter3 => {
  name := "parameter-3",
  inputs := [],
  outputs := [],
  time := 1/2
}
| .parameter4 => {
  name := "parameter-4",
  inputs := [],
  outputs := [],
  time := 1/2
}
| .parameter5 => {
  name := "parameter-5",
  inputs := [],
  outputs := [],
  time := 1/2
}
| .parameter6 => {
  name := "parameter-6",
  inputs := [],
  outputs := [],
  time := 1/2
}
| .parameter7 => {
  name := "parameter-7",
  inputs := [],
  outputs := [],
  time := 1/2
}
| .parameter8 => {
  name := "parameter-8",
  inputs := [],
  outputs := [],
  time := 1/2
}
| .parameter9 => {
  name := "parameter-9",
  inputs := [],
  outputs := [],
  time := 1/2
}
| .passiveProviderChest => {
  name := "passive-provider-chest",
  inputs := [(3, .electronicCircuit), (1, .advancedCircuit), (1, .steelChest)],
  outputs := [(1, .passiveProviderChest)],
  time := 1/2
}
| .passiveProviderChestRecycling => {
  name := "passive-provider-chest-recycling",
  inputs := [(1, .passiveProviderChest)],
  outputs := [(0, .steelChest), (0, .electronicCircuit), (0, .advancedCircuit)],
  time := 1/32
}
| .pentapodEgg => {
  name := "pentapod-egg",
  inputs := [(30, .nutrients), (1, .pentapodEgg), (60, .water)],
  outputs := [(2, .pentapodEgg)],
  time := 15
}
| .pentapodEggRecycling => {
  name := "pentapod-egg-recycling",
  inputs := [(1, .pentapodEgg)],
  outputs := [(1/4, .pentapodEgg)],
  time := 15/16
}
| .personalLaserDefenseEquipment => {
  name := "personal-laser-defense-equipment",
  inputs := [(20, .processingUnit), (5, .lowDensityStructure), (5, .laserTurret)],
  outputs := [(1, .personalLaserDefenseEquipment)],
  time := 10
}
| .personalLaserDefenseEquipmentRecycling => {
  name := "personal-laser-defense-equipment-recycling",
  inputs := [(1, .personalLaserDefenseEquipment)],
  outputs := [(5, .processingUnit), (1, .lowDensityStructure), (1, .laserTurret)],
  time := 5/8
}
| .personalRoboportEquipment => {
  name := "personal-roboport-equipment",
  inputs := [(20, .steelPlate), (45, .battery), (40, .ironGearWheel), (10, .advancedCircuit)],
  outputs := [(1, .personalRoboportEquipment)],
  time := 10
}
| .personalRoboportEquipmentRecycling => {
  name := "personal-roboport-equipment-recycling",
  inputs := [(1, .personalRoboportEquipment)],
  outputs := [(2, .advancedCircuit), (10, .ironGearWheel), (5, .steelPlate), (11, .battery)],
  time := 5/8
}
| .personalRoboportMk2Equipment => {
  name := "personal-roboport-mk2-equipment",
  inputs := [(50, .processingUnit), (50, .superconductor), (5, .personalRoboportEquipment)],
  outputs := [(1, .personalRoboportMk2Equipment)],
  time := 20
}
| .personalRoboportMk2EquipmentRecycling => {
  name := "personal-roboport-mk2-equipment-recycling",
  inputs := [(1, .personalRoboportMk2Equipment)],
  outputs := [(1, .personalRoboportEquipment), (12, .processingUnit), (12, .superconductor)],
  time := 5/4
}
| .petroleumGasBarrel => {
  name := "petroleum-gas-barrel",
  inputs := [(1, .barrel), (50, .petroleumGas)],
  outputs := [(1, .petroleumGasBarrel)],
  time := 1/5
}
| .petroleumGasBarrelRecycling => {
  name := "petroleum-gas-barrel-recycling",
  inputs := [(1, .petroleumGasBarrel)],
  outputs := [(0, .barrel)],
  time := 1/80
}
| .piercingRoundsMagazine => {
  name := "piercing-rounds-magazine",
  inputs := [(2, .copperPlate), (1, .steelPlate), (2, .firearmMagazine)],
  outputs := [(2, .piercingRoundsMagazine)],
  time := 6
}
| .piercingRoundsMagazineRecycling => {
  name := "piercing-rounds-magazine-recycling",
  inputs := [(1, .piercingRoundsMagazine)],
  outputs := [(0, .firearmMagazine), (0, .steelPlate), (0, .copperPlate)],
  time := 3/8
}
| .piercingShotgunShell => {
  name := "piercing-shotgun-shell",
  inputs := [(5, .copperPlate), (2, .steelPlate), (2, .shotgunShell)],
  outputs := [(1, .piercingShotgunShell)],
  time := 8
}
| .piercingShotgunShellRecycling => {
  name := "piercing-shotgun-shell-recycling",
  inputs := [(1, .piercingShotgunShell)],
  outputs := [(0, .shotgunShell), (1, .copperPlate), (0, .steelPlate)],
  time := 1/2
}
| .pipe => {
  name := "pipe",
  inputs := [(1, .ironPlate)],
  outputs := [(1, .pipe)],
  time := 1/2
}
| .pipeRecycling => {
  name := "pipe-recycling",
  inputs := [(1, .pipe)],
  outputs := [(0, .ironPlate)],
  time := 1/32
}
| .pipeToGround => {
  name := "pipe-to-ground",
  inputs := [(5, .ironPlate), (10, .pipe)],
  outputs := [(2, .pipeToGround)],
  time := 1/2
}
| .pipeToGroundRecycling => {
  name := "pipe-to-ground-recycling",
  inputs := [(1, .pipeToGround)],
  outputs := [(1, .pipe), (0, .ironPlate)],
  time := 1/32
}
| .pistol => {
  name := "pistol",
  inputs := [(5, .ironPlate), (5, .copperPlate)],
  outputs := [(1, .pistol)],
  time := 5
}
| .pistolRecycling => {
  name := "pistol-recycling",
  inputs := [(1, .pistol)],
  outputs := [(1, .copperPlate), (1, .ironPlate)],
  time := 5/16
}
| .plasticBar => {
  name := "plastic-bar",
  inputs := [(1, .coal), (20, .petroleumGas)],
  outputs := [(2, .plasticBar)],
  time := 1
}
| .plasticBarRecycling => {
  name := "plastic-bar-recycling",
  inputs := [(1, .plasticBar)],
  outputs := [(1/4, .plasticBar)],
  time := 1/16
}
| .poisonCapsule => {
  name := "poison-capsule",
  inputs := [(10, .coal), (3, .steelPlate), (3, .electronicCircuit)],
  outputs := [(1, .poisonCapsule)],
  time := 8
}
| .poisonCapsuleRecycling => {
  name := "poison-capsule-recycling",
  inputs := [(1, .poisonCapsule)],
  outputs := [(0, .steelPlate), (0, .electronicCircuit), (2, .coal)],
  time := 1/2
}
| .powerArmor => {
  name := "power-armor",
  inputs := [(40, .steelPlate), (40, .processingUnit), (20, .electricEngineUnit)],
  outputs := [(1, .powerArmor)],
  time := 20
}
| .powerArmorMk2 => {
  name := "power-armor-mk2",
  inputs := [(60, .processingUnit), (40, .electricEngineUnit), (30, .lowDensityStructure), (100, .speedModule), (100, .efficiencyModule)],
  outputs := [(1, .powerArmorMk2)],
  time := 25
}
| .powerArmorMk2Recycling => {
  name := "power-armor-mk2-recycling",
  inputs := [(1, .powerArmorMk2)],
  outputs := [(25, .efficiencyModule), (25, .speedModule), (15, .processingUnit), (10, .electricEngineUnit), (7, .lowDensityStructure)],
  time := 25/16
}
| .powerArmorRecycling => {
  name := "power-armor-recycling",
  inputs := [(1, .powerArmor)],
  outputs := [(10, .processingUnit), (5, .electricEngineUnit), (10, .steelPlate)],
  time := 5/4
}
| .powerSwitch => {
  name := "power-switch",
  inputs := [(5, .ironPlate), (5, .copperCable), (2, .electronicCircuit)],
  outputs := [(1, .powerSwitch)],
  time := 2
}
| .powerSwitchRecycling => {
  name := "power-switch-recycling",
  inputs := [(1, .powerSwitch)],
  outputs := [(1, .ironPlate), (1, .copperCable), (0, .electronicCircuit)],
  time := 1/8
}
| .processingUnit => {
  name := "processing-unit",
  inputs := [(20, .electronicCircuit), (2, .advancedCircuit), (5, .sulfuricAcid)],
  outputs := [(1, .processingUnit)],
  time := 10
}
| .processingUnitRecycling => {
  name := "processing-unit-recycling",
  inputs := [(1, .processingUnit)],
  outputs := [(5, .electronicCircuit), (0, .advancedCircuit)],
  time := 5/8
}
| .productionSciencePack => {
  name := "production-science-pack",
  inputs := [(30, .rail), (1, .electricFurnace), (1, .productivityModule)],
  outputs := [(3, .productionSciencePack)],
  time := 21
}
| .productionSciencePackRecycling => {
  name := "production-science-pack-recycling",
  inputs := [(1, .productionSciencePack)],
  outputs := [(1/4, .productionSciencePack)],
  time := 21/16
}
| .productivityModule => {
  name := "productivity-module",
  inputs := [(5, .electronicCircuit), (5, .advancedCircuit)],
  outputs := [(1, .productivityModule)],
  time := 15
}
| .productivityModule2 => {
  name := "productivity-module-2",
  inputs := [(5, .advancedCircuit), (5, .processingUnit), (4, .productivityModule)],
  outputs := [(1, .productivityModule2)],
  time := 30
}
| .productivityModule2Recycling => {
  name := "productivity-module-2-recycling",
  inputs := [(1, .productivityModule2)],
  outputs := [(1, .productivityModule), (1, .advancedCircuit), (1, .processingUnit)],
  time := 15/8
}
| .productivityModule3 => {
  name := "productivity-module-3",
  inputs := [(5, .advancedCircuit), (5, .processingUnit), (1, .biterEgg), (4, .productivityModule2)],
  outputs := [(1, .productivityModule3)],
  time := 60
}
| .productivityModule3Recycling => {
  name := "productivity-module-3-recycling",
  inputs := [(1, .productivityModule3)],
  outputs := [(1, .productivityModule2), (1, .advancedCircuit), (1, .processingUnit), (0, .biterEgg)],
  time := 15/4
}
| .productivityModuleRecycling => {
  name := "productivity-module-recycling",
  inputs := [(1, .productivityModule)],
  outputs := [(1, .advancedCircuit), (1, .electronicCircuit)],
  time := 15/16
}
| .programmableSpeaker => {
  name := "programmable-speaker",
  inputs := [(3, .ironPlate), (4, .ironStick), (5, .copperCable), (4, .electronicCircuit)],
  outputs := [(1, .programmableSpeaker)],
  time := 2
}
| .programmableSpeakerRecycling => {
  name := "programmable-speaker-recycling",
  inputs := [(1, .programmableSpeaker)],
  outputs := [(0, .ironPlate), (1, .ironStick), (1, .copperCable), (1, .electronicCircuit)],
  time := 1/8
}
| .promethiumAsteroidChunkRecycling => {
  name := "promethium-asteroid-chunk-recycling",
  inputs := [(1, .promethiumAsteroidChunk)],
  outputs := [(1/4, .promethiumAsteroidChunk)],
  time := 1/32
}
| .promethiumSciencePack => {
  name := "promethium-science-pack",
  inputs := [(10, .biterEgg), (1, .quantumProcessor), (25, .promethiumAsteroidChunk)],
  outputs := [(10, .promethiumSciencePack)],
  time := 5
}
| .promethiumSciencePackRecycling => {
  name := "promethium-science-pack-recycling",
  inputs := [(1, .promethiumSciencePack)],
  outputs := [(1/4, .promethiumSciencePack)],
  time := 5/16
}
| .proxyContainerRecycling => {
  name := "proxy-container-recycling",
  inputs := [(1, .proxyContainer)],
  outputs := [(1/4, .proxyContainer)],
  time := 1/32
}
| .pump => {
  name := "pump",
  inputs := [(1, .steelPlate), (1, .engineUnit), (1, .pipe)],
  outputs := [(1, .pump)],
  time := 2
}
| .pumpRecycling => {
  name := "pump-recycling",
  inputs := [(1, .pump)],
  outputs := [(0, .engineUnit), (0, .steelPlate), (0, .pipe)],
  time := 1/8
}
| .pumpjack => {
  name := "pumpjack",
  inputs := [(5, .steelPlate), (10, .ironGearWheel), (5, .electronicCircuit), (10, .pipe)],
  outputs := [(1, .pumpjack)],
  time := 5
}
| .pumpjackRecycling => {
  name := "pumpjack-recycling",
  inputs := [(1, .pumpjack)],
  outputs := [(1, .steelPlate), (2, .ironGearWheel), (1, .electronicCircuit), (2, .pipe)],
  time := 5/16
}
| .qualityModule => {
  name := "quality-module",
  inputs := [(5, .electronicCircuit), (5, .advancedCircuit)],
  outputs := [(1, .qualityModule)],
  time := 15
}
| .qualityModule2 => {
  name := "quality-module-2",
  inputs := [(5, .advancedCircuit), (5, .processingUnit), (4, .qualityModule)],
  outputs := [(1, .qualityModule2)],
  time := 30
}
| .qualityModule2Recycling => {
  name := "quality-module-2-recycling",
  inputs := [(1, .qualityModule2)],
  outputs := [(1, .qualityModule), (1, .advancedCircuit), (1, .processingUnit)],
  time := 15/8
}
| .qualityModule3 => {
  name := "quality-module-3",
  inputs := [(5, .advancedCircuit), (5, .processingUnit), (1, .superconductor), (4, .qualityModule2)],
  outputs := [(1, .qualityModule3)],
  time := 60
}
| .qualityModule3Recycling => {
  name := "quality-module-3-recycling",
  inputs := [(1, .qualityModule3)],
  outputs := [(1, .qualityModule2), (1, .advancedCircuit), (1, .processingUnit), (0, .superconductor)],
  time := 15/4
}
| .qualityModuleRecycling => {
  name := "quality-module-recycling",
  inputs := [(1, .qualityModule)],
  outputs := [(1, .electronicCircuit), (1, .advancedCircuit)],
  time := 15/16
}
| .quantumProcessor => {
  name := "quantum-processor",
  inputs := [(1, .processingUnit), (1, .tungstenCarbide), (1, .superconductor), (1, .carbonFiber), (2, .lithiumPlate), (10, .fluoroketoneCold)],
  outputs := [(1, .quantumProcessor), (5, .fluoroketoneHot)],
  time := 30
}
| .quantumProcessorRecycling => {
  name := "quantum-processor-recycling",
  inputs := [(1, .quantumProcessor)],
  outputs := [(0, .tungstenCarbide), (0, .processingUnit), (0, .superconductor), (0, .carbonFiber), (0, .lithiumPlate)],
  time := 15/8
}
| .radar => {
  name := "radar",
  inputs := [(10, .ironPlate), (5, .ironGearWheel), (5, .electronicCircuit)],
  outputs := [(1, .radar)],
  time := 1/2
}
| .radarRecycling => {
  name := "radar-recycling",
  inputs := [(1, .radar)],
  outputs := [(1, .electronicCircuit), (1, .ironGearWheel), (2, .ironPlate)],
  time := 1/32
}
| .rail => {
  name := "rail",
  inputs := [(1, .stone), (1, .steelPlate), (1, .ironStick)],
  outputs := [(2, .rail)],
  time := 1/2
}
| .railChainSignal => {
  name := "rail-chain-signal",
  inputs := [(5, .ironPlate), (1, .electronicCircuit)],
  outputs := [(1, .railChainSignal)],
  time := 1/2
}
| .railChainSignalRecycling => {
  name := "rail-chain-signal-recycling",
  inputs := [(1, .railChainSignal)],
  outputs := [(0, .electronicCircuit), (1, .ironPlate)],
  time := 1/32
}
| .railRamp => {
  name := "rail-ramp",
  inputs := [(10, .steelPlate), (8, .rail), (100, .refinedConcrete)],
  outputs := [(1, .railRamp)],
  time := 1/2
}
| .railRampRecycling => {
  name := "rail-ramp-recycling",
  inputs := [(1, .railRamp)],
  outputs := [(25, .refinedConcrete), (2, .rail), (2, .steelPlate)],
  time := 1/32
}
| .railRecycling => {
  name := "rail-recycling",
  inputs := [(1, .rail)],
  outputs := [(0, .stone), (0, .ironStick), (0, .steelPlate)],
  time := 1/32
}
| .railSignal => {
  name := "rail-signal",
  inputs := [(5, .ironPlate), (1, .electronicCircuit)],
  outputs := [(1, .railSignal)],
  time := 1/2
}
| .railSignalRecycling => {
  name := "rail-signal-recycling",
  inputs := [(1, .railSignal)],
  outputs := [(0, .electronicCircuit), (1, .ironPlate)],
  time := 1/32
}
| .railSupport => {
  name := "rail-support",
  inputs := [(10, .steelPlate), (20, .refinedConcrete)],
  outputs := [(1, .railSupport)],
  time := 1/2
}
| .railSupportRecycling => {
  name := "rail-support-recycling",
  inputs := [(1, .railSupport)],
  outputs := [(5, .refinedConcrete), (2, .steelPlate)],
  time := 1/32
}
| .railgun => {
  name := "railgun",
  inputs := [(10, .tungstenPlate), (10, .superconductor), (20, .quantumProcessor), (10, .fluoroketoneCold)],
  outputs := [(1, .railgun)],
  time := 10
}
| .railgunAmmo => {
  name := "railgun-ammo",
  inputs := [(5, .steelPlate), (2, .explosives), (10, .copperCable)],
  outputs := [(1, .railgunAmmo)],
  time := 25
}
| .railgunAmmoRecycling => {
  name := "railgun-ammo-recycling",
  inputs := [(1, .railgunAmmo)],
  outputs := [(1, .steelPlate), (2, .copperCable), (0, .explosives)],
  time := 25/16
}
| .railgunRecycling => {
  name := "railgun-recycling",
  inputs := [(1, .railgun)],
  outputs := [(2, .tungstenPlate), (2, .superconductor), (5, .quantumProcessor)],
  time := 5/8
}
| .railgunTurret => {
  name := "railgun-turret",
  inputs := [(30, .tungstenPlate), (50, .superconductor), (20, .carbonFiber), (100, .quantumProcessor), (100, .fluoroketoneCold)],
  outputs := [(1, .railgunTurret)],
  time := 10
}
| .railgunTurretRecycling => {
  name := "railgun-turret-recycling",
  inputs := [(1, .railgunTurret)],
  outputs := [(25, .quantumProcessor), (7, .tungstenPlate), (12, .superconductor), (5, .carbonFiber)],
  time := 5/8
}
| .rawFishRecycling => {
  name := "raw-fish-recycling",
  inputs := [(1, .rawFish)],
  outputs := [(1/4, .rawFish)],
  time := 1/32
}
| .recipeUnknown => {
  name := "recipe-unknown",
  inputs := [],
  outputs := [],
  time := 1/2
}
| .recycler => {
  name := "recycler",
  inputs := [(20, .steelPlate), (40, .ironGearWheel), (6, .processingUnit), (20, .concrete)],
  outputs := [(1, .recycler)],
  time := 3
}
| .recyclerRecycling => {
  name := "recycler-recycling",
  inputs := [(1, .recycler)],
  outputs := [(1, .processingUnit), (5, .steelPlate), (10, .ironGearWheel), (5, .concrete)],
  time := 3/16
}
| .refinedConcrete => {
  name := "refined-concrete",
  inputs := [(1, .steelPlate), (8, .ironStick), (20, .concrete), (100, .water)],
  outputs := [(10, .refinedConcrete)],
  time := 15
}
| .refinedConcreteRecycling => {
  name := "refined-concrete-recycling",
  inputs := [(1, .refinedConcrete)],
  outputs := [(0, .concrete), (0, .ironStick), (0, .steelPlate)],
  time := 15/16
}
| .refinedHazardConcrete => {
  name := "refined-hazard-concrete",
  inputs := [(10, .refinedConcrete)],
  outputs := [(10, .refinedHazardConcrete)],
  time := 1/4
}
| .refinedHazardConcreteRecycling => {
  name := "refined-hazard-concrete-recycling",
  inputs := [(1, .refinedHazardConcrete)],
  outputs := [(0, .refinedConcrete)],
  time := 1/64
}
| .repairPack => {
  name := "repair-pack",
  inputs := [(2, .ironGearWheel), (2, .electronicCircuit)],
  outputs := [(1, .repairPack)],
  time := 1/2
}
| .repairPackRecycling => {
  name := "repair-pack-recycling",
  inputs := [(1, .repairPack)],
  outputs := [(0, .electronicCircuit), (0, .ironGearWheel)],
  time := 1/32
}
| .requesterChest => {
  name := "requester-chest",
  inputs := [(3, .electronicCircuit), (1, .advancedCircuit), (1, .steelChest)],
  outputs := [(1, .requesterChest)],
  time := 1/2
}
| .requesterChestRecycling => {
  name := "requester-chest-recycling",
  inputs := [(1, .requesterChest)],
  outputs := [(0, .steelChest), (0, .electronicCircuit), (0, .advancedCircuit)],
  time := 1/32
}
| .roboport => {
  name := "roboport",
  inputs := [(45, .steelPlate), (45, .ironGearWheel), (45, .advancedCircuit)],
  outputs := [(1, .roboport)],
  time := 5
}
| .roboportRecycling => {
  name := "roboport-recycling",
  inputs := [(1, .roboport)],
  outputs := [(11, .steelPlate), (11, .ironGearWheel), (11, .advancedCircuit)],
  time := 5/16
}
| .rocket => {
  name := "rocket",
  inputs := [(2, .ironPlate), (1, .explosives)],
  outputs := [(1, .rocket)],
  time := 4
}
| .rocketFuel => {
  name := "rocket-fuel",
  inputs := [(10, .solidFuel), (10, .lightOil)],
  outputs := [(1, .rocketFuel)],
  time := 15
}
| .rocketFuelFromJelly => {
  name := "rocket-fuel-from-jelly",
  inputs := [(2, .bioflux), (30, .jelly), (30, .water)],
  outputs := [(1, .rocketFuel)],
  time := 10
}
| .rocketFuelRecycling => {
  name := "rocket-fuel-recycling",
  inputs := [(1, .rocketFuel)],
  outputs := [(2, .solidFuel)],
  time := 15/16
}
| .rocketLauncher => {
  name := "rocket-launcher",
  inputs := [(5, .ironPlate), (5, .ironGearWheel), (5, .electronicCircuit)],
  outputs := [(1, .rocketLauncher)],
  time := 10
}
| .rocketLauncherRecycling => {
  name := "rocket-launcher-recycling",
  inputs := [(1, .rocketLauncher)],
  outputs := [(1, .ironPlate), (1, .ironGearWheel), (1, .electronicCircuit)],
  time := 5/8
}
| .rocketPart => {
  name := "rocket-part",
  inputs := [(1, .processingUnit), (1, .lowDensityStructure), (1, .rocketFuel)],
  outputs := [(1, .rocketPart)],
  time := 3
}
| .rocketRecycling => {
  name := "rocket-recycling",
  inputs := [(1, .rocket)],
  outputs := [(0, .explosives), (0, .ironPlate)],
  time := 1/4
}
| .rocketSilo => {
  name := "rocket-silo",
  inputs := [(1000, .steelPlate), (200, .processingUnit), (200, .electricEngineUnit), (100, .pipe), (1000, .concrete)],
  outputs := [(1, .rocketSilo)],
  time := 30
}
| .rocketSiloRecycling => {
  name := "rocket-silo-recycling",
  inputs := [(1, .rocketSilo)],
  outputs := [(250, .steelPlate), (250, .concrete), (25, .pipe), (50, .processingUnit), (50, .electricEngineUnit)],
  time := 15/8
}
| .rocketTurret => {
  name := "rocket-turret",
  inputs := [(20, .steelPlate), (20, .ironGearWheel), (4, .processingUnit), (20, .carbonFiber), (4, .rocketLauncher)],
  outputs := [(1, .rocketTurret)],
  time := 10
}
| .rocketTurretRecycling => {
  name := "rocket-turret-recycling",
  inputs := [(1, .rocketTurret)],
  outputs := [(1, .rocketLauncher), (1, .processingUnit), (5, .carbonFiber), (5, .steelPlate), (5, .ironGearWheel)],
  time := 5/8
}
| .scienceRecycling => {
  name := "science-recycling",
  inputs := [(1, .science)],
  outputs := [(1/4, .science)],
  time := 1/32
}
| .scrapRecycling => {
  name := "scrap-recycling",
  inputs := [(1, .scrap)],
  outputs := [(1/5, .ironGearWheel), (7/100, .solidFuel), (3/50, .concrete), (1/20, .ice), (1/25, .steelPlate), (1/25, .battery), (1/25, .stone), (3/100, .advancedCircuit), (3/100, .copperCable), (1/50, .processingUnit), (1/100, .lowDensityStructure), (1/100, .holmiumOre)],
  time := 1/5
}
| .selectionToolRecycling => {
  name := "selection-tool-recycling",
  inputs := [(1, .selectionTool)],
  outputs := [(1/4, .selectionTool)],
  time := 1/32
}
| .selectorCombinator => {
  name := "selector-combinator",
  inputs := [(2, .advancedCircuit), (5, .deciderCombinator)],
  outputs := [(1, .selectorCombinator)],
  time := 1/2
}
| .selectorCombinatorRecycling => {
  name := "selector-combinator-recycling",
  inputs := [(1, .selectorCombinator)],
  outputs := [(0, .advancedCircuit), (1, .deciderCombinator)],
  time := 1/32
}
| .shotgun => {
  name := "shotgun",
  inputs := [(5, .wood), (15, .ironPlate), (10, .copperPlate), (5, .ironGearWheel)],
  outputs := [(1, .shotgun)],
  time := 10
}
| .shotgunRecycling => {
  name := "shotgun-recycling",
  inputs := [(1, .shotgun)],
  outputs := [(3, .ironPlate), (1, .ironGearWheel), (2, .copperPlate), (1, .wood)],
  time := 5/8
}
| .shotgunShell => {
  name := "shotgun-shell",
  inputs := [(2, .ironPlate), (2, .copperPlate)],
  outputs := [(1, .shotgunShell)],
  time := 3
}
| .shotgunShellRecycling => {
  name := "shotgun-shell-recycling",
  inputs := [(1, .shotgunShell)],
  outputs := [(0, .copperPlate), (0, .ironPlate)],
  time := 3/16
}
| .simpleCoalLiquefaction => {
  name := "simple-coal-liquefaction",
  inputs := [(10, .coal), (2, .calcite), (25, .sulfuricAcid)],
  outputs := [(50, .heavyOil)],
  time := 5
}
| .simpleEntityWithForceRecycling => {
  name := "simple-entity-with-force-recycling",
  inputs := [(1, .simpleEntityWithForce)],
  outputs := [(1/4, .simpleEntityWithForce)],
  time := 1/32
}
| .simpleEntityWithOwnerRecycling => {
  name := "simple-entity-with-owner-recycling",
  inputs := [(1, .simpleEntityWithOwner)],
  outputs := [(1/4, .simpleEntityWithOwner)],
  time := 1/32
}
| .slowdownCapsule => {
  name := "slowdown-capsule",
  inputs := [(5, .coal), (2, .steelPlate), (2, .electronicCircuit)],
  outputs := [(1, .slowdownCapsule)],
  time := 8
}
| .slowdownCapsuleRecycling => {
  name := "slowdown-capsule-recycling",
  inputs := [(1, .slowdownCapsule)],
  outputs := [(0, .steelPlate), (0, .electronicCircuit), (1, .coal)],
  time := 1/2
}
| .smallElectricPole => {
  name := "small-electric-pole",
  inputs := [(1, .wood), (2, .copperCable)],
  outputs := [(2, .smallElectricPole)],
  time := 1/2
}
| .smallElectricPoleRecycling => {
  name := "small-electric-pole-recycling",
  inputs := [(1, .smallElectricPole)],
  outputs := [(0, .wood), (0, .copperCable)],
  time := 1/32
}
| .smallLamp => {
  name := "small-lamp",
  inputs := [(1, .ironPlate), (3, .copperCable), (1, .electronicCircuit)],
  outputs := [(1, .smallLamp)],
  time := 1/2
}
| .smallLampRecycling => {
  name := "small-lamp-recycling",
  inputs := [(1, .smallLamp)],
  outputs := [(0, .electronicCircuit), (0, .copperCable), (0, .ironPlate)],
  time := 1/32
}
| .solarPanel => {
  name := "solar-panel",
  inputs := [(5, .copperPlate), (5, .steelPlate), (15, .electronicCircuit)],
  outputs := [(1, .solarPanel)],
  time := 10
}
| .solarPanelEquipment => {
  name := "solar-panel-equipment",
  inputs := [(5, .steelPlate), (2, .advancedCircuit), (1, .solarPanel)],
  outputs := [(1, .solarPanelEquipment)],
  time := 10
}
| .solarPanelEquipmentRecycling => {
  name := "solar-panel-equipment-recycling",
  inputs := [(1, .solarPanelEquipment)],
  outputs := [(0, .solarPanel), (0, .advancedCircuit), (1, .steelPlate)],
  time := 5/8
}
| .solarPanelRecycling => {
  name := "solar-panel-recycling",
  inputs := [(1, .solarPanel)],
  outputs := [(1, .steelPlate), (3, .electronicCircuit), (1, .copperPlate)],
  time := 5/8
}
| .solidFuelFromAmmonia => {
  name := "solid-fuel-from-ammonia",
  inputs := [(15, .ammonia), (6, .crudeOil)],
  outputs := [(1, .solidFuel)],
  time := 1/2
}
| .solidFuelFromHeavyOil => {
  name := "solid-fuel-from-heavy-oil",
  inputs := [(20, .heavyOil)],
  outputs := [(1, .solidFuel)],
  time := 1
}
| .solidFuelFromLightOil => {
  name := "solid-fuel-from-light-oil",
  inputs := [(10, .lightOil)],
  outputs := [(1, .solidFuel)],
  time := 1
}
| .solidFuelFromPetroleumGas => {
  name := "solid-fuel-from-petroleum-gas",
  inputs := [(20, .petroleumGas)],
  outputs := [(1, .solidFuel)],
  time := 1
}
| .solidFuelRecycling => {
  name := "solid-fuel-recycling",
  inputs := [(1, .solidFuel)],
  outputs := [(1/4, .solidFuel)],
  time := 1/32
}
| .spacePlatformFoundation => {
  name := "space-platform-foundation",
  inputs := [(20, .steelPlate), (20, .copperCable)],
  outputs := [(1, .spacePlatformFoundation)],
  time := 10
}
| .spacePlatformFoundationRecycling => {
  name := "space-platform-foundation-recycling",
  inputs := [(1, .spacePlatformFoundation)],
  outputs := [(5, .steelPlate), (5, .copperCable)],
  time := 5/8
}
| .spacePlatformHubRecycling => {
  name := "space-platform-hub-recycling",
  inputs := [(1, .spacePlatformHub)],
  outputs := [(1/4, .spacePlatformHub)],
  time := 1/32
}
| .spacePlatformStarterPack => {
  name := "space-platform-starter-pack",
  inputs := [(20, .steelPlate), (20, .processingUnit), (60, .spacePlatformFoundation)],
  outputs := [(1, .spacePlatformStarterPack)],
  time := 60
}
| .spacePlatformStarterPackRecycling => {
  name := "space-platform-starter-pack-recycling",
  inputs := [(1, .spacePlatformStarterPack)],
  outputs := [(15, .spacePlatformFoundation), (5, .steelPlate), (5, .processingUnit)],
  time := 15/4
}
| .spaceSciencePack => {
  name := "space-science-pack",
  inputs := [(1, .ice), (2, .ironPlate), (1, .carbon)],
  outputs := [(5, .spaceSciencePack)],
  time := 15
}
| .spaceSciencePackRecycling => {
  name := "space-science-pack-recycling",
  inputs := [(1, .spaceSciencePack)],
  outputs := [(1/4, .spaceSciencePack)],
  time := 15/16
}
| .speedModule => {
  name := "speed-module",
  inputs := [(5, .electronicCircuit), (5, .advancedCircuit)],
  outputs := [(1, .speedModule)],
  time := 15
}
| .speedModule2 => {
  name := "speed-module-2",
  inputs := [(5, .advancedCircuit), (5, .processingUnit), (4, .speedModule)],
  outputs := [(1, .speedModule2)],
  time := 30
}
| .speedModule2Recycling => {
  name := "speed-module-2-recycling",
  inputs := [(1, .speedModule2)],
  outputs := [(1, .speedModule), (1, .advancedCircuit), (1, .processingUnit)],
  time := 15/8
}
| .speedModule3 => {
  name := "speed-module-3",
  inputs := [(5, .advancedCircuit), (5, .processingUnit), (1, .tungstenCarbide), (4, .speedModule2)],
  outputs := [(1, .speedModule3)],
  time := 60
}
| .speedModule3Recycling => {
  name := "speed-module-3-recycling",
  inputs := [(1, .speedModule3)],
  outputs := [(1, .speedModule2), (1, .advancedCircuit), (1, .processingUnit), (0, .tungstenCarbide)],
  time := 15/4
}
| .speedModuleRecycling => {
  name := "speed-module-recycling",
  inputs := [(1, .speedModule)],
  outputs := [(1, .advancedCircuit), (1, .electronicCircuit)],
  time := 15/16
}
| .spidertron => {
  name := "spidertron",
  inputs := [(1, .rawFish), (2, .fissionReactorEquipment), (4, .exoskeletonEquipment), (2, .radar), (1, .rocketTurret)],
  outputs := [(1, .spidertron)],
  time := 10
}
| .spidertronRecycling => {
  name := "spidertron-recycling",
  inputs := [(1, .spidertron)],
  outputs := [(1, .exoskeletonEquipment), (0, .fissionReactorEquipment), (0, .rocketTurret), (0, .radar), (0, .rawFish)],
  time := 5/8
}
| .splitter => {
  name := "splitter",
  inputs := [(5, .ironPlate), (5, .electronicCircuit), (4, .transportBelt)],
  outputs := [(1, .splitter)],
  time := 1
}
| .splitterRecycling => {
  name := "splitter-recycling",
  inputs := [(1, .splitter)],
  outputs := [(1, .electronicCircuit), (1, .ironPlate), (1, .transportBelt)],
  time := 1/16
}
| .spoilageRecycling => {
  name := "spoilage-recycling",
  inputs := [(1, .spoilage)],
  outputs := [(1/4, .spoilage)],
  time := 1/32
}
| .stackInserter => {
  name := "stack-inserter",
  inputs := [(1, .processingUnit), (10, .jelly), (2, .carbonFiber), (1, .bulkInserter)],
  outputs := [(1, .stackInserter)],
  time := 1/2
}
| .stackInserterRecycling => {
  name := "stack-inserter-recycling",
  inputs := [(1, .stackInserter)],
  outputs := [(0, .bulkInserter), (0, .processingUnit), (0, .carbonFiber), (2, .jelly)],
  time := 1/32
}
| .steamCondensation => {
  name := "steam-condensation",
  inputs := [(1000, .steam)],
  outputs := [(90, .water)],
  time := 1
}
| .steamEngine => {
  name := "steam-engine",
  inputs := [(10, .ironPlate), (8, .ironGearWheel), (5, .pipe)],
  outputs := [(1, .steamEngine)],
  time := 1/2
}
| .steamEngineRecycling => {
  name := "steam-engine-recycling",
  inputs := [(1, .steamEngine)],
  outputs := [(2, .ironGearWheel), (1, .pipe), (2, .ironPlate)],
  time := 1/32
}
| .steamTurbine => {
  name := "steam-turbine",
  inputs := [(50, .copperPlate), (50, .ironGearWheel), (20, .pipe)],
  outputs := [(1, .steamTurbine)],
  time := 3
}
| .steamTurbineRecycling => {
  name := "steam-turbine-recycling",
  inputs := [(1, .steamTurbine)],
  outputs := [(12, .ironGearWheel), (12, .copperPlate), (5, .pipe)],
  time := 3/16
}
| .steelChest => {
  name := "steel-chest",
  inputs := [(8, .steelPlate)],
  outputs := [(1, .steelChest)],
  time := 1/2
}
| .steelChestRecycling => {
  name := "steel-chest-recycling",
  inputs := [(1, .steelChest)],
  outputs := [(2, .steelPlate)],
  time := 1/32
}
| .steelFurnace => {
  name := "steel-furnace",
  inputs := [(6, .steelPlate), (10, .stoneBrick)],
  outputs := [(1, .steelFurnace)],
  time := 3
}
| .steelFurnaceRecycling => {
  name := "steel-furnace-recycling",
  inputs := [(1, .steelFurnace)],
  outputs := [(1, .steelPlate), (2, .stoneBrick)],
  time := 3/16
}
| .steelPlate => {
  name := "steel-plate",
  inputs := [(5, .ironPlate)],
  outputs := [(1, .steelPlate)],
  time := 16
}
| .steelPlateRecycling => {
  name := "steel-plate-recycling",
  inputs := [(1, .steelPlate)],
  outputs := [(1/4, .steelPlate)],
  time := 1
}
| .stoneBrick => {
  name := "stone-brick",
  inputs := [(2, .stone)],
  outputs := [(1, .stoneBrick)],
  time := 16/5
}
| .stoneBrickRecycling => {
  name := "stone-brick-recycling",
  inputs := [(1, .stoneBrick)],
  outputs := [(1/4, .stoneBrick)],
  time := 1/5
}
| .stoneFurnace => {
  name := "stone-furnace",
  inputs := [(5, .stone)],
  outputs := [(1, .stoneFurnace)],
  time := 1/2
}
| .stoneFurnaceRecycling => {
  name := "stone-furnace-recycling",
  inputs := [(1, .stoneFurnace)],
  outputs := [(1, .stone)],
  time := 1/32
}
| .stoneRecycling => {
  name := "stone-recycling",
  inputs := [(1, .stone)],
  outputs := [(1/4, .stone)],
  time := 1/32
}
| .stoneWall => {
  name := "stone-wall",
  inputs := [(5, .stoneBrick)],
  outputs := [(1, .stoneWall)],
  time := 1/2
}
| .stoneWallRecycling => {
  name := "stone-wall-recycling",
  inputs := [(1, .stoneWall)],
  outputs := [(1, .stoneBrick)],
  time := 1/32
}
| .storageChest => {
  name := "storage-chest",
  inputs := [(3, .electronicCircuit), (1, .advancedCircuit), (1, .steelChest)],
  outputs := [(1, .storageChest)],
  time := 1/2
}
| .storageChestRecycling => {
  name := "storage-chest-recycling",
  inputs := [(1, .storageChest)],
  outputs := [(0, .steelChest), (0, .electronicCircuit), (0, .advancedCircuit)],
  time := 1/32
}
| .storageTank => {
  name := "storage-tank",
  inputs := [(20, .ironPlate), (5, .steelPlate)],
  outputs := [(1, .storageTank)],
  time := 3
}
| .storageTankRecycling => {
  name := "storage-tank-recycling",
  inputs := [(1, .storageTank)],
  outputs := [(5, .ironPlate), (1, .steelPlate)],
  time := 3/16
}
| .submachineGun => {
  name := "submachine-gun",
  inputs := [(10, .ironPlate), (5, .copperPlate), (10, .ironGearWheel)],
  outputs := [(1, .submachineGun)],
  time := 10
}
| .submachineGunRecycling => {
  name := "submachine-gun-recycling",
  inputs := [(1, .submachineGun)],
  outputs := [(2, .ironGearWheel), (1, .copperPlate), (2, .ironPlate)],
  time := 5/8
}
| .substation => {
  name := "substation",
  inputs := [(10, .steelPlate), (6, .copperCable), (5, .advancedCircuit)],
  outputs := [(1, .substation)],
  time := 1/2
}
| .substationRecycling => {
  name := "substation-recycling",
  inputs := [(1, .substation)],
  outputs := [(2, .steelPlate), (1, .advancedCircuit), (1, .copperCable)],
  time := 1/32
}
| .sulfur => {
  name := "sulfur",
  inputs := [(30, .water), (30, .petroleumGas)],
  outputs := [(2, .sulfur)],
  time := 1
}
| .sulfurRecycling => {
  name := "sulfur-recycling",
  inputs := [(1, .sulfur)],
  outputs := [(1/4, .sulfur)],
  time := 1/16
}
| .sulfuricAcid => {
  name := "sulfuric-acid",
  inputs := [(1, .ironPlate), (5, .sulfur), (100, .water)],
  outputs := [(50, .sulfuricAcid)],
  time := 1
}
| .sulfuricAcidBarrel => {
  name := "sulfuric-acid-barrel",
  inputs := [(1, .barrel), (50, .sulfuricAcid)],
  outputs := [(1, .sulfuricAcidBarrel)],
  time := 1/5
}
| .sulfuricAcidBarrelRecycling => {
  name := "sulfuric-acid-barrel-recycling",
  inputs := [(1, .sulfuricAcidBarrel)],
  outputs := [(0, .barrel)],
  time := 1/80
}
| .supercapacitor => {
  name := "supercapacitor",
  inputs := [(1, .battery), (4, .electronicCircuit), (2, .holmiumPlate), (2, .superconductor), (10, .electrolyte)],
  outputs := [(1, .supercapacitor)],
  time := 10
}
| .supercapacitorRecycling => {
  name := "supercapacitor-recycling",
  inputs := [(1, .supercapacitor)],
  outputs := [(0, .holmiumPlate), (0, .superconductor), (1, .electronicCircuit), (0, .battery)],
  time := 5/8
}
| .superconductor => {
  name := "superconductor",
  inputs := [(1, .copperPlate), (1, .plasticBar), (1, .holmiumPlate), (5, .lightOil)],
  outputs := [(2, .superconductor)],
  time := 5
}
| .superconductorRecycling => {
  name := "superconductor-recycling",
  inputs := [(1, .superconductor)],
  outputs := [(1/4, .superconductor)],
  time := 5/16
}
| .tank => {
  name := "tank",
  inputs := [(50, .steelPlate), (15, .ironGearWheel), (10, .advancedCircuit), (32, .engineUnit)],
  outputs := [(1, .tank)],
  time := 5
}
| .tankRecycling => {
  name := "tank-recycling",
  inputs := [(1, .tank)],
  outputs := [(8, .engineUnit), (12, .steelPlate), (3, .ironGearWheel), (2, .advancedCircuit)],
  time := 5/16
}
| .teslaAmmo => {
  name := "tesla-ammo",
  inputs := [(1, .plasticBar), (1, .supercapacitor), (10, .electrolyte)],
  outputs := [(1, .teslaAmmo)],
  time := 30
}
| .teslaAmmoRecycling => {
  name := "tesla-ammo-recycling",
  inputs := [(1, .teslaAmmo)],
  outputs := [(0, .supercapacitor), (0, .plasticBar)],
  time := 15/8
}
| .teslaTurret => {
  name := "tesla-turret",
  inputs := [(10, .processingUnit), (50, .superconductor), (10, .supercapacitor), (1, .teslagun), (500, .electrolyte)],
  outputs := [(1, .teslaTurret)],
  time := 30
}
| .teslaTurretRecycling => {
  name := "tesla-turret-recycling",
  inputs := [(1, .teslaTurret)],
  outputs := [(0, .teslagun), (2, .supercapacitor), (2, .processingUnit), (12, .superconductor)],
  time := 15/8
}
| .teslagun => {
  name := "teslagun",
  inputs := [(30, .plasticBar), (10, .holmiumPlate), (10, .superconductor), (100, .electrolyte)],
  outputs := [(1, .teslagun)],
  time := 30
}
| .teslagunRecycling => {
  name := "teslagun-recycling",
  inputs := [(1, .teslagun)],
  outputs := [(2, .holmiumPlate), (2, .superconductor), (7, .plasticBar)],
  time := 15/8
}
| .thruster => {
  name := "thruster",
  inputs := [(10, .steelPlate), (10, .processingUnit), (5, .electricEngineUnit)],
  outputs := [(1, .thruster)],
  time := 10
}
| .thrusterFuel => {
  name := "thruster-fuel",
  inputs := [(2, .carbon), (10, .water)],
  outputs := [(75, .thrusterFuel)],
  time := 2
}
| .thrusterOxidizer => {
  name := "thruster-oxidizer",
  inputs := [(2, .ironOre), (10, .water)],
  outputs := [(75, .thrusterOxidizer)],
  time := 2
}
| .thrusterRecycling => {
  name := "thruster-recycling",
  inputs := [(1, .thruster)],
  outputs := [(2, .steelPlate), (2, .processingUnit), (1, .electricEngineUnit)],
  time := 5/8
}
| .toolbeltEquipment => {
  name := "toolbelt-equipment",
  inputs := [(3, .advancedCircuit), (10, .carbonFiber)],
  outputs := [(1, .toolbeltEquipment)],
  time := 10
}
| .toolbeltEquipmentRecycling => {
  name := "toolbelt-equipment-recycling",
  inputs := [(1, .toolbeltEquipment)],
  outputs := [(0, .advancedCircuit), (2, .carbonFiber)],
  time := 5/8
}
| .topUpValveRecycling => {
  name := "top-up-valve-recycling",
  inputs := [(1, .topUpValve)],
  outputs := [(1/4, .topUpValve)],
  time := 1/32
}
| .trainStop => {
  name := "train-stop",
  inputs := [(6, .ironPlate), (3, .steelPlate), (6, .ironStick), (5, .electronicCircuit)],
  outputs := [(1, .trainStop)],
  time := 1/2
}
| .trainStopRecycling => {
  name := "train-stop-recycling",
  inputs := [(1, .trainStop)],
  outputs := [(1, .electronicCircuit), (1, .ironPlate), (1, .ironStick), (0, .steelPlate)],
  time := 1/32
}
| .transportBelt => {
  name := "transport-belt",
  inputs := [(1, .ironPlate), (1, .ironGearWheel)],
  outputs := [(2, .transportBelt)],
  time := 1/2
}
| .transportBeltRecycling => {
  name := "transport-belt-recycling",
  inputs := [(1, .transportBelt)],
  outputs := [(0, .ironPlate), (0, .ironGearWheel)],
  time := 1/32
}
| .treeSeedRecycling => {
  name := "tree-seed-recycling",
  inputs := [(1, .treeSeed)],
  outputs := [(1/4, .treeSeed)],
  time := 1/32
}
| .tungstenCarbide => {
  name := "tungsten-carbide",
  inputs := [(1, .carbon), (2, .tungstenOre), (10, .sulfuricAcid)],
  outputs := [(1, .tungstenCarbide)],
  time := 1
}
| .tungstenCarbideRecycling => {
  name := "tungsten-carbide-recycling",
  inputs := [(1, .tungstenCarbide)],
  outputs := [(1/4, .tungstenCarbide)],
  time := 1/16
}
| .tungstenOreRecycling => {
  name := "tungsten-ore-recycling",
  inputs := [(1, .tungstenOre)],
  outputs := [(1/4, .tungstenOre)],
  time := 1/32
}
| .tungstenPlate => {
  name := "tungsten-plate",
  inputs := [(4, .tungstenOre), (10, .moltenIron)],
  outputs := [(1, .tungstenPlate)],
  time := 10
}
| .tungstenPlateRecycling => {
  name := "tungsten-plate-recycling",
  inputs := [(1, .tungstenPlate)],
  outputs := [(1/4, .tungstenPlate)],
  time := 5/8
}
| .turboLoader => {
  name := "turbo-loader",
  inputs := [(5, .turboTransportBelt), (1, .expressLoader)],
  outputs := [(1, .turboLoader)],
  time := 20
}
| .turboLoaderRecycling => {
  name := "turbo-loader-recycling",
  inputs := [(1, .turboLoader)],
  outputs := [(1, .turboTransportBelt), (0, .expressLoader)],
  time := 5/4
}
| .turboSplitter => {
  name := "turbo-splitter",
  inputs := [(2, .processingUnit), (15, .tungstenPlate), (1, .expressSplitter), (80, .lubricant)],
  outputs := [(1, .turboSplitter)],
  time := 2
}
| .turboSplitterRecycling => {
  name := "turbo-splitter-recycling",
  inputs := [(1, .turboSplitter)],
  outputs := [(0, .expressSplitter), (3, .tungstenPlate), (0, .processingUnit)],
  time := 1/8
}
| .turboTransportBelt => {
  name := "turbo-transport-belt",
  inputs := [(5, .tungstenPlate), (1, .expressTransportBelt), (20, .lubricant)],
  outputs := [(1, .turboTransportBelt)],
  time := 1/2
}
| .turboTransportBeltRecycling => {
  name := "turbo-transport-belt-recycling",
  inputs := [(1, .turboTransportBelt)],
  outputs := [(1, .tungstenPlate), (0, .expressTransportBelt)],
  time := 1/32
}
| .turboUndergroundBelt => {
  name := "turbo-underground-belt",
  inputs := [(40, .tungstenPlate), (2, .expressUndergroundBelt), (40, .lubricant)],
  outputs := [(2, .turboUndergroundBelt)],
  time := 2
}
| .turboUndergroundBeltRecycling => {
  name := "turbo-underground-belt-recycling",
  inputs := [(1, .turboUndergroundBelt)],
  outputs := [(5, .tungstenPlate), (0, .expressUndergroundBelt)],
  time := 1/8
}
| .undergroundBelt => {
  name := "underground-belt",
  inputs := [(10, .ironPlate), (5, .transportBelt)],
  outputs := [(2, .undergroundBelt)],
  time := 1
}
| .undergroundBeltRecycling => {
  name := "underground-belt-recycling",
  inputs := [(1, .undergroundBelt)],
  outputs := [(1, .ironPlate), (0, .transportBelt)],
  time := 1/16
}
| .upgradePlannerRecycling => {
  name := "upgrade-planner-recycling",
  inputs := [(1, .upgradePlanner)],
  outputs := [(1/4, .upgradePlanner)],
  time := 1/32
}
| .uranium235Recycling => {
  name := "uranium-235-recycling",
  inputs := [(1, .uranium235)],
  outputs := [(1/4, .uranium235)],
  time := 1/32
}
| .uranium238Recycling => {
  name := "uranium-238-recycling",
  inputs := [(1, .uranium238)],
  outputs := [(1/4, .uranium238)],
  time := 1/32
}
| .uraniumCannonShell => {
  name := "uranium-cannon-shell",
  inputs := [(1, .uranium238), (1, .cannonShell)],
  outputs := [(1, .uraniumCannonShell)],
  time := 12
}
| .uraniumCannonShellRecycling => {
  name := "uranium-cannon-shell-recycling",
  inputs := [(1, .uraniumCannonShell)],
  outputs := [(0, .cannonShell), (0, .uranium238)],
  time := 3/4
}
| .uraniumFuelCell => {
  name := "uranium-fuel-cell",
  inputs := [(10, .ironPlate), (1, .uranium235), (19, .uranium238)],
  outputs := [(10, .uraniumFuelCell)],
  time := 10
}
| .uraniumFuelCellRecycling => {
  name := "uranium-fuel-cell-recycling",
  inputs := [(1, .uraniumFuelCell)],
  outputs := [(1/4, .uraniumFuelCell)],
  time := 5/8
}
| .uraniumOreRecycling => {
  name := "uranium-ore-recycling",
  inputs := [(1, .uraniumOre)],
  outputs := [(1/4, .uraniumOre)],
  time := 1/32
}
| .uraniumProcessing => {
  name := "uranium-processing",
  inputs := [(10, .uraniumOre)],
  outputs := [(7/1000, .uranium235), (993/1000, .uranium238)],
  time := 12
}
| .uraniumRoundsMagazine => {
  name := "uranium-rounds-magazine",
  inputs := [(1, .uranium238), (1, .piercingRoundsMagazine)],
  outputs := [(1, .uraniumRoundsMagazine)],
  time := 10
}
| .uraniumRoundsMagazineRecycling => {
  name := "uranium-rounds-magazine-recycling",
  inputs := [(1, .uraniumRoundsMagazine)],
  outputs := [(0, .piercingRoundsMagazine), (0, .uranium238)],
  time := 5/8
}
| .utilitySciencePack => {
  name := "utility-science-pack",
  inputs := [(2, .processingUnit), (1, .flyingRobotFrame), (3, .lowDensityStructure)],
  outputs := [(3, .utilitySciencePack)],
  time := 21
}
| .utilitySciencePackRecycling => {
  name := "utility-science-pack-recycling",
  inputs := [(1, .utilitySciencePack)],
  outputs := [(1/4, .utilitySciencePack)],
  time := 21/16
}
| .waterBarrel => {
  name := "water-barrel",
  inputs := [(1, .barrel), (50, .water)],
  outputs := [(1, .waterBarrel)],
  time := 1/5
}
| .waterBarrelRecycling => {
  name := "water-barrel-recycling",
  inputs := [(1, .waterBarrel)],
  outputs := [(0, .barrel)],
  time := 1/80
}
| .woodProcessing => {
  name := "wood-processing",
  inputs := [(2, .wood)],
  outputs := [(1, .treeSeed)],
  time := 2
}
| .woodRecycling => {
  name := "wood-recycling",
  inputs := [(1, .wood)],
  outputs := [(1/4, .wood)],
  time := 1/32
}
| .woodenChest => {
  name := "wooden-chest",
  inputs := [(2, .wood)],
  outputs := [(1, .woodenChest)],
  time := 1/2
}
| .woodenChestRecycling => {
  name := "wooden-chest-recycling",
  inputs := [(1, .woodenChest)],
  outputs := [(0, .wood)],
  time := 1/32
}
| .yumakoMashRecycling => {
  name := "yumako-mash-recycling",
  inputs := [(1, .yumakoMash)],
  outputs := [(1/4, .yumakoMash)],
  time := 1/32
}
| .yumakoProcessing => {
  name := "yumako-processing",
  inputs := [(1, .yumako)],
  outputs := [(1/50, .yumakoSeed), (2, .yumakoMash)],
  time := 1
}
| .yumakoRecycling => {
  name := "yumako-recycling",
  inputs := [(1, .yumako)],
  outputs := [(1/4, .yumako)],
  time := 1/32
}
| .yumakoSeedRecycling => {
  name := "yumako-seed-recycling",
  inputs := [(1, .yumakoSeed)],
  outputs := [(1/4, .yumakoSeed)],
  time := 1/32
}

end RecipeName
