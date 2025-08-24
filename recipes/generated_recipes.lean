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

def getRecipe : RecipeName → Recipe
| .accumulator => {
  name := some "accumulator",
  inputs := [(2, .ironPlate), (5, .battery)],
  outputs := [(1, .accumulator)],
  time := 10
}
| .accumulatorRecycling => {
  name := some "accumulator-recycling",
  inputs := [(1, .accumulator)],
  outputs := [(0, .ironPlate), (1, .battery)],
  time := 0.625
}
| .acidNeutralisation => {
  name := some "acid-neutralisation",
  inputs := [(1, .calcite), (1000, .sulfuricAcid)],
  outputs := [(10000, .steam)],
  time := 5
}
| .activeProviderChest => {
  name := some "active-provider-chest",
  inputs := [(3, .electronicCircuit), (1, .advancedCircuit), (1, .steelChest)],
  outputs := [(1, .activeProviderChest)],
  time := 0.5
}
| .activeProviderChestRecycling => {
  name := some "active-provider-chest-recycling",
  inputs := [(1, .activeProviderChest)],
  outputs := [(0, .steelChest), (0, .electronicCircuit), (0, .advancedCircuit)],
  time := 0.03125
}
| .advancedCarbonicAsteroidCrushing => {
  name := some "advanced-carbonic-asteroid-crushing",
  inputs := [(1, .carbonicAsteroidChunk)],
  outputs := [(5, .carbon), (2, .sulfur), (1, .carbonicAsteroidChunk)],
  time := 5
}
| .advancedCircuit => {
  name := some "advanced-circuit",
  inputs := [(2, .plasticBar), (4, .copperCable), (2, .electronicCircuit)],
  outputs := [(1, .advancedCircuit)],
  time := 6
}
| .advancedCircuitRecycling => {
  name := some "advanced-circuit-recycling",
  inputs := [(1, .advancedCircuit)],
  outputs := [(0, .electronicCircuit), (0, .plasticBar), (1, .copperCable)],
  time := 0.375
}
| .advancedMetallicAsteroidCrushing => {
  name := some "advanced-metallic-asteroid-crushing",
  inputs := [(1, .metallicAsteroidChunk)],
  outputs := [(10, .ironOre), (4, .copperOre), (1, .metallicAsteroidChunk)],
  time := 5
}
| .advancedOilProcessing => {
  name := some "advanced-oil-processing",
  inputs := [(50, .water), (100, .crudeOil)],
  outputs := [(25, .heavyOil), (45, .lightOil), (55, .petroleumGas)],
  time := 5
}
| .advancedOxideAsteroidCrushing => {
  name := some "advanced-oxide-asteroid-crushing",
  inputs := [(1, .oxideAsteroidChunk)],
  outputs := [(3, .ice), (2, .calcite), (1, .oxideAsteroidChunk)],
  time := 5
}
| .advancedThrusterFuel => {
  name := some "advanced-thruster-fuel",
  inputs := [(2, .carbon), (1, .calcite), (100, .water)],
  outputs := [(1500, .thrusterFuel)],
  time := 10
}
| .advancedThrusterOxidizer => {
  name := some "advanced-thruster-oxidizer",
  inputs := [(2, .ironOre), (1, .calcite), (100, .water)],
  outputs := [(1500, .thrusterOxidizer)],
  time := 10
}
| .agriculturalSciencePack => {
  name := some "agricultural-science-pack",
  inputs := [(1, .bioflux), (1, .pentapodEgg)],
  outputs := [(1, .agriculturalSciencePack)],
  time := 4
}
| .agriculturalSciencePackRecycling => {
  name := some "agricultural-science-pack-recycling",
  inputs := [(1, .agriculturalSciencePack)],
  outputs := [(1, .agriculturalSciencePack)],
  time := 0.25
}
| .agriculturalTower => {
  name := some "agricultural-tower",
  inputs := [(10, .steelPlate), (3, .electronicCircuit), (20, .spoilage), (1, .landfill)],
  outputs := [(1, .agriculturalTower)],
  time := 10
}
| .agriculturalTowerRecycling => {
  name := some "agricultural-tower-recycling",
  inputs := [(1, .agriculturalTower)],
  outputs := [(2, .steelPlate), (0, .electronicCircuit), (5, .spoilage), (0, .landfill)],
  time := 0.625
}
| .ammoniaRocketFuel => {
  name := some "ammonia-rocket-fuel",
  inputs := [(10, .solidFuel), (50, .water), (500, .ammonia)],
  outputs := [(1, .rocketFuel)],
  time := 10
}
| .ammoniacalSolutionSeparation => {
  name := some "ammoniacal-solution-separation",
  inputs := [(50, .ammoniacalSolution)],
  outputs := [(5, .ice), (50, .ammonia)],
  time := 1
}
| .arithmeticCombinator => {
  name := some "arithmetic-combinator",
  inputs := [(5, .copperCable), (5, .electronicCircuit)],
  outputs := [(1, .arithmeticCombinator)],
  time := 0.5
}
| .arithmeticCombinatorRecycling => {
  name := some "arithmetic-combinator-recycling",
  inputs := [(1, .arithmeticCombinator)],
  outputs := [(1, .copperCable), (1, .electronicCircuit)],
  time := 0.03125
}
| .artificialJellynutSoil => {
  name := some "artificial-jellynut-soil",
  inputs := [(2, .jellynutSeed), (50, .nutrients), (5, .landfill)],
  outputs := [(10, .artificialJellynutSoil)],
  time := 2
}
| .artificialJellynutSoilRecycling => {
  name := some "artificial-jellynut-soil-recycling",
  inputs := [(1, .artificialJellynutSoil)],
  outputs := [(0, .jellynutSeed), (1, .nutrients), (0, .landfill)],
  time := 0.125
}
| .artificialYumakoSoil => {
  name := some "artificial-yumako-soil",
  inputs := [(2, .yumakoSeed), (50, .nutrients), (5, .landfill)],
  outputs := [(10, .artificialYumakoSoil)],
  time := 2
}
| .artificialYumakoSoilRecycling => {
  name := some "artificial-yumako-soil-recycling",
  inputs := [(1, .artificialYumakoSoil)],
  outputs := [(0, .yumakoSeed), (1, .nutrients), (0, .landfill)],
  time := 0.125
}
| .artilleryShell => {
  name := some "artillery-shell",
  inputs := [(8, .explosives), (1, .calcite), (4, .tungstenPlate), (1, .radar)],
  outputs := [(1, .artilleryShell)],
  time := 15
}
| .artilleryShellRecycling => {
  name := some "artillery-shell-recycling",
  inputs := [(1, .artilleryShell)],
  outputs := [(0, .radar), (0, .calcite), (1, .tungstenPlate), (2, .explosives)],
  time := 0.9375
}
| .artilleryTurret => {
  name := some "artillery-turret",
  inputs := [(40, .ironGearWheel), (10, .processingUnit), (60, .tungstenPlate), (60, .refinedConcrete)],
  outputs := [(1, .artilleryTurret)],
  time := 40
}
| .artilleryTurretRecycling => {
  name := some "artillery-turret-recycling",
  inputs := [(1, .artilleryTurret)],
  outputs := [(15, .tungstenPlate), (15, .refinedConcrete), (10, .ironGearWheel), (2, .processingUnit)],
  time := 2.5
}
| .artilleryWagon => {
  name := some "artillery-wagon",
  inputs := [(40, .ironGearWheel), (10, .processingUnit), (60, .engineUnit), (60, .tungstenPlate), (60, .refinedConcrete)],
  outputs := [(1, .artilleryWagon)],
  time := 4
}
| .artilleryWagonRecycling => {
  name := some "artillery-wagon-recycling",
  inputs := [(1, .artilleryWagon)],
  outputs := [(15, .engineUnit), (15, .tungstenPlate), (15, .refinedConcrete), (10, .ironGearWheel), (2, .processingUnit)],
  time := 0.25
}
| .assemblingMachine1 => {
  name := some "assembling-machine-1",
  inputs := [(9, .ironPlate), (5, .ironGearWheel), (3, .electronicCircuit)],
  outputs := [(1, .assemblingMachine1)],
  time := 0.5
}
| .assemblingMachine1Recycling => {
  name := some "assembling-machine-1-recycling",
  inputs := [(1, .assemblingMachine1)],
  outputs := [(0, .electronicCircuit), (1, .ironGearWheel), (2, .ironPlate)],
  time := 0.03125
}
| .assemblingMachine2 => {
  name := some "assembling-machine-2",
  inputs := [(2, .steelPlate), (5, .ironGearWheel), (3, .electronicCircuit), (1, .assemblingMachine1)],
  outputs := [(1, .assemblingMachine2)],
  time := 0.5
}
| .assemblingMachine2Recycling => {
  name := some "assembling-machine-2-recycling",
  inputs := [(1, .assemblingMachine2)],
  outputs := [(0, .steelPlate), (0, .electronicCircuit), (1, .ironGearWheel), (0, .assemblingMachine1)],
  time := 0.03125
}
| .assemblingMachine3 => {
  name := some "assembling-machine-3",
  inputs := [(2, .assemblingMachine2), (4, .speedModule)],
  outputs := [(1, .assemblingMachine3)],
  time := 0.5
}
| .assemblingMachine3Recycling => {
  name := some "assembling-machine-3-recycling",
  inputs := [(1, .assemblingMachine3)],
  outputs := [(0, .assemblingMachine2), (1, .speedModule)],
  time := 0.03125
}
| .asteroidCollector => {
  name := some "asteroid-collector",
  inputs := [(5, .processingUnit), (8, .electricEngineUnit), (20, .lowDensityStructure)],
  outputs := [(1, .asteroidCollector)],
  time := 10
}
| .asteroidCollectorRecycling => {
  name := some "asteroid-collector-recycling",
  inputs := [(1, .asteroidCollector)],
  outputs := [(5, .lowDensityStructure), (2, .electricEngineUnit), (1, .processingUnit)],
  time := 0.625
}
| .atomicBomb => {
  name := some "atomic-bomb",
  inputs := [(10, .explosives), (10, .processingUnit), (100, .uranium235)],
  outputs := [(1, .atomicBomb)],
  time := 50
}
| .atomicBombRecycling => {
  name := some "atomic-bomb-recycling",
  inputs := [(1, .atomicBomb)],
  outputs := [(2, .processingUnit), (2, .explosives), (25, .uranium235)],
  time := 3.125
}
| .automationSciencePack => {
  name := some "automation-science-pack",
  inputs := [(1, .copperPlate), (1, .ironGearWheel)],
  outputs := [(1, .automationSciencePack)],
  time := 5
}
| .automationSciencePackRecycling => {
  name := some "automation-science-pack-recycling",
  inputs := [(1, .automationSciencePack)],
  outputs := [(1, .automationSciencePack)],
  time := 0.3125
}
| .barrel => {
  name := some "barrel",
  inputs := [(1, .steelPlate)],
  outputs := [(1, .barrel)],
  time := 1
}
| .barrelRecycling => {
  name := some "barrel-recycling",
  inputs := [(1, .barrel)],
  outputs := [(0, .steelPlate)],
  time := 0.0625
}
| .basicOilProcessing => {
  name := some "basic-oil-processing",
  inputs := [(100, .crudeOil)],
  outputs := [(45, .petroleumGas)],
  time := 5
}
| .battery => {
  name := some "battery",
  inputs := [(1, .ironPlate), (1, .copperPlate), (20, .sulfuricAcid)],
  outputs := [(1, .battery)],
  time := 4
}
| .batteryEquipment => {
  name := some "battery-equipment",
  inputs := [(10, .steelPlate), (5, .battery)],
  outputs := [(1, .batteryEquipment)],
  time := 10
}
| .batteryEquipmentRecycling => {
  name := some "battery-equipment-recycling",
  inputs := [(1, .batteryEquipment)],
  outputs := [(1, .battery), (2, .steelPlate)],
  time := 0.625
}
| .batteryMk2Equipment => {
  name := some "battery-mk2-equipment",
  inputs := [(15, .processingUnit), (5, .lowDensityStructure), (10, .batteryEquipment)],
  outputs := [(1, .batteryMk2Equipment)],
  time := 10
}
| .batteryMk2EquipmentRecycling => {
  name := some "battery-mk2-equipment-recycling",
  inputs := [(1, .batteryMk2Equipment)],
  outputs := [(2, .batteryEquipment), (3, .processingUnit), (1, .lowDensityStructure)],
  time := 0.625
}
| .batteryMk3Equipment => {
  name := some "battery-mk3-equipment",
  inputs := [(10, .supercapacitor), (5, .batteryMk2Equipment)],
  outputs := [(1, .batteryMk3Equipment)],
  time := 10
}
| .batteryMk3EquipmentRecycling => {
  name := some "battery-mk3-equipment-recycling",
  inputs := [(1, .batteryMk3Equipment)],
  outputs := [(1, .batteryMk2Equipment), (2, .supercapacitor)],
  time := 0.625
}
| .batteryRecycling => {
  name := some "battery-recycling",
  inputs := [(1, .battery)],
  outputs := [(0, .ironPlate), (0, .copperPlate)],
  time := 0.25
}
| .beacon => {
  name := some "beacon",
  inputs := [(10, .steelPlate), (10, .copperCable), (20, .electronicCircuit), (20, .advancedCircuit)],
  outputs := [(1, .beacon)],
  time := 15
}
| .beaconRecycling => {
  name := some "beacon-recycling",
  inputs := [(1, .beacon)],
  outputs := [(5, .electronicCircuit), (5, .advancedCircuit), (2, .steelPlate), (2, .copperCable)],
  time := 0.9375
}
| .beltImmunityEquipment => {
  name := some "belt-immunity-equipment",
  inputs := [(10, .steelPlate), (5, .advancedCircuit)],
  outputs := [(1, .beltImmunityEquipment)],
  time := 10
}
| .beltImmunityEquipmentRecycling => {
  name := some "belt-immunity-equipment-recycling",
  inputs := [(1, .beltImmunityEquipment)],
  outputs := [(1, .advancedCircuit), (2, .steelPlate)],
  time := 0.625
}
| .bigElectricPole => {
  name := some "big-electric-pole",
  inputs := [(5, .steelPlate), (8, .ironStick), (4, .copperCable)],
  outputs := [(1, .bigElectricPole)],
  time := 0.5
}
| .bigElectricPoleRecycling => {
  name := some "big-electric-pole-recycling",
  inputs := [(1, .bigElectricPole)],
  outputs := [(2, .ironStick), (1, .steelPlate), (1, .copperCable)],
  time := 0.03125
}
| .bigMiningDrill => {
  name := some "big-mining-drill",
  inputs := [(10, .advancedCircuit), (10, .electricEngineUnit), (20, .tungstenCarbide), (1, .electricMiningDrill), (200, .moltenIron)],
  outputs := [(1, .bigMiningDrill)],
  time := 30
}
| .bigMiningDrillRecycling => {
  name := some "big-mining-drill-recycling",
  inputs := [(1, .bigMiningDrill)],
  outputs := [(0, .electricMiningDrill), (5, .tungstenCarbide), (2, .electricEngineUnit), (2, .advancedCircuit)],
  time := 1.875
}
| .biochamber => {
  name := some "biochamber",
  inputs := [(20, .ironPlate), (5, .electronicCircuit), (5, .nutrients), (1, .pentapodEgg), (1, .landfill)],
  outputs := [(1, .biochamber)],
  time := 20
}
| .biochamberRecycling => {
  name := some "biochamber-recycling",
  inputs := [(1, .biochamber)],
  outputs := [(1, .nutrients), (0, .pentapodEgg), (5, .ironPlate), (1, .electronicCircuit), (0, .landfill)],
  time := 1.25
}
| .bioflux => {
  name := some "bioflux",
  inputs := [(15, .yumakoMash), (12, .jelly)],
  outputs := [(4, .bioflux)],
  time := 6
}
| .biofluxRecycling => {
  name := some "bioflux-recycling",
  inputs := [(1, .bioflux)],
  outputs := [(1, .bioflux)],
  time := 0.375
}
| .biolab => {
  name := some "biolab",
  inputs := [(3, .uranium235), (10, .biterEgg), (25, .refinedConcrete), (1, .lab), (2, .captureRobotRocket)],
  outputs := [(1, .biolab)],
  time := 10
}
| .biolabRecycling => {
  name := some "biolab-recycling",
  inputs := [(1, .biolab)],
  outputs := [(1, .biolab)],
  time := 0.625
}
| .biolubricant => {
  name := some "biolubricant",
  inputs := [(60, .jelly)],
  outputs := [(20, .lubricant)],
  time := 3
}
| .bioplastic => {
  name := some "bioplastic",
  inputs := [(1, .bioflux), (4, .yumakoMash)],
  outputs := [(3, .plasticBar)],
  time := 2
}
| .biosulfur => {
  name := some "biosulfur",
  inputs := [(5, .spoilage), (1, .bioflux)],
  outputs := [(2, .sulfur)],
  time := 2
}
| .biterEgg => {
  name := some "biter-egg",
  inputs := [],
  outputs := [(5, .biterEgg)],
  time := 10
}
| .biterEggRecycling => {
  name := some "biter-egg-recycling",
  inputs := [(1, .biterEgg)],
  outputs := [(1, .biterEgg)],
  time := 0.625
}
| .blueprintBookRecycling => {
  name := some "blueprint-book-recycling",
  inputs := [(1, .blueprintBook)],
  outputs := [(1, .blueprintBook)],
  time := 0.03125
}
| .blueprintRecycling => {
  name := some "blueprint-recycling",
  inputs := [(1, .blueprint)],
  outputs := [(1, .blueprint)],
  time := 0.03125
}
| .boiler => {
  name := some "boiler",
  inputs := [(4, .pipe), (1, .stoneFurnace)],
  outputs := [(1, .boiler)],
  time := 0.5
}
| .boilerRecycling => {
  name := some "boiler-recycling",
  inputs := [(1, .boiler)],
  outputs := [(0, .stoneFurnace), (1, .pipe)],
  time := 0.03125
}
| .bottomlessChestRecycling => {
  name := some "bottomless-chest-recycling",
  inputs := [(1, .bottomlessChest)],
  outputs := [(1, .bottomlessChest)],
  time := 0.03125
}
| .bufferChest => {
  name := some "buffer-chest",
  inputs := [(3, .electronicCircuit), (1, .advancedCircuit), (1, .steelChest)],
  outputs := [(1, .bufferChest)],
  time := 0.5
}
| .bufferChestRecycling => {
  name := some "buffer-chest-recycling",
  inputs := [(1, .bufferChest)],
  outputs := [(0, .steelChest), (0, .electronicCircuit), (0, .advancedCircuit)],
  time := 0.03125
}
| .bulkInserter => {
  name := some "bulk-inserter",
  inputs := [(15, .ironGearWheel), (15, .electronicCircuit), (1, .advancedCircuit), (1, .fastInserter)],
  outputs := [(1, .bulkInserter)],
  time := 0.5
}
| .bulkInserterRecycling => {
  name := some "bulk-inserter-recycling",
  inputs := [(1, .bulkInserter)],
  outputs := [(3, .ironGearWheel), (3, .electronicCircuit), (0, .advancedCircuit), (0, .fastInserter)],
  time := 0.03125
}
| .burnerGeneratorRecycling => {
  name := some "burner-generator-recycling",
  inputs := [(1, .burnerGenerator)],
  outputs := [(1, .burnerGenerator)],
  time := 0.03125
}
| .burnerInserter => {
  name := some "burner-inserter",
  inputs := [(1, .ironPlate), (1, .ironGearWheel)],
  outputs := [(1, .burnerInserter)],
  time := 0.5
}
| .burnerInserterRecycling => {
  name := some "burner-inserter-recycling",
  inputs := [(1, .burnerInserter)],
  outputs := [(0, .ironPlate), (0, .ironGearWheel)],
  time := 0.03125
}
| .burnerMiningDrill => {
  name := some "burner-mining-drill",
  inputs := [(3, .ironPlate), (3, .ironGearWheel), (1, .stoneFurnace)],
  outputs := [(1, .burnerMiningDrill)],
  time := 2
}
| .burnerMiningDrillRecycling => {
  name := some "burner-mining-drill-recycling",
  inputs := [(1, .burnerMiningDrill)],
  outputs := [(0, .ironGearWheel), (0, .stoneFurnace), (0, .ironPlate)],
  time := 0.125
}
| .burntSpoilage => {
  name := some "burnt-spoilage",
  inputs := [(6, .spoilage)],
  outputs := [(1, .carbon)],
  time := 12
}
| .calciteRecycling => {
  name := some "calcite-recycling",
  inputs := [(1, .calcite)],
  outputs := [(1, .calcite)],
  time := 0.03125
}
| .cannonShell => {
  name := some "cannon-shell",
  inputs := [(2, .steelPlate), (2, .plasticBar), (1, .explosives)],
  outputs := [(1, .cannonShell)],
  time := 8
}
| .cannonShellRecycling => {
  name := some "cannon-shell-recycling",
  inputs := [(1, .cannonShell)],
  outputs := [(0, .steelPlate), (0, .plasticBar), (0, .explosives)],
  time := 0.5
}
| .captiveBiterSpawner => {
  name := some "captive-biter-spawner",
  inputs := [(15, .uranium235), (10, .biterEgg), (1, .captureRobotRocket), (100, .fluoroketoneCold)],
  outputs := [(1, .captiveBiterSpawner)],
  time := 10
}
| .captiveBiterSpawnerRecycling => {
  name := some "captive-biter-spawner-recycling",
  inputs := [(1, .captiveBiterSpawner)],
  outputs := [(1, .captiveBiterSpawner)],
  time := 0.625
}
| .captureRobotRocket => {
  name := some "capture-robot-rocket",
  inputs := [(2, .steelPlate), (2, .processingUnit), (1, .flyingRobotFrame), (20, .bioflux)],
  outputs := [(1, .captureRobotRocket)],
  time := 10
}
| .captureRobotRocketRecycling => {
  name := some "capture-robot-rocket-recycling",
  inputs := [(1, .captureRobotRocket)],
  outputs := [(0, .flyingRobotFrame), (0, .steelPlate), (5, .bioflux), (0, .processingUnit)],
  time := 0.625
}
| .car => {
  name := some "car",
  inputs := [(20, .ironPlate), (5, .steelPlate), (8, .engineUnit)],
  outputs := [(1, .car)],
  time := 2
}
| .carRecycling => {
  name := some "car-recycling",
  inputs := [(1, .car)],
  outputs := [(2, .engineUnit), (5, .ironPlate), (1, .steelPlate)],
  time := 0.125
}
| .carbon => {
  name := some "carbon",
  inputs := [(2, .coal), (20, .sulfuricAcid)],
  outputs := [(1, .carbon)],
  time := 1
}
| .carbonFiber => {
  name := some "carbon-fiber",
  inputs := [(1, .carbon), (10, .yumakoMash)],
  outputs := [(1, .carbonFiber)],
  time := 5
}
| .carbonFiberRecycling => {
  name := some "carbon-fiber-recycling",
  inputs := [(1, .carbonFiber)],
  outputs := [(1, .carbonFiber)],
  time := 0.3125
}
| .carbonRecycling => {
  name := some "carbon-recycling",
  inputs := [(1, .carbon)],
  outputs := [(1, .carbon)],
  time := 0.0625
}
| .carbonicAsteroidChunkRecycling => {
  name := some "carbonic-asteroid-chunk-recycling",
  inputs := [(1, .carbonicAsteroidChunk)],
  outputs := [(1, .carbonicAsteroidChunk)],
  time := 0.03125
}
| .carbonicAsteroidCrushing => {
  name := some "carbonic-asteroid-crushing",
  inputs := [(1, .carbonicAsteroidChunk)],
  outputs := [(10, .carbon), (1, .carbonicAsteroidChunk)],
  time := 2
}
| .carbonicAsteroidReprocessing => {
  name := some "carbonic-asteroid-reprocessing",
  inputs := [(1, .carbonicAsteroidChunk)],
  outputs := [(1, .carbonicAsteroidChunk), (1, .metallicAsteroidChunk), (1, .oxideAsteroidChunk)],
  time := 2
}
| .cargoBay => {
  name := some "cargo-bay",
  inputs := [(20, .steelPlate), (5, .processingUnit), (20, .lowDensityStructure)],
  outputs := [(1, .cargoBay)],
  time := 10
}
| .cargoBayRecycling => {
  name := some "cargo-bay-recycling",
  inputs := [(1, .cargoBay)],
  outputs := [(5, .steelPlate), (5, .lowDensityStructure), (1, .processingUnit)],
  time := 0.625
}
| .cargoLandingPad => {
  name := some "cargo-landing-pad",
  inputs := [(25, .steelPlate), (10, .processingUnit), (200, .concrete)],
  outputs := [(1, .cargoLandingPad)],
  time := 30
}
| .cargoLandingPadRecycling => {
  name := some "cargo-landing-pad-recycling",
  inputs := [(1, .cargoLandingPad)],
  outputs := [(50, .concrete), (6, .steelPlate), (2, .processingUnit)],
  time := 1.875
}
| .cargoWagon => {
  name := some "cargo-wagon",
  inputs := [(20, .ironPlate), (20, .steelPlate), (10, .ironGearWheel)],
  outputs := [(1, .cargoWagon)],
  time := 1
}
| .cargoWagonRecycling => {
  name := some "cargo-wagon-recycling",
  inputs := [(1, .cargoWagon)],
  outputs := [(2, .ironGearWheel), (5, .ironPlate), (5, .steelPlate)],
  time := 0.0625
}
| .castingCopper => {
  name := some "casting-copper",
  inputs := [(20, .moltenCopper)],
  outputs := [(2, .copperPlate)],
  time := 3.2
}
| .castingCopperCable => {
  name := some "casting-copper-cable",
  inputs := [(5, .moltenCopper)],
  outputs := [(2, .copperCable)],
  time := 1
}
| .castingIron => {
  name := some "casting-iron",
  inputs := [(20, .moltenIron)],
  outputs := [(2, .ironPlate)],
  time := 3.2
}
| .castingIronGearWheel => {
  name := some "casting-iron-gear-wheel",
  inputs := [(10, .moltenIron)],
  outputs := [(1, .ironGearWheel)],
  time := 1
}
| .castingIronStick => {
  name := some "casting-iron-stick",
  inputs := [(20, .moltenIron)],
  outputs := [(4, .ironStick)],
  time := 1
}
| .castingLowDensityStructure => {
  name := some "casting-low-density-structure",
  inputs := [(5, .plasticBar), (80, .moltenIron), (250, .moltenCopper)],
  outputs := [(1, .lowDensityStructure)],
  time := 15
}
| .castingPipe => {
  name := some "casting-pipe",
  inputs := [(10, .moltenIron)],
  outputs := [(1, .pipe)],
  time := 1
}
| .castingPipeToGround => {
  name := some "casting-pipe-to-ground",
  inputs := [(10, .pipe), (50, .moltenIron)],
  outputs := [(2, .pipeToGround)],
  time := 1
}
| .castingSteel => {
  name := some "casting-steel",
  inputs := [(30, .moltenIron)],
  outputs := [(1, .steelPlate)],
  time := 3.2
}
| .centrifuge => {
  name := some "centrifuge",
  inputs := [(50, .steelPlate), (100, .ironGearWheel), (100, .advancedCircuit), (100, .concrete)],
  outputs := [(1, .centrifuge)],
  time := 4
}
| .centrifugeRecycling => {
  name := some "centrifuge-recycling",
  inputs := [(1, .centrifuge)],
  outputs := [(25, .concrete), (12, .steelPlate), (25, .advancedCircuit), (25, .ironGearWheel)],
  time := 0.25
}
| .chemicalPlant => {
  name := some "chemical-plant",
  inputs := [(5, .steelPlate), (5, .ironGearWheel), (5, .electronicCircuit), (5, .pipe)],
  outputs := [(1, .chemicalPlant)],
  time := 5
}
| .chemicalPlantRecycling => {
  name := some "chemical-plant-recycling",
  inputs := [(1, .chemicalPlant)],
  outputs := [(1, .steelPlate), (1, .ironGearWheel), (1, .electronicCircuit), (1, .pipe)],
  time := 0.3125
}
| .chemicalSciencePack => {
  name := some "chemical-science-pack",
  inputs := [(1, .sulfur), (3, .advancedCircuit), (2, .engineUnit)],
  outputs := [(2, .chemicalSciencePack)],
  time := 24
}
| .chemicalSciencePackRecycling => {
  name := some "chemical-science-pack-recycling",
  inputs := [(1, .chemicalSciencePack)],
  outputs := [(1, .chemicalSciencePack)],
  time := 1.5
}
| .cliffExplosives => {
  name := some "cliff-explosives",
  inputs := [(10, .explosives), (1, .barrel), (10, .calcite), (1, .grenade)],
  outputs := [(1, .cliffExplosives)],
  time := 8
}
| .cliffExplosivesRecycling => {
  name := some "cliff-explosives-recycling",
  inputs := [(1, .cliffExplosives)],
  outputs := [(2, .explosives), (2, .calcite), (0, .grenade), (0, .barrel)],
  time := 0.5
}
| .clusterGrenade => {
  name := some "cluster-grenade",
  inputs := [(5, .steelPlate), (5, .explosives), (7, .grenade)],
  outputs := [(1, .clusterGrenade)],
  time := 8
}
| .clusterGrenadeRecycling => {
  name := some "cluster-grenade-recycling",
  inputs := [(1, .clusterGrenade)],
  outputs := [(1, .grenade), (1, .explosives), (1, .steelPlate)],
  time := 0.5
}
| .coalLiquefaction => {
  name := some "coal-liquefaction",
  inputs := [(10, .coal), (25, .heavyOil), (50, .steam)],
  outputs := [(90, .heavyOil), (20, .lightOil), (10, .petroleumGas)],
  time := 5
}
| .coalRecycling => {
  name := some "coal-recycling",
  inputs := [(1, .coal)],
  outputs := [(1, .coal)],
  time := 0.03125
}
| .coalSynthesis => {
  name := some "coal-synthesis",
  inputs := [(1, .sulfur), (5, .carbon), (10, .water)],
  outputs := [(1, .coal)],
  time := 2
}
| .coinRecycling => {
  name := some "coin-recycling",
  inputs := [(1, .coin)],
  outputs := [(1, .coin)],
  time := 0.03125
}
| .combatShotgun => {
  name := some "combat-shotgun",
  inputs := [(10, .wood), (10, .copperPlate), (15, .steelPlate), (5, .ironGearWheel)],
  outputs := [(1, .combatShotgun)],
  time := 10
}
| .combatShotgunRecycling => {
  name := some "combat-shotgun-recycling",
  inputs := [(1, .combatShotgun)],
  outputs := [(3, .steelPlate), (1, .ironGearWheel), (2, .copperPlate), (2, .wood)],
  time := 0.625
}
| .concrete => {
  name := some "concrete",
  inputs := [(1, .ironOre), (5, .stoneBrick), (100, .water)],
  outputs := [(10, .concrete)],
  time := 10
}
| .concreteFromMoltenIron => {
  name := some "concrete-from-molten-iron",
  inputs := [(5, .stoneBrick), (20, .moltenIron), (100, .water)],
  outputs := [(10, .concrete)],
  time := 10
}
| .concreteRecycling => {
  name := some "concrete-recycling",
  inputs := [(1, .concrete)],
  outputs := [(0, .stoneBrick), (0, .ironOre)],
  time := 0.625
}
| .constantCombinator => {
  name := some "constant-combinator",
  inputs := [(5, .copperCable), (2, .electronicCircuit)],
  outputs := [(1, .constantCombinator)],
  time := 0.5
}
| .constantCombinatorRecycling => {
  name := some "constant-combinator-recycling",
  inputs := [(1, .constantCombinator)],
  outputs := [(1, .copperCable), (0, .electronicCircuit)],
  time := 0.03125
}
| .constructionRobot => {
  name := some "construction-robot",
  inputs := [(2, .electronicCircuit), (1, .flyingRobotFrame)],
  outputs := [(1, .constructionRobot)],
  time := 0.5
}
| .constructionRobotRecycling => {
  name := some "construction-robot-recycling",
  inputs := [(1, .constructionRobot)],
  outputs := [(0, .flyingRobotFrame), (0, .electronicCircuit)],
  time := 0.03125
}
| .copperBacteria => {
  name := some "copper-bacteria",
  inputs := [(3, .yumakoMash)],
  outputs := [(1, .copperBacteria), (1, .spoilage)],
  time := 1
}
| .copperBacteriaCultivation => {
  name := some "copper-bacteria-cultivation",
  inputs := [(1, .copperBacteria), (1, .bioflux)],
  outputs := [(4, .copperBacteria)],
  time := 4
}
| .copperBacteriaRecycling => {
  name := some "copper-bacteria-recycling",
  inputs := [(1, .copperBacteria)],
  outputs := [(1, .copperBacteria)],
  time := 0.0625
}
| .copperCable => {
  name := some "copper-cable",
  inputs := [(1, .copperPlate)],
  outputs := [(2, .copperCable)],
  time := 0.5
}
| .copperCableRecycling => {
  name := some "copper-cable-recycling",
  inputs := [(1, .copperCable)],
  outputs := [(0, .copperPlate)],
  time := 0.03125
}
| .copperOreRecycling => {
  name := some "copper-ore-recycling",
  inputs := [(1, .copperOre)],
  outputs := [(1, .copperOre)],
  time := 0.03125
}
| .copperPlate => {
  name := some "copper-plate",
  inputs := [(1, .copperOre)],
  outputs := [(1, .copperPlate)],
  time := 3.2
}
| .copperPlateRecycling => {
  name := some "copper-plate-recycling",
  inputs := [(1, .copperPlate)],
  outputs := [(1, .copperPlate)],
  time := 0.2
}
| .crudeOilBarrel => {
  name := some "crude-oil-barrel",
  inputs := [(1, .barrel), (50, .crudeOil)],
  outputs := [(1, .crudeOilBarrel)],
  time := 0.2
}
| .crudeOilBarrelRecycling => {
  name := some "crude-oil-barrel-recycling",
  inputs := [(1, .crudeOilBarrel)],
  outputs := [(0, .barrel)],
  time := 0.0125
}
| .crusher => {
  name := some "crusher",
  inputs := [(10, .steelPlate), (10, .electricEngineUnit), (20, .lowDensityStructure)],
  outputs := [(1, .crusher)],
  time := 10
}
| .crusherRecycling => {
  name := some "crusher-recycling",
  inputs := [(1, .crusher)],
  outputs := [(5, .lowDensityStructure), (2, .steelPlate), (2, .electricEngineUnit)],
  time := 0.625
}
| .cryogenicPlant => {
  name := some "cryogenic-plant",
  inputs := [(20, .processingUnit), (20, .superconductor), (20, .lithiumPlate), (40, .refinedConcrete)],
  outputs := [(1, .cryogenicPlant)],
  time := 10
}
| .cryogenicPlantRecycling => {
  name := some "cryogenic-plant-recycling",
  inputs := [(1, .cryogenicPlant)],
  outputs := [(10, .refinedConcrete), (5, .superconductor), (5, .processingUnit), (5, .lithiumPlate)],
  time := 0.625
}
| .cryogenicSciencePack => {
  name := some "cryogenic-science-pack",
  inputs := [(3, .ice), (1, .lithiumPlate), (6, .fluoroketoneCold)],
  outputs := [(1, .cryogenicSciencePack), (3, .fluoroketoneHot)],
  time := 20
}
| .cryogenicSciencePackRecycling => {
  name := some "cryogenic-science-pack-recycling",
  inputs := [(1, .cryogenicSciencePack)],
  outputs := [(1, .cryogenicSciencePack)],
  time := 1.25
}
| .deciderCombinator => {
  name := some "decider-combinator",
  inputs := [(5, .copperCable), (5, .electronicCircuit)],
  outputs := [(1, .deciderCombinator)],
  time := 0.5
}
| .deciderCombinatorRecycling => {
  name := some "decider-combinator-recycling",
  inputs := [(1, .deciderCombinator)],
  outputs := [(1, .copperCable), (1, .electronicCircuit)],
  time := 0.03125
}
| .deconstructionPlannerRecycling => {
  name := some "deconstruction-planner-recycling",
  inputs := [(1, .deconstructionPlanner)],
  outputs := [(1, .deconstructionPlanner)],
  time := 0.03125
}
| .defenderCapsule => {
  name := some "defender-capsule",
  inputs := [(3, .ironGearWheel), (3, .electronicCircuit), (3, .piercingRoundsMagazine)],
  outputs := [(1, .defenderCapsule)],
  time := 8
}
| .defenderCapsuleRecycling => {
  name := some "defender-capsule-recycling",
  inputs := [(1, .defenderCapsule)],
  outputs := [(0, .piercingRoundsMagazine), (0, .electronicCircuit), (0, .ironGearWheel)],
  time := 0.5
}
| .depletedUraniumFuelCellRecycling => {
  name := some "depleted-uranium-fuel-cell-recycling",
  inputs := [(1, .depletedUraniumFuelCell)],
  outputs := [(1, .depletedUraniumFuelCell)],
  time := 0.03125
}
| .destroyerCapsule => {
  name := some "destroyer-capsule",
  inputs := [(4, .steelPlate), (1, .processingUnit), (4, .distractorCapsule)],
  outputs := [(1, .destroyerCapsule)],
  time := 15
}
| .destroyerCapsuleRecycling => {
  name := some "destroyer-capsule-recycling",
  inputs := [(1, .destroyerCapsule)],
  outputs := [(1, .distractorCapsule), (1, .steelPlate), (0, .processingUnit)],
  time := 0.9375
}
| .dischargeDefenseEquipment => {
  name := some "discharge-defense-equipment",
  inputs := [(20, .steelPlate), (5, .processingUnit), (10, .laserTurret)],
  outputs := [(1, .dischargeDefenseEquipment)],
  time := 10
}
| .dischargeDefenseEquipmentRecycling => {
  name := some "discharge-defense-equipment-recycling",
  inputs := [(1, .dischargeDefenseEquipment)],
  outputs := [(1, .processingUnit), (5, .steelPlate), (2, .laserTurret)],
  time := 0.625
}
| .displayPanel => {
  name := some "display-panel",
  inputs := [(1, .ironPlate), (1, .electronicCircuit)],
  outputs := [(1, .displayPanel)],
  time := 0.5
}
| .displayPanelRecycling => {
  name := some "display-panel-recycling",
  inputs := [(1, .displayPanel)],
  outputs := [(0, .ironPlate), (0, .electronicCircuit)],
  time := 0.03125
}
| .distractorCapsule => {
  name := some "distractor-capsule",
  inputs := [(3, .advancedCircuit), (4, .defenderCapsule)],
  outputs := [(1, .distractorCapsule)],
  time := 15
}
| .distractorCapsuleRecycling => {
  name := some "distractor-capsule-recycling",
  inputs := [(1, .distractorCapsule)],
  outputs := [(1, .defenderCapsule), (0, .advancedCircuit)],
  time := 0.9375
}
| .efficiencyModule => {
  name := some "efficiency-module",
  inputs := [(5, .electronicCircuit), (5, .advancedCircuit)],
  outputs := [(1, .efficiencyModule)],
  time := 15
}
| .efficiencyModule2 => {
  name := some "efficiency-module-2",
  inputs := [(5, .advancedCircuit), (5, .processingUnit), (4, .efficiencyModule)],
  outputs := [(1, .efficiencyModule2)],
  time := 30
}
| .efficiencyModule2Recycling => {
  name := some "efficiency-module-2-recycling",
  inputs := [(1, .efficiencyModule2)],
  outputs := [(1, .efficiencyModule), (1, .advancedCircuit), (1, .processingUnit)],
  time := 1.875
}
| .efficiencyModule3 => {
  name := some "efficiency-module-3",
  inputs := [(5, .advancedCircuit), (5, .processingUnit), (5, .spoilage), (4, .efficiencyModule2)],
  outputs := [(1, .efficiencyModule3)],
  time := 60
}
| .efficiencyModule3Recycling => {
  name := some "efficiency-module-3-recycling",
  inputs := [(1, .efficiencyModule3)],
  outputs := [(1, .efficiencyModule2), (1, .advancedCircuit), (1, .processingUnit), (1, .spoilage)],
  time := 3.75
}
| .efficiencyModuleRecycling => {
  name := some "efficiency-module-recycling",
  inputs := [(1, .efficiencyModule)],
  outputs := [(1, .advancedCircuit), (1, .electronicCircuit)],
  time := 0.9375
}
| .electricEnergyInterfaceRecycling => {
  name := some "electric-energy-interface-recycling",
  inputs := [(1, .electricEnergyInterface)],
  outputs := [(1, .electricEnergyInterface)],
  time := 0.03125
}
| .electricEngineUnit => {
  name := some "electric-engine-unit",
  inputs := [(2, .electronicCircuit), (1, .engineUnit), (15, .lubricant)],
  outputs := [(1, .electricEngineUnit)],
  time := 10
}
| .electricEngineUnitRecycling => {
  name := some "electric-engine-unit-recycling",
  inputs := [(1, .electricEngineUnit)],
  outputs := [(0, .engineUnit), (0, .electronicCircuit)],
  time := 0.625
}
| .electricFurnace => {
  name := some "electric-furnace",
  inputs := [(10, .steelPlate), (5, .advancedCircuit), (10, .stoneBrick)],
  outputs := [(1, .electricFurnace)],
  time := 5
}
| .electricFurnaceRecycling => {
  name := some "electric-furnace-recycling",
  inputs := [(1, .electricFurnace)],
  outputs := [(2, .steelPlate), (1, .advancedCircuit), (2, .stoneBrick)],
  time := 0.3125
}
| .electricMiningDrill => {
  name := some "electric-mining-drill",
  inputs := [(10, .ironPlate), (5, .ironGearWheel), (3, .electronicCircuit)],
  outputs := [(1, .electricMiningDrill)],
  time := 2
}
| .electricMiningDrillRecycling => {
  name := some "electric-mining-drill-recycling",
  inputs := [(1, .electricMiningDrill)],
  outputs := [(0, .electronicCircuit), (1, .ironGearWheel), (2, .ironPlate)],
  time := 0.125
}
| .electrolyte => {
  name := some "electrolyte",
  inputs := [(1, .stone), (10, .heavyOil), (10, .holmiumSolution)],
  outputs := [(10, .electrolyte)],
  time := 5
}
| .electromagneticPlant => {
  name := some "electromagnetic-plant",
  inputs := [(50, .steelPlate), (50, .processingUnit), (150, .holmiumPlate), (50, .refinedConcrete)],
  outputs := [(1, .electromagneticPlant)],
  time := 10
}
| .electromagneticPlantRecycling => {
  name := some "electromagnetic-plant-recycling",
  inputs := [(1, .electromagneticPlant)],
  outputs := [(37, .holmiumPlate), (12, .steelPlate), (12, .processingUnit), (12, .refinedConcrete)],
  time := 0.625
}
| .electromagneticSciencePack => {
  name := some "electromagnetic-science-pack",
  inputs := [(1, .supercapacitor), (1, .accumulator), (25, .electrolyte), (25, .holmiumSolution)],
  outputs := [(1, .electromagneticSciencePack)],
  time := 10
}
| .electromagneticSciencePackRecycling => {
  name := some "electromagnetic-science-pack-recycling",
  inputs := [(1, .electromagneticSciencePack)],
  outputs := [(1, .electromagneticSciencePack)],
  time := 0.625
}
| .electronicCircuit => {
  name := some "electronic-circuit",
  inputs := [(1, .ironPlate), (3, .copperCable)],
  outputs := [(1, .electronicCircuit)],
  time := 0.5
}
| .electronicCircuitRecycling => {
  name := some "electronic-circuit-recycling",
  inputs := [(1, .electronicCircuit)],
  outputs := [(0, .ironPlate), (0, .copperCable)],
  time := 0.03125
}
| .emptyCrudeOilBarrel => {
  name := some "empty-crude-oil-barrel",
  inputs := [(1, .crudeOilBarrel)],
  outputs := [(1, .barrel), (50, .crudeOil)],
  time := 0.2
}
| .emptyFluoroketoneColdBarrel => {
  name := some "empty-fluoroketone-cold-barrel",
  inputs := [(1, .fluoroketoneColdBarrel)],
  outputs := [(1, .barrel), (50, .fluoroketoneCold)],
  time := 0.2
}
| .emptyFluoroketoneHotBarrel => {
  name := some "empty-fluoroketone-hot-barrel",
  inputs := [(1, .fluoroketoneHotBarrel)],
  outputs := [(1, .barrel), (50, .fluoroketoneHot)],
  time := 0.2
}
| .emptyHeavyOilBarrel => {
  name := some "empty-heavy-oil-barrel",
  inputs := [(1, .heavyOilBarrel)],
  outputs := [(1, .barrel), (50, .heavyOil)],
  time := 0.2
}
| .emptyLightOilBarrel => {
  name := some "empty-light-oil-barrel",
  inputs := [(1, .lightOilBarrel)],
  outputs := [(1, .barrel), (50, .lightOil)],
  time := 0.2
}
| .emptyLubricantBarrel => {
  name := some "empty-lubricant-barrel",
  inputs := [(1, .lubricantBarrel)],
  outputs := [(1, .barrel), (50, .lubricant)],
  time := 0.2
}
| .emptyModuleSlotRecycling => {
  name := some "empty-module-slot-recycling",
  inputs := [(1, .emptyModuleSlot)],
  outputs := [(1, .emptyModuleSlot)],
  time := 0.03125
}
| .emptyPetroleumGasBarrel => {
  name := some "empty-petroleum-gas-barrel",
  inputs := [(1, .petroleumGasBarrel)],
  outputs := [(1, .barrel), (50, .petroleumGas)],
  time := 0.2
}
| .emptySulfuricAcidBarrel => {
  name := some "empty-sulfuric-acid-barrel",
  inputs := [(1, .sulfuricAcidBarrel)],
  outputs := [(1, .barrel), (50, .sulfuricAcid)],
  time := 0.2
}
| .emptyWaterBarrel => {
  name := some "empty-water-barrel",
  inputs := [(1, .waterBarrel)],
  outputs := [(1, .barrel), (50, .water)],
  time := 0.2
}
| .energyShieldEquipment => {
  name := some "energy-shield-equipment",
  inputs := [(10, .steelPlate), (5, .advancedCircuit)],
  outputs := [(1, .energyShieldEquipment)],
  time := 10
}
| .energyShieldEquipmentRecycling => {
  name := some "energy-shield-equipment-recycling",
  inputs := [(1, .energyShieldEquipment)],
  outputs := [(1, .advancedCircuit), (2, .steelPlate)],
  time := 0.625
}
| .energyShieldMk2Equipment => {
  name := some "energy-shield-mk2-equipment",
  inputs := [(5, .processingUnit), (5, .lowDensityStructure), (10, .energyShieldEquipment)],
  outputs := [(1, .energyShieldMk2Equipment)],
  time := 10
}
| .energyShieldMk2EquipmentRecycling => {
  name := some "energy-shield-mk2-equipment-recycling",
  inputs := [(1, .energyShieldMk2Equipment)],
  outputs := [(2, .energyShieldEquipment), (1, .processingUnit), (1, .lowDensityStructure)],
  time := 0.625
}
| .engineUnit => {
  name := some "engine-unit",
  inputs := [(1, .steelPlate), (1, .ironGearWheel), (2, .pipe)],
  outputs := [(1, .engineUnit)],
  time := 10
}
| .engineUnitRecycling => {
  name := some "engine-unit-recycling",
  inputs := [(1, .engineUnit)],
  outputs := [(0, .steelPlate), (0, .ironGearWheel), (0, .pipe)],
  time := 0.625
}
| .exoskeletonEquipment => {
  name := some "exoskeleton-equipment",
  inputs := [(20, .steelPlate), (10, .processingUnit), (30, .electricEngineUnit)],
  outputs := [(1, .exoskeletonEquipment)],
  time := 10
}
| .exoskeletonEquipmentRecycling => {
  name := some "exoskeleton-equipment-recycling",
  inputs := [(1, .exoskeletonEquipment)],
  outputs := [(2, .processingUnit), (7, .electricEngineUnit), (5, .steelPlate)],
  time := 0.625
}
| .explosiveCannonShell => {
  name := some "explosive-cannon-shell",
  inputs := [(2, .steelPlate), (2, .plasticBar), (2, .explosives)],
  outputs := [(1, .explosiveCannonShell)],
  time := 8
}
| .explosiveCannonShellRecycling => {
  name := some "explosive-cannon-shell-recycling",
  inputs := [(1, .explosiveCannonShell)],
  outputs := [(0, .steelPlate), (0, .plasticBar), (0, .explosives)],
  time := 0.5
}
| .explosiveRocket => {
  name := some "explosive-rocket",
  inputs := [(2, .explosives), (1, .rocket)],
  outputs := [(1, .explosiveRocket)],
  time := 8
}
| .explosiveRocketRecycling => {
  name := some "explosive-rocket-recycling",
  inputs := [(1, .explosiveRocket)],
  outputs := [(0, .rocket), (0, .explosives)],
  time := 0.5
}
| .explosiveUraniumCannonShell => {
  name := some "explosive-uranium-cannon-shell",
  inputs := [(1, .uranium238), (1, .explosiveCannonShell)],
  outputs := [(1, .explosiveUraniumCannonShell)],
  time := 12
}
| .explosiveUraniumCannonShellRecycling => {
  name := some "explosive-uranium-cannon-shell-recycling",
  inputs := [(1, .explosiveUraniumCannonShell)],
  outputs := [(0, .explosiveCannonShell), (0, .uranium238)],
  time := 0.75
}
| .explosives => {
  name := some "explosives",
  inputs := [(1, .coal), (1, .sulfur), (10, .water)],
  outputs := [(2, .explosives)],
  time := 4
}
| .explosivesRecycling => {
  name := some "explosives-recycling",
  inputs := [(1, .explosives)],
  outputs := [(1, .explosives)],
  time := 0.25
}
| .expressLoader => {
  name := some "express-loader",
  inputs := [(5, .expressTransportBelt), (1, .fastLoader)],
  outputs := [(1, .expressLoader)],
  time := 10
}
| .expressLoaderRecycling => {
  name := some "express-loader-recycling",
  inputs := [(1, .expressLoader)],
  outputs := [(1, .expressTransportBelt), (0, .fastLoader)],
  time := 0.625
}
| .expressSplitter => {
  name := some "express-splitter",
  inputs := [(10, .ironGearWheel), (10, .advancedCircuit), (1, .fastSplitter), (80, .lubricant)],
  outputs := [(1, .expressSplitter)],
  time := 2
}
| .expressSplitterRecycling => {
  name := some "express-splitter-recycling",
  inputs := [(1, .expressSplitter)],
  outputs := [(0, .fastSplitter), (2, .ironGearWheel), (2, .advancedCircuit)],
  time := 0.125
}
| .expressTransportBelt => {
  name := some "express-transport-belt",
  inputs := [(10, .ironGearWheel), (1, .fastTransportBelt), (20, .lubricant)],
  outputs := [(1, .expressTransportBelt)],
  time := 0.5
}
| .expressTransportBeltRecycling => {
  name := some "express-transport-belt-recycling",
  inputs := [(1, .expressTransportBelt)],
  outputs := [(2, .ironGearWheel), (0, .fastTransportBelt)],
  time := 0.03125
}
| .expressUndergroundBelt => {
  name := some "express-underground-belt",
  inputs := [(80, .ironGearWheel), (2, .fastUndergroundBelt), (40, .lubricant)],
  outputs := [(2, .expressUndergroundBelt)],
  time := 2
}
| .expressUndergroundBeltRecycling => {
  name := some "express-underground-belt-recycling",
  inputs := [(1, .expressUndergroundBelt)],
  outputs := [(10, .ironGearWheel), (0, .fastUndergroundBelt)],
  time := 0.125
}
| .fastInserter => {
  name := some "fast-inserter",
  inputs := [(2, .ironPlate), (2, .electronicCircuit), (1, .inserter)],
  outputs := [(1, .fastInserter)],
  time := 0.5
}
| .fastInserterRecycling => {
  name := some "fast-inserter-recycling",
  inputs := [(1, .fastInserter)],
  outputs := [(0, .electronicCircuit), (0, .ironPlate), (0, .inserter)],
  time := 0.03125
}
| .fastLoader => {
  name := some "fast-loader",
  inputs := [(5, .fastTransportBelt), (1, .loader)],
  outputs := [(1, .fastLoader)],
  time := 3
}
| .fastLoaderRecycling => {
  name := some "fast-loader-recycling",
  inputs := [(1, .fastLoader)],
  outputs := [(1, .fastTransportBelt), (0, .loader)],
  time := 0.1875
}
| .fastSplitter => {
  name := some "fast-splitter",
  inputs := [(10, .ironGearWheel), (10, .electronicCircuit), (1, .splitter)],
  outputs := [(1, .fastSplitter)],
  time := 2
}
| .fastSplitterRecycling => {
  name := some "fast-splitter-recycling",
  inputs := [(1, .fastSplitter)],
  outputs := [(0, .splitter), (2, .ironGearWheel), (2, .electronicCircuit)],
  time := 0.125
}
| .fastTransportBelt => {
  name := some "fast-transport-belt",
  inputs := [(5, .ironGearWheel), (1, .transportBelt)],
  outputs := [(1, .fastTransportBelt)],
  time := 0.5
}
| .fastTransportBeltRecycling => {
  name := some "fast-transport-belt-recycling",
  inputs := [(1, .fastTransportBelt)],
  outputs := [(1, .ironGearWheel), (0, .transportBelt)],
  time := 0.03125
}
| .fastUndergroundBelt => {
  name := some "fast-underground-belt",
  inputs := [(40, .ironGearWheel), (2, .undergroundBelt)],
  outputs := [(2, .fastUndergroundBelt)],
  time := 2
}
| .fastUndergroundBeltRecycling => {
  name := some "fast-underground-belt-recycling",
  inputs := [(1, .fastUndergroundBelt)],
  outputs := [(5, .ironGearWheel), (0, .undergroundBelt)],
  time := 0.125
}
| .firearmMagazine => {
  name := some "firearm-magazine",
  inputs := [(4, .ironPlate)],
  outputs := [(1, .firearmMagazine)],
  time := 1
}
| .firearmMagazineRecycling => {
  name := some "firearm-magazine-recycling",
  inputs := [(1, .firearmMagazine)],
  outputs := [(1, .ironPlate)],
  time := 0.0625
}
| .fishBreeding => {
  name := some "fish-breeding",
  inputs := [(2, .rawFish), (100, .nutrients), (100, .water)],
  outputs := [(3, .rawFish)],
  time := 6
}
| .fissionReactorEquipment => {
  name := some "fission-reactor-equipment",
  inputs := [(200, .processingUnit), (50, .lowDensityStructure), (4, .uraniumFuelCell)],
  outputs := [(1, .fissionReactorEquipment)],
  time := 10
}
| .fissionReactorEquipmentRecycling => {
  name := some "fission-reactor-equipment-recycling",
  inputs := [(1, .fissionReactorEquipment)],
  outputs := [(50, .processingUnit), (12, .lowDensityStructure), (1, .uraniumFuelCell)],
  time := 0.625
}
| .flamethrower => {
  name := some "flamethrower",
  inputs := [(5, .steelPlate), (10, .ironGearWheel)],
  outputs := [(1, .flamethrower)],
  time := 10
}
| .flamethrowerAmmo => {
  name := some "flamethrower-ammo",
  inputs := [(5, .steelPlate), (100, .crudeOil)],
  outputs := [(1, .flamethrowerAmmo)],
  time := 6
}
| .flamethrowerAmmoRecycling => {
  name := some "flamethrower-ammo-recycling",
  inputs := [(1, .flamethrowerAmmo)],
  outputs := [(1, .flamethrowerAmmo)],
  time := 0.375
}
| .flamethrowerRecycling => {
  name := some "flamethrower-recycling",
  inputs := [(1, .flamethrower)],
  outputs := [(1, .steelPlate), (2, .ironGearWheel)],
  time := 0.625
}
| .flamethrowerTurret => {
  name := some "flamethrower-turret",
  inputs := [(30, .steelPlate), (15, .ironGearWheel), (5, .engineUnit), (10, .pipe)],
  outputs := [(1, .flamethrowerTurret)],
  time := 20
}
| .flamethrowerTurretRecycling => {
  name := some "flamethrower-turret-recycling",
  inputs := [(1, .flamethrowerTurret)],
  outputs := [(7, .steelPlate), (3, .ironGearWheel), (2, .pipe), (1, .engineUnit)],
  time := 1.25
}
| .fluidWagon => {
  name := some "fluid-wagon",
  inputs := [(16, .steelPlate), (10, .ironGearWheel), (1, .storageTank), (8, .pipe)],
  outputs := [(1, .fluidWagon)],
  time := 1.5
}
| .fluidWagonRecycling => {
  name := some "fluid-wagon-recycling",
  inputs := [(1, .fluidWagon)],
  outputs := [(2, .ironGearWheel), (4, .steelPlate), (2, .pipe), (0, .storageTank)],
  time := 0.09375
}
| .fluoroketone => {
  name := some "fluoroketone",
  inputs := [(1, .solidFuel), (1, .lithium), (50, .fluorine), (50, .ammonia)],
  outputs := [(50, .fluoroketoneHot)],
  time := 10
}
| .fluoroketoneColdBarrel => {
  name := some "fluoroketone-cold-barrel",
  inputs := [(1, .barrel), (50, .fluoroketoneCold)],
  outputs := [(1, .fluoroketoneColdBarrel)],
  time := 0.2
}
| .fluoroketoneColdBarrelRecycling => {
  name := some "fluoroketone-cold-barrel-recycling",
  inputs := [(1, .fluoroketoneColdBarrel)],
  outputs := [(0, .barrel)],
  time := 0.0125
}
| .fluoroketoneCooling => {
  name := some "fluoroketone-cooling",
  inputs := [(10, .fluoroketoneHot)],
  outputs := [(10, .fluoroketoneCold)],
  time := 5
}
| .fluoroketoneHotBarrel => {
  name := some "fluoroketone-hot-barrel",
  inputs := [(1, .barrel), (50, .fluoroketoneHot)],
  outputs := [(1, .fluoroketoneHotBarrel)],
  time := 0.2
}
| .fluoroketoneHotBarrelRecycling => {
  name := some "fluoroketone-hot-barrel-recycling",
  inputs := [(1, .fluoroketoneHotBarrel)],
  outputs := [(0, .barrel)],
  time := 0.0125
}
| .flyingRobotFrame => {
  name := some "flying-robot-frame",
  inputs := [(1, .steelPlate), (2, .battery), (3, .electronicCircuit), (1, .electricEngineUnit)],
  outputs := [(1, .flyingRobotFrame)],
  time := 20
}
| .flyingRobotFrameRecycling => {
  name := some "flying-robot-frame-recycling",
  inputs := [(1, .flyingRobotFrame)],
  outputs := [(0, .electricEngineUnit), (0, .battery), (0, .steelPlate), (0, .electronicCircuit)],
  time := 1.25
}
| .foundation => {
  name := some "foundation",
  inputs := [(20, .stone), (4, .tungstenPlate), (4, .carbonFiber), (4, .lithiumPlate), (20, .fluoroketoneCold)],
  outputs := [(1, .foundation)],
  time := 30
}
| .foundationRecycling => {
  name := some "foundation-recycling",
  inputs := [(1, .foundation)],
  outputs := [(1, .tungstenPlate), (1, .lithiumPlate), (1, .carbonFiber), (5, .stone)],
  time := 1.875
}
| .foundry => {
  name := some "foundry",
  inputs := [(50, .steelPlate), (30, .electronicCircuit), (50, .tungstenCarbide), (20, .refinedConcrete), (20, .lubricant)],
  outputs := [(1, .foundry)],
  time := 10
}
| .foundryRecycling => {
  name := some "foundry-recycling",
  inputs := [(1, .foundry)],
  outputs := [(12, .tungstenCarbide), (12, .steelPlate), (7, .electronicCircuit), (5, .refinedConcrete)],
  time := 0.625
}
| .fusionGenerator => {
  name := some "fusion-generator",
  inputs := [(100, .tungstenPlate), (100, .superconductor), (50, .quantumProcessor)],
  outputs := [(1, .fusionGenerator)],
  time := 30
}
| .fusionGeneratorRecycling => {
  name := some "fusion-generator-recycling",
  inputs := [(1, .fusionGenerator)],
  outputs := [(25, .tungstenPlate), (25, .superconductor), (12, .quantumProcessor)],
  time := 1.875
}
| .fusionPowerCell => {
  name := some "fusion-power-cell",
  inputs := [(1, .holmiumPlate), (5, .lithiumPlate), (100, .ammonia)],
  outputs := [(1, .fusionPowerCell)],
  time := 10
}
| .fusionPowerCellRecycling => {
  name := some "fusion-power-cell-recycling",
  inputs := [(1, .fusionPowerCell)],
  outputs := [(1, .fusionPowerCell)],
  time := 0.625
}
| .fusionReactor => {
  name := some "fusion-reactor",
  inputs := [(200, .tungstenPlate), (200, .superconductor), (250, .quantumProcessor)],
  outputs := [(1, .fusionReactor)],
  time := 60
}
| .fusionReactorEquipment => {
  name := some "fusion-reactor-equipment",
  inputs := [(250, .tungstenPlate), (25, .supercapacitor), (100, .carbonFiber), (250, .quantumProcessor), (10, .fusionPowerCell), (1, .fissionReactorEquipment)],
  outputs := [(1, .fusionReactorEquipment)],
  time := 30
}
| .fusionReactorEquipmentRecycling => {
  name := some "fusion-reactor-equipment-recycling",
  inputs := [(1, .fusionReactorEquipment)],
  outputs := [(0, .fissionReactorEquipment), (2, .fusionPowerCell), (62, .tungstenPlate), (25, .carbonFiber), (6, .supercapacitor), (62, .quantumProcessor)],
  time := 1.875
}
| .fusionReactorRecycling => {
  name := some "fusion-reactor-recycling",
  inputs := [(1, .fusionReactor)],
  outputs := [(50, .tungstenPlate), (50, .superconductor), (62, .quantumProcessor)],
  time := 3.75
}
| .gate => {
  name := some "gate",
  inputs := [(2, .steelPlate), (2, .electronicCircuit), (1, .stoneWall)],
  outputs := [(1, .gate)],
  time := 0.5
}
| .gateRecycling => {
  name := some "gate-recycling",
  inputs := [(1, .gate)],
  outputs := [(0, .stoneWall), (0, .steelPlate), (0, .electronicCircuit)],
  time := 0.03125
}
| .grenade => {
  name := some "grenade",
  inputs := [(10, .coal), (5, .ironPlate)],
  outputs := [(1, .grenade)],
  time := 8
}
| .grenadeRecycling => {
  name := some "grenade-recycling",
  inputs := [(1, .grenade)],
  outputs := [(1, .ironPlate), (2, .coal)],
  time := 0.5
}
| .gunTurret => {
  name := some "gun-turret",
  inputs := [(20, .ironPlate), (10, .copperPlate), (10, .ironGearWheel)],
  outputs := [(1, .gunTurret)],
  time := 8
}
| .gunTurretRecycling => {
  name := some "gun-turret-recycling",
  inputs := [(1, .gunTurret)],
  outputs := [(2, .ironGearWheel), (2, .copperPlate), (5, .ironPlate)],
  time := 0.5
}
| .hazardConcrete => {
  name := some "hazard-concrete",
  inputs := [(10, .concrete)],
  outputs := [(10, .hazardConcrete)],
  time := 0.25
}
| .hazardConcreteRecycling => {
  name := some "hazard-concrete-recycling",
  inputs := [(1, .hazardConcrete)],
  outputs := [(0, .concrete)],
  time := 0.015625
}
| .heatExchanger => {
  name := some "heat-exchanger",
  inputs := [(100, .copperPlate), (10, .steelPlate), (10, .pipe)],
  outputs := [(1, .heatExchanger)],
  time := 3
}
| .heatExchangerRecycling => {
  name := some "heat-exchanger-recycling",
  inputs := [(1, .heatExchanger)],
  outputs := [(2, .steelPlate), (25, .copperPlate), (2, .pipe)],
  time := 0.1875
}
| .heatInterface => {
  name := some "heat-interface",
  inputs := [(5, .electronicCircuit), (1, .heatPipe)],
  outputs := [(1, .heatInterface)],
  time := 0.5
}
| .heatInterfaceRecycling => {
  name := some "heat-interface-recycling",
  inputs := [(1, .heatInterface)],
  outputs := [(0, .heatPipe), (1, .electronicCircuit)],
  time := 0.03125
}
| .heatPipe => {
  name := some "heat-pipe",
  inputs := [(20, .copperPlate), (10, .steelPlate)],
  outputs := [(1, .heatPipe)],
  time := 1
}
| .heatPipeRecycling => {
  name := some "heat-pipe-recycling",
  inputs := [(1, .heatPipe)],
  outputs := [(2, .steelPlate), (5, .copperPlate)],
  time := 0.0625
}
| .heatingTower => {
  name := some "heating-tower",
  inputs := [(20, .concrete), (2, .boiler), (5, .heatPipe)],
  outputs := [(1, .heatingTower)],
  time := 10
}
| .heatingTowerRecycling => {
  name := some "heating-tower-recycling",
  inputs := [(1, .heatingTower)],
  outputs := [(0, .boiler), (1, .heatPipe), (5, .concrete)],
  time := 0.625
}
| .heavyArmor => {
  name := some "heavy-armor",
  inputs := [(100, .copperPlate), (50, .steelPlate)],
  outputs := [(1, .heavyArmor)],
  time := 8
}
| .heavyArmorRecycling => {
  name := some "heavy-armor-recycling",
  inputs := [(1, .heavyArmor)],
  outputs := [(25, .copperPlate), (12, .steelPlate)],
  time := 0.5
}
| .heavyOilBarrel => {
  name := some "heavy-oil-barrel",
  inputs := [(1, .barrel), (50, .heavyOil)],
  outputs := [(1, .heavyOilBarrel)],
  time := 0.2
}
| .heavyOilBarrelRecycling => {
  name := some "heavy-oil-barrel-recycling",
  inputs := [(1, .heavyOilBarrel)],
  outputs := [(0, .barrel)],
  time := 0.0125
}
| .heavyOilCracking => {
  name := some "heavy-oil-cracking",
  inputs := [(30, .water), (40, .heavyOil)],
  outputs := [(30, .lightOil)],
  time := 2
}
| .holmiumOreRecycling => {
  name := some "holmium-ore-recycling",
  inputs := [(1, .holmiumOre)],
  outputs := [(1, .holmiumOre)],
  time := 0.03125
}
| .holmiumPlate => {
  name := some "holmium-plate",
  inputs := [(20, .holmiumSolution)],
  outputs := [(1, .holmiumPlate)],
  time := 1
}
| .holmiumPlateRecycling => {
  name := some "holmium-plate-recycling",
  inputs := [(1, .holmiumPlate)],
  outputs := [(1, .holmiumPlate)],
  time := 0.0625
}
| .holmiumSolution => {
  name := some "holmium-solution",
  inputs := [(1, .stone), (2, .holmiumOre), (10, .water)],
  outputs := [(100, .holmiumSolution)],
  time := 10
}
| .iceMelting => {
  name := some "ice-melting",
  inputs := [(1, .ice)],
  outputs := [(20, .water)],
  time := 1
}
| .icePlatform => {
  name := some "ice-platform",
  inputs := [(50, .ice), (400, .ammonia)],
  outputs := [(1, .icePlatform)],
  time := 30
}
| .icePlatformRecycling => {
  name := some "ice-platform-recycling",
  inputs := [(1, .icePlatform)],
  outputs := [(12, .ice)],
  time := 1.875
}
| .iceRecycling => {
  name := some "ice-recycling",
  inputs := [(1, .ice)],
  outputs := [(1, .ice)],
  time := 0.03125
}
| .infinityCargoWagonRecycling => {
  name := some "infinity-cargo-wagon-recycling",
  inputs := [(1, .infinityCargoWagon)],
  outputs := [(1, .infinityCargoWagon)],
  time := 0.03125
}
| .infinityChest => {
  name := some "infinity-chest",
  inputs := [(5, .electronicCircuit), (1, .steelChest)],
  outputs := [(1, .infinityChest)],
  time := 0.5
}
| .infinityChestRecycling => {
  name := some "infinity-chest-recycling",
  inputs := [(1, .infinityChest)],
  outputs := [(0, .steelChest), (1, .electronicCircuit)],
  time := 0.03125
}
| .infinityPipe => {
  name := some "infinity-pipe",
  inputs := [(5, .electronicCircuit), (1, .pipe)],
  outputs := [(1, .infinityPipe)],
  time := 0.5
}
| .infinityPipeRecycling => {
  name := some "infinity-pipe-recycling",
  inputs := [(1, .infinityPipe)],
  outputs := [(0, .pipe), (1, .electronicCircuit)],
  time := 0.03125
}
| .inserter => {
  name := some "inserter",
  inputs := [(1, .ironPlate), (1, .ironGearWheel), (1, .electronicCircuit)],
  outputs := [(1, .inserter)],
  time := 0.5
}
| .inserterRecycling => {
  name := some "inserter-recycling",
  inputs := [(1, .inserter)],
  outputs := [(0, .electronicCircuit), (0, .ironGearWheel), (0, .ironPlate)],
  time := 0.03125
}
| .ironBacteria => {
  name := some "iron-bacteria",
  inputs := [(6, .jelly)],
  outputs := [(1, .ironBacteria), (4, .spoilage)],
  time := 1
}
| .ironBacteriaCultivation => {
  name := some "iron-bacteria-cultivation",
  inputs := [(1, .ironBacteria), (1, .bioflux)],
  outputs := [(4, .ironBacteria)],
  time := 4
}
| .ironBacteriaRecycling => {
  name := some "iron-bacteria-recycling",
  inputs := [(1, .ironBacteria)],
  outputs := [(1, .ironBacteria)],
  time := 0.0625
}
| .ironChest => {
  name := some "iron-chest",
  inputs := [(8, .ironPlate)],
  outputs := [(1, .ironChest)],
  time := 0.5
}
| .ironChestRecycling => {
  name := some "iron-chest-recycling",
  inputs := [(1, .ironChest)],
  outputs := [(2, .ironPlate)],
  time := 0.03125
}
| .ironGearWheel => {
  name := some "iron-gear-wheel",
  inputs := [(2, .ironPlate)],
  outputs := [(1, .ironGearWheel)],
  time := 0.5
}
| .ironGearWheelRecycling => {
  name := some "iron-gear-wheel-recycling",
  inputs := [(1, .ironGearWheel)],
  outputs := [(0, .ironPlate)],
  time := 0.03125
}
| .ironOreRecycling => {
  name := some "iron-ore-recycling",
  inputs := [(1, .ironOre)],
  outputs := [(1, .ironOre)],
  time := 0.03125
}
| .ironPlate => {
  name := some "iron-plate",
  inputs := [(1, .ironOre)],
  outputs := [(1, .ironPlate)],
  time := 3.2
}
| .ironPlateRecycling => {
  name := some "iron-plate-recycling",
  inputs := [(1, .ironPlate)],
  outputs := [(1, .ironPlate)],
  time := 0.2
}
| .ironStick => {
  name := some "iron-stick",
  inputs := [(1, .ironPlate)],
  outputs := [(2, .ironStick)],
  time := 0.5
}
| .ironStickRecycling => {
  name := some "iron-stick-recycling",
  inputs := [(1, .ironStick)],
  outputs := [(0, .ironPlate)],
  time := 0.03125
}
| .itemUnknownRecycling => {
  name := some "item-unknown-recycling",
  inputs := [(1, .itemUnknown)],
  outputs := [(1, .itemUnknown)],
  time := 0.03125
}
| .jellyRecycling => {
  name := some "jelly-recycling",
  inputs := [(1, .jelly)],
  outputs := [(1, .jelly)],
  time := 0.03125
}
| .jellynutProcessing => {
  name := some "jellynut-processing",
  inputs := [(1, .jellynut)],
  outputs := [(1, .jellynutSeed), (4, .jelly)],
  time := 1
}
| .jellynutRecycling => {
  name := some "jellynut-recycling",
  inputs := [(1, .jellynut)],
  outputs := [(1, .jellynut)],
  time := 0.03125
}
| .jellynutSeedRecycling => {
  name := some "jellynut-seed-recycling",
  inputs := [(1, .jellynutSeed)],
  outputs := [(1, .jellynutSeed)],
  time := 0.03125
}
| .kovarexEnrichmentProcess => {
  name := some "kovarex-enrichment-process",
  inputs := [(40, .uranium235), (5, .uranium238)],
  outputs := [(41, .uranium235), (2, .uranium238)],
  time := 60
}
| .lab => {
  name := some "lab",
  inputs := [(10, .ironGearWheel), (10, .electronicCircuit), (4, .transportBelt)],
  outputs := [(1, .lab)],
  time := 2
}
| .labRecycling => {
  name := some "lab-recycling",
  inputs := [(1, .lab)],
  outputs := [(2, .electronicCircuit), (2, .ironGearWheel), (1, .transportBelt)],
  time := 0.125
}
| .landMine => {
  name := some "land-mine",
  inputs := [(1, .steelPlate), (2, .explosives)],
  outputs := [(4, .landMine)],
  time := 5
}
| .landMineRecycling => {
  name := some "land-mine-recycling",
  inputs := [(1, .landMine)],
  outputs := [(0, .steelPlate), (0, .explosives)],
  time := 0.3125
}
| .landfill => {
  name := some "landfill",
  inputs := [(50, .stone)],
  outputs := [(1, .landfill)],
  time := 0.5
}
| .landfillRecycling => {
  name := some "landfill-recycling",
  inputs := [(1, .landfill)],
  outputs := [(1, .landfill)],
  time := 0.03125
}
| .laneSplitterRecycling => {
  name := some "lane-splitter-recycling",
  inputs := [(1, .laneSplitter)],
  outputs := [(1, .laneSplitter)],
  time := 0.03125
}
| .laserTurret => {
  name := some "laser-turret",
  inputs := [(20, .steelPlate), (12, .battery), (20, .electronicCircuit)],
  outputs := [(1, .laserTurret)],
  time := 20
}
| .laserTurretRecycling => {
  name := some "laser-turret-recycling",
  inputs := [(1, .laserTurret)],
  outputs := [(5, .steelPlate), (5, .electronicCircuit), (3, .battery)],
  time := 1.25
}
| .lightArmor => {
  name := some "light-armor",
  inputs := [(40, .ironPlate)],
  outputs := [(1, .lightArmor)],
  time := 3
}
| .lightArmorRecycling => {
  name := some "light-armor-recycling",
  inputs := [(1, .lightArmor)],
  outputs := [(10, .ironPlate)],
  time := 0.1875
}
| .lightOilBarrel => {
  name := some "light-oil-barrel",
  inputs := [(1, .barrel), (50, .lightOil)],
  outputs := [(1, .lightOilBarrel)],
  time := 0.2
}
| .lightOilBarrelRecycling => {
  name := some "light-oil-barrel-recycling",
  inputs := [(1, .lightOilBarrel)],
  outputs := [(0, .barrel)],
  time := 0.0125
}
| .lightOilCracking => {
  name := some "light-oil-cracking",
  inputs := [(30, .water), (30, .lightOil)],
  outputs := [(20, .petroleumGas)],
  time := 2
}
| .lightningCollector => {
  name := some "lightning-collector",
  inputs := [(8, .supercapacitor), (1, .accumulator), (1, .lightningRod), (80, .electrolyte)],
  outputs := [(1, .lightningCollector)],
  time := 5
}
| .lightningCollectorRecycling => {
  name := some "lightning-collector-recycling",
  inputs := [(1, .lightningCollector)],
  outputs := [(0, .lightningRod), (2, .supercapacitor), (0, .accumulator)],
  time := 0.3125
}
| .lightningRod => {
  name := some "lightning-rod",
  inputs := [(8, .steelPlate), (12, .copperCable), (4, .stoneBrick)],
  outputs := [(1, .lightningRod)],
  time := 5
}
| .lightningRodRecycling => {
  name := some "lightning-rod-recycling",
  inputs := [(1, .lightningRod)],
  outputs := [(3, .copperCable), (2, .steelPlate), (1, .stoneBrick)],
  time := 0.3125
}
| .linkedBeltRecycling => {
  name := some "linked-belt-recycling",
  inputs := [(1, .linkedBelt)],
  outputs := [(1, .linkedBelt)],
  time := 0.03125
}
| .linkedChestRecycling => {
  name := some "linked-chest-recycling",
  inputs := [(1, .linkedChest)],
  outputs := [(1, .linkedChest)],
  time := 0.03125
}
| .lithium => {
  name := some "lithium",
  inputs := [(1, .holmiumPlate), (50, .lithiumBrine), (50, .ammonia)],
  outputs := [(5, .lithium)],
  time := 20
}
| .lithiumPlate => {
  name := some "lithium-plate",
  inputs := [(1, .lithium)],
  outputs := [(1, .lithiumPlate)],
  time := 6.4
}
| .lithiumPlateRecycling => {
  name := some "lithium-plate-recycling",
  inputs := [(1, .lithiumPlate)],
  outputs := [(1, .lithiumPlate)],
  time := 0.4
}
| .lithiumRecycling => {
  name := some "lithium-recycling",
  inputs := [(1, .lithium)],
  outputs := [(1, .lithium)],
  time := 1.25
}
| .loader => {
  name := some "loader",
  inputs := [(5, .ironPlate), (5, .ironGearWheel), (5, .electronicCircuit), (5, .transportBelt), (5, .inserter)],
  outputs := [(1, .loader)],
  time := 1
}
| .loaderRecycling => {
  name := some "loader-recycling",
  inputs := [(1, .loader)],
  outputs := [(1, .inserter), (1, .electronicCircuit), (1, .ironGearWheel), (1, .ironPlate), (1, .transportBelt)],
  time := 0.0625
}
| .locomotive => {
  name := some "locomotive",
  inputs := [(30, .steelPlate), (10, .electronicCircuit), (20, .engineUnit)],
  outputs := [(1, .locomotive)],
  time := 4
}
| .locomotiveRecycling => {
  name := some "locomotive-recycling",
  inputs := [(1, .locomotive)],
  outputs := [(5, .engineUnit), (2, .electronicCircuit), (7, .steelPlate)],
  time := 0.25
}
| .logisticRobot => {
  name := some "logistic-robot",
  inputs := [(2, .advancedCircuit), (1, .flyingRobotFrame)],
  outputs := [(1, .logisticRobot)],
  time := 0.5
}
| .logisticRobotRecycling => {
  name := some "logistic-robot-recycling",
  inputs := [(1, .logisticRobot)],
  outputs := [(0, .flyingRobotFrame), (0, .advancedCircuit)],
  time := 0.03125
}
| .logisticSciencePack => {
  name := some "logistic-science-pack",
  inputs := [(1, .transportBelt), (1, .inserter)],
  outputs := [(1, .logisticSciencePack)],
  time := 6
}
| .logisticSciencePackRecycling => {
  name := some "logistic-science-pack-recycling",
  inputs := [(1, .logisticSciencePack)],
  outputs := [(1, .logisticSciencePack)],
  time := 0.375
}
| .longHandedInserter => {
  name := some "long-handed-inserter",
  inputs := [(1, .ironPlate), (1, .ironGearWheel), (1, .inserter)],
  outputs := [(1, .longHandedInserter)],
  time := 0.5
}
| .longHandedInserterRecycling => {
  name := some "long-handed-inserter-recycling",
  inputs := [(1, .longHandedInserter)],
  outputs := [(0, .ironGearWheel), (0, .ironPlate), (0, .inserter)],
  time := 0.03125
}
| .lowDensityStructure => {
  name := some "low-density-structure",
  inputs := [(20, .copperPlate), (2, .steelPlate), (5, .plasticBar)],
  outputs := [(1, .lowDensityStructure)],
  time := 15
}
| .lowDensityStructureRecycling => {
  name := some "low-density-structure-recycling",
  inputs := [(1, .lowDensityStructure)],
  outputs := [(0, .steelPlate), (5, .copperPlate), (1, .plasticBar)],
  time := 0.9375
}
| .lubricant => {
  name := some "lubricant",
  inputs := [(10, .heavyOil)],
  outputs := [(10, .lubricant)],
  time := 1
}
| .lubricantBarrel => {
  name := some "lubricant-barrel",
  inputs := [(1, .barrel), (50, .lubricant)],
  outputs := [(1, .lubricantBarrel)],
  time := 0.2
}
| .lubricantBarrelRecycling => {
  name := some "lubricant-barrel-recycling",
  inputs := [(1, .lubricantBarrel)],
  outputs := [(0, .barrel)],
  time := 0.0125
}
| .mechArmor => {
  name := some "mech-armor",
  inputs := [(100, .processingUnit), (200, .holmiumPlate), (50, .superconductor), (50, .supercapacitor), (1, .powerArmorMk2)],
  outputs := [(1, .mechArmor)],
  time := 60
}
| .mechArmorRecycling => {
  name := some "mech-armor-recycling",
  inputs := [(1, .mechArmor)],
  outputs := [(0, .powerArmorMk2), (50, .holmiumPlate), (25, .processingUnit), (12, .superconductor), (12, .supercapacitor)],
  time := 3.75
}
| .mediumElectricPole => {
  name := some "medium-electric-pole",
  inputs := [(2, .steelPlate), (4, .ironStick), (2, .copperCable)],
  outputs := [(1, .mediumElectricPole)],
  time := 0.5
}
| .mediumElectricPoleRecycling => {
  name := some "medium-electric-pole-recycling",
  inputs := [(1, .mediumElectricPole)],
  outputs := [(1, .ironStick), (0, .steelPlate), (0, .copperCable)],
  time := 0.03125
}
| .metallicAsteroidChunkRecycling => {
  name := some "metallic-asteroid-chunk-recycling",
  inputs := [(1, .metallicAsteroidChunk)],
  outputs := [(1, .metallicAsteroidChunk)],
  time := 0.03125
}
| .metallicAsteroidCrushing => {
  name := some "metallic-asteroid-crushing",
  inputs := [(1, .metallicAsteroidChunk)],
  outputs := [(20, .ironOre), (1, .metallicAsteroidChunk)],
  time := 2
}
| .metallicAsteroidReprocessing => {
  name := some "metallic-asteroid-reprocessing",
  inputs := [(1, .metallicAsteroidChunk)],
  outputs := [(1, .metallicAsteroidChunk), (1, .carbonicAsteroidChunk), (1, .oxideAsteroidChunk)],
  time := 2
}
| .metallurgicSciencePack => {
  name := some "metallurgic-science-pack",
  inputs := [(3, .tungstenCarbide), (2, .tungstenPlate), (200, .moltenCopper)],
  outputs := [(1, .metallurgicSciencePack)],
  time := 10
}
| .metallurgicSciencePackRecycling => {
  name := some "metallurgic-science-pack-recycling",
  inputs := [(1, .metallurgicSciencePack)],
  outputs := [(1, .metallurgicSciencePack)],
  time := 0.625
}
| .militarySciencePack => {
  name := some "military-science-pack",
  inputs := [(1, .piercingRoundsMagazine), (1, .grenade), (2, .stoneWall)],
  outputs := [(2, .militarySciencePack)],
  time := 10
}
| .militarySciencePackRecycling => {
  name := some "military-science-pack-recycling",
  inputs := [(1, .militarySciencePack)],
  outputs := [(1, .militarySciencePack)],
  time := 0.625
}
| .modularArmor => {
  name := some "modular-armor",
  inputs := [(50, .steelPlate), (30, .advancedCircuit)],
  outputs := [(1, .modularArmor)],
  time := 15
}
| .modularArmorRecycling => {
  name := some "modular-armor-recycling",
  inputs := [(1, .modularArmor)],
  outputs := [(7, .advancedCircuit), (12, .steelPlate)],
  time := 0.9375
}
| .moltenCopper => {
  name := some "molten-copper",
  inputs := [(50, .copperOre), (1, .calcite)],
  outputs := [(500, .moltenCopper)],
  time := 32
}
| .moltenCopperFromLava => {
  name := some "molten-copper-from-lava",
  inputs := [(1, .calcite), (500, .lava)],
  outputs := [(15, .stone), (250, .moltenCopper)],
  time := 16
}
| .moltenIron => {
  name := some "molten-iron",
  inputs := [(50, .ironOre), (1, .calcite)],
  outputs := [(500, .moltenIron)],
  time := 32
}
| .moltenIronFromLava => {
  name := some "molten-iron-from-lava",
  inputs := [(1, .calcite), (500, .lava)],
  outputs := [(10, .stone), (250, .moltenIron)],
  time := 16
}
| .nightVisionEquipment => {
  name := some "night-vision-equipment",
  inputs := [(10, .steelPlate), (5, .advancedCircuit)],
  outputs := [(1, .nightVisionEquipment)],
  time := 10
}
| .nightVisionEquipmentRecycling => {
  name := some "night-vision-equipment-recycling",
  inputs := [(1, .nightVisionEquipment)],
  outputs := [(1, .advancedCircuit), (2, .steelPlate)],
  time := 0.625
}
| .nuclearFuel => {
  name := some "nuclear-fuel",
  inputs := [(1, .rocketFuel), (1, .uranium235)],
  outputs := [(1, .nuclearFuel)],
  time := 90
}
| .nuclearFuelRecycling => {
  name := some "nuclear-fuel-recycling",
  inputs := [(1, .nuclearFuel)],
  outputs := [(0, .uranium235), (0, .rocketFuel)],
  time := 5.625
}
| .nuclearFuelReprocessing => {
  name := some "nuclear-fuel-reprocessing",
  inputs := [(5, .depletedUraniumFuelCell)],
  outputs := [(3, .uranium238)],
  time := 60
}
| .nuclearReactor => {
  name := some "nuclear-reactor",
  inputs := [(500, .copperPlate), (500, .steelPlate), (500, .advancedCircuit), (500, .concrete)],
  outputs := [(1, .nuclearReactor)],
  time := 8
}
| .nuclearReactorRecycling => {
  name := some "nuclear-reactor-recycling",
  inputs := [(1, .nuclearReactor)],
  outputs := [(125, .concrete), (125, .steelPlate), (125, .advancedCircuit), (125, .copperPlate)],
  time := 0.5
}
| .nutrientsFromBioflux => {
  name := some "nutrients-from-bioflux",
  inputs := [(5, .bioflux)],
  outputs := [(40, .nutrients)],
  time := 2
}
| .nutrientsFromBiterEgg => {
  name := some "nutrients-from-biter-egg",
  inputs := [(1, .biterEgg)],
  outputs := [(20, .nutrients)],
  time := 2
}
| .nutrientsFromFish => {
  name := some "nutrients-from-fish",
  inputs := [(1, .rawFish)],
  outputs := [(20, .nutrients)],
  time := 2
}
| .nutrientsFromSpoilage => {
  name := some "nutrients-from-spoilage",
  inputs := [(10, .spoilage)],
  outputs := [(1, .nutrients)],
  time := 2
}
| .nutrientsFromYumakoMash => {
  name := some "nutrients-from-yumako-mash",
  inputs := [(4, .yumakoMash)],
  outputs := [(6, .nutrients)],
  time := 4
}
| .nutrientsRecycling => {
  name := some "nutrients-recycling",
  inputs := [(1, .nutrients)],
  outputs := [(2, .spoilage)],
  time := 0.125
}
| .offshorePump => {
  name := some "offshore-pump",
  inputs := [(2, .ironGearWheel), (3, .pipe)],
  outputs := [(1, .offshorePump)],
  time := 0.5
}
| .offshorePumpRecycling => {
  name := some "offshore-pump-recycling",
  inputs := [(1, .offshorePump)],
  outputs := [(0, .pipe), (0, .ironGearWheel)],
  time := 0.03125
}
| .oilRefinery => {
  name := some "oil-refinery",
  inputs := [(15, .steelPlate), (10, .ironGearWheel), (10, .electronicCircuit), (10, .pipe), (10, .stoneBrick)],
  outputs := [(1, .oilRefinery)],
  time := 8
}
| .oilRefineryRecycling => {
  name := some "oil-refinery-recycling",
  inputs := [(1, .oilRefinery)],
  outputs := [(3, .steelPlate), (2, .ironGearWheel), (2, .stoneBrick), (2, .electronicCircuit), (2, .pipe)],
  time := 0.5
}
| .oneWayValveRecycling => {
  name := some "one-way-valve-recycling",
  inputs := [(1, .oneWayValve)],
  outputs := [(1, .oneWayValve)],
  time := 0.03125
}
| .overflowValveRecycling => {
  name := some "overflow-valve-recycling",
  inputs := [(1, .overflowValve)],
  outputs := [(1, .overflowValve)],
  time := 0.03125
}
| .overgrowthJellynutSoil => {
  name := some "overgrowth-jellynut-soil",
  inputs := [(5, .jellynutSeed), (50, .spoilage), (10, .biterEgg), (2, .artificialJellynutSoil), (100, .water)],
  outputs := [(1, .overgrowthJellynutSoil)],
  time := 10
}
| .overgrowthJellynutSoilRecycling => {
  name := some "overgrowth-jellynut-soil-recycling",
  inputs := [(1, .overgrowthJellynutSoil)],
  outputs := [(0, .artificialJellynutSoil), (1, .jellynutSeed), (2, .biterEgg), (12, .spoilage)],
  time := 0.625
}
| .overgrowthYumakoSoil => {
  name := some "overgrowth-yumako-soil",
  inputs := [(5, .yumakoSeed), (50, .spoilage), (10, .biterEgg), (2, .artificialYumakoSoil), (100, .water)],
  outputs := [(1, .overgrowthYumakoSoil)],
  time := 10
}
| .overgrowthYumakoSoilRecycling => {
  name := some "overgrowth-yumako-soil-recycling",
  inputs := [(1, .overgrowthYumakoSoil)],
  outputs := [(0, .artificialYumakoSoil), (1, .yumakoSeed), (2, .biterEgg), (12, .spoilage)],
  time := 0.625
}
| .oxideAsteroidChunkRecycling => {
  name := some "oxide-asteroid-chunk-recycling",
  inputs := [(1, .oxideAsteroidChunk)],
  outputs := [(1, .oxideAsteroidChunk)],
  time := 0.03125
}
| .oxideAsteroidCrushing => {
  name := some "oxide-asteroid-crushing",
  inputs := [(1, .oxideAsteroidChunk)],
  outputs := [(5, .ice), (1, .oxideAsteroidChunk)],
  time := 2
}
| .oxideAsteroidReprocessing => {
  name := some "oxide-asteroid-reprocessing",
  inputs := [(1, .oxideAsteroidChunk)],
  outputs := [(1, .oxideAsteroidChunk), (1, .metallicAsteroidChunk), (1, .carbonicAsteroidChunk)],
  time := 1
}
| .parameter0 => {
  name := some "parameter-0",
  inputs := [],
  outputs := [],
  time := 0.5
}
| .parameter1 => {
  name := some "parameter-1",
  inputs := [],
  outputs := [],
  time := 0.5
}
| .parameter2 => {
  name := some "parameter-2",
  inputs := [],
  outputs := [],
  time := 0.5
}
| .parameter3 => {
  name := some "parameter-3",
  inputs := [],
  outputs := [],
  time := 0.5
}
| .parameter4 => {
  name := some "parameter-4",
  inputs := [],
  outputs := [],
  time := 0.5
}
| .parameter5 => {
  name := some "parameter-5",
  inputs := [],
  outputs := [],
  time := 0.5
}
| .parameter6 => {
  name := some "parameter-6",
  inputs := [],
  outputs := [],
  time := 0.5
}
| .parameter7 => {
  name := some "parameter-7",
  inputs := [],
  outputs := [],
  time := 0.5
}
| .parameter8 => {
  name := some "parameter-8",
  inputs := [],
  outputs := [],
  time := 0.5
}
| .parameter9 => {
  name := some "parameter-9",
  inputs := [],
  outputs := [],
  time := 0.5
}
| .passiveProviderChest => {
  name := some "passive-provider-chest",
  inputs := [(3, .electronicCircuit), (1, .advancedCircuit), (1, .steelChest)],
  outputs := [(1, .passiveProviderChest)],
  time := 0.5
}
| .passiveProviderChestRecycling => {
  name := some "passive-provider-chest-recycling",
  inputs := [(1, .passiveProviderChest)],
  outputs := [(0, .steelChest), (0, .electronicCircuit), (0, .advancedCircuit)],
  time := 0.03125
}
| .pentapodEgg => {
  name := some "pentapod-egg",
  inputs := [(30, .nutrients), (1, .pentapodEgg), (60, .water)],
  outputs := [(2, .pentapodEgg)],
  time := 15
}
| .pentapodEggRecycling => {
  name := some "pentapod-egg-recycling",
  inputs := [(1, .pentapodEgg)],
  outputs := [(1, .pentapodEgg)],
  time := 0.9375
}
| .personalLaserDefenseEquipment => {
  name := some "personal-laser-defense-equipment",
  inputs := [(20, .processingUnit), (5, .lowDensityStructure), (5, .laserTurret)],
  outputs := [(1, .personalLaserDefenseEquipment)],
  time := 10
}
| .personalLaserDefenseEquipmentRecycling => {
  name := some "personal-laser-defense-equipment-recycling",
  inputs := [(1, .personalLaserDefenseEquipment)],
  outputs := [(5, .processingUnit), (1, .lowDensityStructure), (1, .laserTurret)],
  time := 0.625
}
| .personalRoboportEquipment => {
  name := some "personal-roboport-equipment",
  inputs := [(20, .steelPlate), (45, .battery), (40, .ironGearWheel), (10, .advancedCircuit)],
  outputs := [(1, .personalRoboportEquipment)],
  time := 10
}
| .personalRoboportEquipmentRecycling => {
  name := some "personal-roboport-equipment-recycling",
  inputs := [(1, .personalRoboportEquipment)],
  outputs := [(2, .advancedCircuit), (10, .ironGearWheel), (5, .steelPlate), (11, .battery)],
  time := 0.625
}
| .personalRoboportMk2Equipment => {
  name := some "personal-roboport-mk2-equipment",
  inputs := [(50, .processingUnit), (50, .superconductor), (5, .personalRoboportEquipment)],
  outputs := [(1, .personalRoboportMk2Equipment)],
  time := 20
}
| .personalRoboportMk2EquipmentRecycling => {
  name := some "personal-roboport-mk2-equipment-recycling",
  inputs := [(1, .personalRoboportMk2Equipment)],
  outputs := [(1, .personalRoboportEquipment), (12, .processingUnit), (12, .superconductor)],
  time := 1.25
}
| .petroleumGasBarrel => {
  name := some "petroleum-gas-barrel",
  inputs := [(1, .barrel), (50, .petroleumGas)],
  outputs := [(1, .petroleumGasBarrel)],
  time := 0.2
}
| .petroleumGasBarrelRecycling => {
  name := some "petroleum-gas-barrel-recycling",
  inputs := [(1, .petroleumGasBarrel)],
  outputs := [(0, .barrel)],
  time := 0.0125
}
| .piercingRoundsMagazine => {
  name := some "piercing-rounds-magazine",
  inputs := [(2, .copperPlate), (1, .steelPlate), (2, .firearmMagazine)],
  outputs := [(2, .piercingRoundsMagazine)],
  time := 6
}
| .piercingRoundsMagazineRecycling => {
  name := some "piercing-rounds-magazine-recycling",
  inputs := [(1, .piercingRoundsMagazine)],
  outputs := [(0, .firearmMagazine), (0, .steelPlate), (0, .copperPlate)],
  time := 0.375
}
| .piercingShotgunShell => {
  name := some "piercing-shotgun-shell",
  inputs := [(5, .copperPlate), (2, .steelPlate), (2, .shotgunShell)],
  outputs := [(1, .piercingShotgunShell)],
  time := 8
}
| .piercingShotgunShellRecycling => {
  name := some "piercing-shotgun-shell-recycling",
  inputs := [(1, .piercingShotgunShell)],
  outputs := [(0, .shotgunShell), (1, .copperPlate), (0, .steelPlate)],
  time := 0.5
}
| .pipe => {
  name := some "pipe",
  inputs := [(1, .ironPlate)],
  outputs := [(1, .pipe)],
  time := 0.5
}
| .pipeRecycling => {
  name := some "pipe-recycling",
  inputs := [(1, .pipe)],
  outputs := [(0, .ironPlate)],
  time := 0.03125
}
| .pipeToGround => {
  name := some "pipe-to-ground",
  inputs := [(5, .ironPlate), (10, .pipe)],
  outputs := [(2, .pipeToGround)],
  time := 0.5
}
| .pipeToGroundRecycling => {
  name := some "pipe-to-ground-recycling",
  inputs := [(1, .pipeToGround)],
  outputs := [(1, .pipe), (0, .ironPlate)],
  time := 0.03125
}
| .pistol => {
  name := some "pistol",
  inputs := [(5, .ironPlate), (5, .copperPlate)],
  outputs := [(1, .pistol)],
  time := 5
}
| .pistolRecycling => {
  name := some "pistol-recycling",
  inputs := [(1, .pistol)],
  outputs := [(1, .copperPlate), (1, .ironPlate)],
  time := 0.3125
}
| .plasticBar => {
  name := some "plastic-bar",
  inputs := [(1, .coal), (20, .petroleumGas)],
  outputs := [(2, .plasticBar)],
  time := 1
}
| .plasticBarRecycling => {
  name := some "plastic-bar-recycling",
  inputs := [(1, .plasticBar)],
  outputs := [(1, .plasticBar)],
  time := 0.0625
}
| .poisonCapsule => {
  name := some "poison-capsule",
  inputs := [(10, .coal), (3, .steelPlate), (3, .electronicCircuit)],
  outputs := [(1, .poisonCapsule)],
  time := 8
}
| .poisonCapsuleRecycling => {
  name := some "poison-capsule-recycling",
  inputs := [(1, .poisonCapsule)],
  outputs := [(0, .steelPlate), (0, .electronicCircuit), (2, .coal)],
  time := 0.5
}
| .powerArmor => {
  name := some "power-armor",
  inputs := [(40, .steelPlate), (40, .processingUnit), (20, .electricEngineUnit)],
  outputs := [(1, .powerArmor)],
  time := 20
}
| .powerArmorMk2 => {
  name := some "power-armor-mk2",
  inputs := [(60, .processingUnit), (40, .electricEngineUnit), (30, .lowDensityStructure), (100, .speedModule), (100, .efficiencyModule)],
  outputs := [(1, .powerArmorMk2)],
  time := 25
}
| .powerArmorMk2Recycling => {
  name := some "power-armor-mk2-recycling",
  inputs := [(1, .powerArmorMk2)],
  outputs := [(25, .efficiencyModule), (25, .speedModule), (15, .processingUnit), (10, .electricEngineUnit), (7, .lowDensityStructure)],
  time := 1.5625
}
| .powerArmorRecycling => {
  name := some "power-armor-recycling",
  inputs := [(1, .powerArmor)],
  outputs := [(10, .processingUnit), (5, .electricEngineUnit), (10, .steelPlate)],
  time := 1.25
}
| .powerSwitch => {
  name := some "power-switch",
  inputs := [(5, .ironPlate), (5, .copperCable), (2, .electronicCircuit)],
  outputs := [(1, .powerSwitch)],
  time := 2
}
| .powerSwitchRecycling => {
  name := some "power-switch-recycling",
  inputs := [(1, .powerSwitch)],
  outputs := [(1, .ironPlate), (1, .copperCable), (0, .electronicCircuit)],
  time := 0.125
}
| .processingUnit => {
  name := some "processing-unit",
  inputs := [(20, .electronicCircuit), (2, .advancedCircuit), (5, .sulfuricAcid)],
  outputs := [(1, .processingUnit)],
  time := 10
}
| .processingUnitRecycling => {
  name := some "processing-unit-recycling",
  inputs := [(1, .processingUnit)],
  outputs := [(5, .electronicCircuit), (0, .advancedCircuit)],
  time := 0.625
}
| .productionSciencePack => {
  name := some "production-science-pack",
  inputs := [(30, .rail), (1, .electricFurnace), (1, .productivityModule)],
  outputs := [(3, .productionSciencePack)],
  time := 21
}
| .productionSciencePackRecycling => {
  name := some "production-science-pack-recycling",
  inputs := [(1, .productionSciencePack)],
  outputs := [(1, .productionSciencePack)],
  time := 1.3125
}
| .productivityModule => {
  name := some "productivity-module",
  inputs := [(5, .electronicCircuit), (5, .advancedCircuit)],
  outputs := [(1, .productivityModule)],
  time := 15
}
| .productivityModule2 => {
  name := some "productivity-module-2",
  inputs := [(5, .advancedCircuit), (5, .processingUnit), (4, .productivityModule)],
  outputs := [(1, .productivityModule2)],
  time := 30
}
| .productivityModule2Recycling => {
  name := some "productivity-module-2-recycling",
  inputs := [(1, .productivityModule2)],
  outputs := [(1, .productivityModule), (1, .advancedCircuit), (1, .processingUnit)],
  time := 1.875
}
| .productivityModule3 => {
  name := some "productivity-module-3",
  inputs := [(5, .advancedCircuit), (5, .processingUnit), (1, .biterEgg), (4, .productivityModule2)],
  outputs := [(1, .productivityModule3)],
  time := 60
}
| .productivityModule3Recycling => {
  name := some "productivity-module-3-recycling",
  inputs := [(1, .productivityModule3)],
  outputs := [(1, .productivityModule2), (1, .advancedCircuit), (1, .processingUnit), (0, .biterEgg)],
  time := 3.75
}
| .productivityModuleRecycling => {
  name := some "productivity-module-recycling",
  inputs := [(1, .productivityModule)],
  outputs := [(1, .advancedCircuit), (1, .electronicCircuit)],
  time := 0.9375
}
| .programmableSpeaker => {
  name := some "programmable-speaker",
  inputs := [(3, .ironPlate), (4, .ironStick), (5, .copperCable), (4, .electronicCircuit)],
  outputs := [(1, .programmableSpeaker)],
  time := 2
}
| .programmableSpeakerRecycling => {
  name := some "programmable-speaker-recycling",
  inputs := [(1, .programmableSpeaker)],
  outputs := [(0, .ironPlate), (1, .ironStick), (1, .copperCable), (1, .electronicCircuit)],
  time := 0.125
}
| .promethiumAsteroidChunkRecycling => {
  name := some "promethium-asteroid-chunk-recycling",
  inputs := [(1, .promethiumAsteroidChunk)],
  outputs := [(1, .promethiumAsteroidChunk)],
  time := 0.03125
}
| .promethiumSciencePack => {
  name := some "promethium-science-pack",
  inputs := [(10, .biterEgg), (1, .quantumProcessor), (25, .promethiumAsteroidChunk)],
  outputs := [(10, .promethiumSciencePack)],
  time := 5
}
| .promethiumSciencePackRecycling => {
  name := some "promethium-science-pack-recycling",
  inputs := [(1, .promethiumSciencePack)],
  outputs := [(1, .promethiumSciencePack)],
  time := 0.3125
}
| .proxyContainerRecycling => {
  name := some "proxy-container-recycling",
  inputs := [(1, .proxyContainer)],
  outputs := [(1, .proxyContainer)],
  time := 0.03125
}
| .pump => {
  name := some "pump",
  inputs := [(1, .steelPlate), (1, .engineUnit), (1, .pipe)],
  outputs := [(1, .pump)],
  time := 2
}
| .pumpRecycling => {
  name := some "pump-recycling",
  inputs := [(1, .pump)],
  outputs := [(0, .engineUnit), (0, .steelPlate), (0, .pipe)],
  time := 0.125
}
| .pumpjack => {
  name := some "pumpjack",
  inputs := [(5, .steelPlate), (10, .ironGearWheel), (5, .electronicCircuit), (10, .pipe)],
  outputs := [(1, .pumpjack)],
  time := 5
}
| .pumpjackRecycling => {
  name := some "pumpjack-recycling",
  inputs := [(1, .pumpjack)],
  outputs := [(1, .steelPlate), (2, .ironGearWheel), (1, .electronicCircuit), (2, .pipe)],
  time := 0.3125
}
| .qualityModule => {
  name := some "quality-module",
  inputs := [(5, .electronicCircuit), (5, .advancedCircuit)],
  outputs := [(1, .qualityModule)],
  time := 15
}
| .qualityModule2 => {
  name := some "quality-module-2",
  inputs := [(5, .advancedCircuit), (5, .processingUnit), (4, .qualityModule)],
  outputs := [(1, .qualityModule2)],
  time := 30
}
| .qualityModule2Recycling => {
  name := some "quality-module-2-recycling",
  inputs := [(1, .qualityModule2)],
  outputs := [(1, .qualityModule), (1, .advancedCircuit), (1, .processingUnit)],
  time := 1.875
}
| .qualityModule3 => {
  name := some "quality-module-3",
  inputs := [(5, .advancedCircuit), (5, .processingUnit), (1, .superconductor), (4, .qualityModule2)],
  outputs := [(1, .qualityModule3)],
  time := 60
}
| .qualityModule3Recycling => {
  name := some "quality-module-3-recycling",
  inputs := [(1, .qualityModule3)],
  outputs := [(1, .qualityModule2), (1, .advancedCircuit), (1, .processingUnit), (0, .superconductor)],
  time := 3.75
}
| .qualityModuleRecycling => {
  name := some "quality-module-recycling",
  inputs := [(1, .qualityModule)],
  outputs := [(1, .electronicCircuit), (1, .advancedCircuit)],
  time := 0.9375
}
| .quantumProcessor => {
  name := some "quantum-processor",
  inputs := [(1, .processingUnit), (1, .tungstenCarbide), (1, .superconductor), (1, .carbonFiber), (2, .lithiumPlate), (10, .fluoroketoneCold)],
  outputs := [(1, .quantumProcessor), (5, .fluoroketoneHot)],
  time := 30
}
| .quantumProcessorRecycling => {
  name := some "quantum-processor-recycling",
  inputs := [(1, .quantumProcessor)],
  outputs := [(0, .tungstenCarbide), (0, .processingUnit), (0, .superconductor), (0, .carbonFiber), (0, .lithiumPlate)],
  time := 1.875
}
| .radar => {
  name := some "radar",
  inputs := [(10, .ironPlate), (5, .ironGearWheel), (5, .electronicCircuit)],
  outputs := [(1, .radar)],
  time := 0.5
}
| .radarRecycling => {
  name := some "radar-recycling",
  inputs := [(1, .radar)],
  outputs := [(1, .electronicCircuit), (1, .ironGearWheel), (2, .ironPlate)],
  time := 0.03125
}
| .rail => {
  name := some "rail",
  inputs := [(1, .stone), (1, .steelPlate), (1, .ironStick)],
  outputs := [(2, .rail)],
  time := 0.5
}
| .railChainSignal => {
  name := some "rail-chain-signal",
  inputs := [(5, .ironPlate), (1, .electronicCircuit)],
  outputs := [(1, .railChainSignal)],
  time := 0.5
}
| .railChainSignalRecycling => {
  name := some "rail-chain-signal-recycling",
  inputs := [(1, .railChainSignal)],
  outputs := [(0, .electronicCircuit), (1, .ironPlate)],
  time := 0.03125
}
| .railRamp => {
  name := some "rail-ramp",
  inputs := [(10, .steelPlate), (8, .rail), (100, .refinedConcrete)],
  outputs := [(1, .railRamp)],
  time := 0.5
}
| .railRampRecycling => {
  name := some "rail-ramp-recycling",
  inputs := [(1, .railRamp)],
  outputs := [(25, .refinedConcrete), (2, .rail), (2, .steelPlate)],
  time := 0.03125
}
| .railRecycling => {
  name := some "rail-recycling",
  inputs := [(1, .rail)],
  outputs := [(0, .stone), (0, .ironStick), (0, .steelPlate)],
  time := 0.03125
}
| .railSignal => {
  name := some "rail-signal",
  inputs := [(5, .ironPlate), (1, .electronicCircuit)],
  outputs := [(1, .railSignal)],
  time := 0.5
}
| .railSignalRecycling => {
  name := some "rail-signal-recycling",
  inputs := [(1, .railSignal)],
  outputs := [(0, .electronicCircuit), (1, .ironPlate)],
  time := 0.03125
}
| .railSupport => {
  name := some "rail-support",
  inputs := [(10, .steelPlate), (20, .refinedConcrete)],
  outputs := [(1, .railSupport)],
  time := 0.5
}
| .railSupportRecycling => {
  name := some "rail-support-recycling",
  inputs := [(1, .railSupport)],
  outputs := [(5, .refinedConcrete), (2, .steelPlate)],
  time := 0.03125
}
| .railgun => {
  name := some "railgun",
  inputs := [(10, .tungstenPlate), (10, .superconductor), (20, .quantumProcessor), (10, .fluoroketoneCold)],
  outputs := [(1, .railgun)],
  time := 10
}
| .railgunAmmo => {
  name := some "railgun-ammo",
  inputs := [(5, .steelPlate), (2, .explosives), (10, .copperCable)],
  outputs := [(1, .railgunAmmo)],
  time := 25
}
| .railgunAmmoRecycling => {
  name := some "railgun-ammo-recycling",
  inputs := [(1, .railgunAmmo)],
  outputs := [(1, .steelPlate), (2, .copperCable), (0, .explosives)],
  time := 1.5625
}
| .railgunRecycling => {
  name := some "railgun-recycling",
  inputs := [(1, .railgun)],
  outputs := [(2, .tungstenPlate), (2, .superconductor), (5, .quantumProcessor)],
  time := 0.625
}
| .railgunTurret => {
  name := some "railgun-turret",
  inputs := [(30, .tungstenPlate), (50, .superconductor), (20, .carbonFiber), (100, .quantumProcessor), (100, .fluoroketoneCold)],
  outputs := [(1, .railgunTurret)],
  time := 10
}
| .railgunTurretRecycling => {
  name := some "railgun-turret-recycling",
  inputs := [(1, .railgunTurret)],
  outputs := [(25, .quantumProcessor), (7, .tungstenPlate), (12, .superconductor), (5, .carbonFiber)],
  time := 0.625
}
| .rawFishRecycling => {
  name := some "raw-fish-recycling",
  inputs := [(1, .rawFish)],
  outputs := [(1, .rawFish)],
  time := 0.03125
}
| .recipeUnknown => {
  name := some "recipe-unknown",
  inputs := [],
  outputs := [],
  time := 0.5
}
| .recycler => {
  name := some "recycler",
  inputs := [(20, .steelPlate), (40, .ironGearWheel), (6, .processingUnit), (20, .concrete)],
  outputs := [(1, .recycler)],
  time := 3
}
| .recyclerRecycling => {
  name := some "recycler-recycling",
  inputs := [(1, .recycler)],
  outputs := [(1, .processingUnit), (5, .steelPlate), (10, .ironGearWheel), (5, .concrete)],
  time := 0.1875
}
| .refinedConcrete => {
  name := some "refined-concrete",
  inputs := [(1, .steelPlate), (8, .ironStick), (20, .concrete), (100, .water)],
  outputs := [(10, .refinedConcrete)],
  time := 15
}
| .refinedConcreteRecycling => {
  name := some "refined-concrete-recycling",
  inputs := [(1, .refinedConcrete)],
  outputs := [(0, .concrete), (0, .ironStick), (0, .steelPlate)],
  time := 0.9375
}
| .refinedHazardConcrete => {
  name := some "refined-hazard-concrete",
  inputs := [(10, .refinedConcrete)],
  outputs := [(10, .refinedHazardConcrete)],
  time := 0.25
}
| .refinedHazardConcreteRecycling => {
  name := some "refined-hazard-concrete-recycling",
  inputs := [(1, .refinedHazardConcrete)],
  outputs := [(0, .refinedConcrete)],
  time := 0.015625
}
| .repairPack => {
  name := some "repair-pack",
  inputs := [(2, .ironGearWheel), (2, .electronicCircuit)],
  outputs := [(1, .repairPack)],
  time := 0.5
}
| .repairPackRecycling => {
  name := some "repair-pack-recycling",
  inputs := [(1, .repairPack)],
  outputs := [(0, .electronicCircuit), (0, .ironGearWheel)],
  time := 0.03125
}
| .requesterChest => {
  name := some "requester-chest",
  inputs := [(3, .electronicCircuit), (1, .advancedCircuit), (1, .steelChest)],
  outputs := [(1, .requesterChest)],
  time := 0.5
}
| .requesterChestRecycling => {
  name := some "requester-chest-recycling",
  inputs := [(1, .requesterChest)],
  outputs := [(0, .steelChest), (0, .electronicCircuit), (0, .advancedCircuit)],
  time := 0.03125
}
| .roboport => {
  name := some "roboport",
  inputs := [(45, .steelPlate), (45, .ironGearWheel), (45, .advancedCircuit)],
  outputs := [(1, .roboport)],
  time := 5
}
| .roboportRecycling => {
  name := some "roboport-recycling",
  inputs := [(1, .roboport)],
  outputs := [(11, .steelPlate), (11, .ironGearWheel), (11, .advancedCircuit)],
  time := 0.3125
}
| .rocket => {
  name := some "rocket",
  inputs := [(2, .ironPlate), (1, .explosives)],
  outputs := [(1, .rocket)],
  time := 4
}
| .rocketFuel => {
  name := some "rocket-fuel",
  inputs := [(10, .solidFuel), (10, .lightOil)],
  outputs := [(1, .rocketFuel)],
  time := 15
}
| .rocketFuelFromJelly => {
  name := some "rocket-fuel-from-jelly",
  inputs := [(2, .bioflux), (30, .jelly), (30, .water)],
  outputs := [(1, .rocketFuel)],
  time := 10
}
| .rocketFuelRecycling => {
  name := some "rocket-fuel-recycling",
  inputs := [(1, .rocketFuel)],
  outputs := [(2, .solidFuel)],
  time := 0.9375
}
| .rocketLauncher => {
  name := some "rocket-launcher",
  inputs := [(5, .ironPlate), (5, .ironGearWheel), (5, .electronicCircuit)],
  outputs := [(1, .rocketLauncher)],
  time := 10
}
| .rocketLauncherRecycling => {
  name := some "rocket-launcher-recycling",
  inputs := [(1, .rocketLauncher)],
  outputs := [(1, .ironPlate), (1, .ironGearWheel), (1, .electronicCircuit)],
  time := 0.625
}
| .rocketPart => {
  name := some "rocket-part",
  inputs := [(1, .processingUnit), (1, .lowDensityStructure), (1, .rocketFuel)],
  outputs := [(1, .rocketPart)],
  time := 3
}
| .rocketRecycling => {
  name := some "rocket-recycling",
  inputs := [(1, .rocket)],
  outputs := [(0, .explosives), (0, .ironPlate)],
  time := 0.25
}
| .rocketSilo => {
  name := some "rocket-silo",
  inputs := [(1000, .steelPlate), (200, .processingUnit), (200, .electricEngineUnit), (100, .pipe), (1000, .concrete)],
  outputs := [(1, .rocketSilo)],
  time := 30
}
| .rocketSiloRecycling => {
  name := some "rocket-silo-recycling",
  inputs := [(1, .rocketSilo)],
  outputs := [(250, .steelPlate), (250, .concrete), (25, .pipe), (50, .processingUnit), (50, .electricEngineUnit)],
  time := 1.875
}
| .rocketTurret => {
  name := some "rocket-turret",
  inputs := [(20, .steelPlate), (20, .ironGearWheel), (4, .processingUnit), (20, .carbonFiber), (4, .rocketLauncher)],
  outputs := [(1, .rocketTurret)],
  time := 10
}
| .rocketTurretRecycling => {
  name := some "rocket-turret-recycling",
  inputs := [(1, .rocketTurret)],
  outputs := [(1, .rocketLauncher), (1, .processingUnit), (5, .carbonFiber), (5, .steelPlate), (5, .ironGearWheel)],
  time := 0.625
}
| .scienceRecycling => {
  name := some "science-recycling",
  inputs := [(1, .science)],
  outputs := [(1, .science)],
  time := 0.03125
}
| .scrapRecycling => {
  name := some "scrap-recycling",
  inputs := [(1, .scrap)],
  outputs := [(1, .ironGearWheel), (1, .solidFuel), (1, .concrete), (1, .ice), (1, .steelPlate), (1, .battery), (1, .stone), (1, .advancedCircuit), (1, .copperCable), (1, .processingUnit), (1, .lowDensityStructure), (1, .holmiumOre)],
  time := 0.2
}
| .selectionToolRecycling => {
  name := some "selection-tool-recycling",
  inputs := [(1, .selectionTool)],
  outputs := [(1, .selectionTool)],
  time := 0.03125
}
| .selectorCombinator => {
  name := some "selector-combinator",
  inputs := [(2, .advancedCircuit), (5, .deciderCombinator)],
  outputs := [(1, .selectorCombinator)],
  time := 0.5
}
| .selectorCombinatorRecycling => {
  name := some "selector-combinator-recycling",
  inputs := [(1, .selectorCombinator)],
  outputs := [(0, .advancedCircuit), (1, .deciderCombinator)],
  time := 0.03125
}
| .shotgun => {
  name := some "shotgun",
  inputs := [(5, .wood), (15, .ironPlate), (10, .copperPlate), (5, .ironGearWheel)],
  outputs := [(1, .shotgun)],
  time := 10
}
| .shotgunRecycling => {
  name := some "shotgun-recycling",
  inputs := [(1, .shotgun)],
  outputs := [(3, .ironPlate), (1, .ironGearWheel), (2, .copperPlate), (1, .wood)],
  time := 0.625
}
| .shotgunShell => {
  name := some "shotgun-shell",
  inputs := [(2, .ironPlate), (2, .copperPlate)],
  outputs := [(1, .shotgunShell)],
  time := 3
}
| .shotgunShellRecycling => {
  name := some "shotgun-shell-recycling",
  inputs := [(1, .shotgunShell)],
  outputs := [(0, .copperPlate), (0, .ironPlate)],
  time := 0.1875
}
| .simpleCoalLiquefaction => {
  name := some "simple-coal-liquefaction",
  inputs := [(10, .coal), (2, .calcite), (25, .sulfuricAcid)],
  outputs := [(50, .heavyOil)],
  time := 5
}
| .simpleEntityWithForceRecycling => {
  name := some "simple-entity-with-force-recycling",
  inputs := [(1, .simpleEntityWithForce)],
  outputs := [(1, .simpleEntityWithForce)],
  time := 0.03125
}
| .simpleEntityWithOwnerRecycling => {
  name := some "simple-entity-with-owner-recycling",
  inputs := [(1, .simpleEntityWithOwner)],
  outputs := [(1, .simpleEntityWithOwner)],
  time := 0.03125
}
| .slowdownCapsule => {
  name := some "slowdown-capsule",
  inputs := [(5, .coal), (2, .steelPlate), (2, .electronicCircuit)],
  outputs := [(1, .slowdownCapsule)],
  time := 8
}
| .slowdownCapsuleRecycling => {
  name := some "slowdown-capsule-recycling",
  inputs := [(1, .slowdownCapsule)],
  outputs := [(0, .steelPlate), (0, .electronicCircuit), (1, .coal)],
  time := 0.5
}
| .smallElectricPole => {
  name := some "small-electric-pole",
  inputs := [(1, .wood), (2, .copperCable)],
  outputs := [(2, .smallElectricPole)],
  time := 0.5
}
| .smallElectricPoleRecycling => {
  name := some "small-electric-pole-recycling",
  inputs := [(1, .smallElectricPole)],
  outputs := [(0, .wood), (0, .copperCable)],
  time := 0.03125
}
| .smallLamp => {
  name := some "small-lamp",
  inputs := [(1, .ironPlate), (3, .copperCable), (1, .electronicCircuit)],
  outputs := [(1, .smallLamp)],
  time := 0.5
}
| .smallLampRecycling => {
  name := some "small-lamp-recycling",
  inputs := [(1, .smallLamp)],
  outputs := [(0, .electronicCircuit), (0, .copperCable), (0, .ironPlate)],
  time := 0.03125
}
| .solarPanel => {
  name := some "solar-panel",
  inputs := [(5, .copperPlate), (5, .steelPlate), (15, .electronicCircuit)],
  outputs := [(1, .solarPanel)],
  time := 10
}
| .solarPanelEquipment => {
  name := some "solar-panel-equipment",
  inputs := [(5, .steelPlate), (2, .advancedCircuit), (1, .solarPanel)],
  outputs := [(1, .solarPanelEquipment)],
  time := 10
}
| .solarPanelEquipmentRecycling => {
  name := some "solar-panel-equipment-recycling",
  inputs := [(1, .solarPanelEquipment)],
  outputs := [(0, .solarPanel), (0, .advancedCircuit), (1, .steelPlate)],
  time := 0.625
}
| .solarPanelRecycling => {
  name := some "solar-panel-recycling",
  inputs := [(1, .solarPanel)],
  outputs := [(1, .steelPlate), (3, .electronicCircuit), (1, .copperPlate)],
  time := 0.625
}
| .solidFuelFromAmmonia => {
  name := some "solid-fuel-from-ammonia",
  inputs := [(15, .ammonia), (6, .crudeOil)],
  outputs := [(1, .solidFuel)],
  time := 0.5
}
| .solidFuelFromHeavyOil => {
  name := some "solid-fuel-from-heavy-oil",
  inputs := [(20, .heavyOil)],
  outputs := [(1, .solidFuel)],
  time := 1
}
| .solidFuelFromLightOil => {
  name := some "solid-fuel-from-light-oil",
  inputs := [(10, .lightOil)],
  outputs := [(1, .solidFuel)],
  time := 1
}
| .solidFuelFromPetroleumGas => {
  name := some "solid-fuel-from-petroleum-gas",
  inputs := [(20, .petroleumGas)],
  outputs := [(1, .solidFuel)],
  time := 1
}
| .solidFuelRecycling => {
  name := some "solid-fuel-recycling",
  inputs := [(1, .solidFuel)],
  outputs := [(1, .solidFuel)],
  time := 0.03125
}
| .spacePlatformFoundation => {
  name := some "space-platform-foundation",
  inputs := [(20, .steelPlate), (20, .copperCable)],
  outputs := [(1, .spacePlatformFoundation)],
  time := 10
}
| .spacePlatformFoundationRecycling => {
  name := some "space-platform-foundation-recycling",
  inputs := [(1, .spacePlatformFoundation)],
  outputs := [(5, .steelPlate), (5, .copperCable)],
  time := 0.625
}
| .spacePlatformHubRecycling => {
  name := some "space-platform-hub-recycling",
  inputs := [(1, .spacePlatformHub)],
  outputs := [(1, .spacePlatformHub)],
  time := 0.03125
}
| .spacePlatformStarterPack => {
  name := some "space-platform-starter-pack",
  inputs := [(20, .steelPlate), (20, .processingUnit), (60, .spacePlatformFoundation)],
  outputs := [(1, .spacePlatformStarterPack)],
  time := 60
}
| .spacePlatformStarterPackRecycling => {
  name := some "space-platform-starter-pack-recycling",
  inputs := [(1, .spacePlatformStarterPack)],
  outputs := [(15, .spacePlatformFoundation), (5, .steelPlate), (5, .processingUnit)],
  time := 3.75
}
| .spaceSciencePack => {
  name := some "space-science-pack",
  inputs := [(1, .ice), (2, .ironPlate), (1, .carbon)],
  outputs := [(5, .spaceSciencePack)],
  time := 15
}
| .spaceSciencePackRecycling => {
  name := some "space-science-pack-recycling",
  inputs := [(1, .spaceSciencePack)],
  outputs := [(1, .spaceSciencePack)],
  time := 0.9375
}
| .speedModule => {
  name := some "speed-module",
  inputs := [(5, .electronicCircuit), (5, .advancedCircuit)],
  outputs := [(1, .speedModule)],
  time := 15
}
| .speedModule2 => {
  name := some "speed-module-2",
  inputs := [(5, .advancedCircuit), (5, .processingUnit), (4, .speedModule)],
  outputs := [(1, .speedModule2)],
  time := 30
}
| .speedModule2Recycling => {
  name := some "speed-module-2-recycling",
  inputs := [(1, .speedModule2)],
  outputs := [(1, .speedModule), (1, .advancedCircuit), (1, .processingUnit)],
  time := 1.875
}
| .speedModule3 => {
  name := some "speed-module-3",
  inputs := [(5, .advancedCircuit), (5, .processingUnit), (1, .tungstenCarbide), (4, .speedModule2)],
  outputs := [(1, .speedModule3)],
  time := 60
}
| .speedModule3Recycling => {
  name := some "speed-module-3-recycling",
  inputs := [(1, .speedModule3)],
  outputs := [(1, .speedModule2), (1, .advancedCircuit), (1, .processingUnit), (0, .tungstenCarbide)],
  time := 3.75
}
| .speedModuleRecycling => {
  name := some "speed-module-recycling",
  inputs := [(1, .speedModule)],
  outputs := [(1, .advancedCircuit), (1, .electronicCircuit)],
  time := 0.9375
}
| .spidertron => {
  name := some "spidertron",
  inputs := [(1, .rawFish), (2, .fissionReactorEquipment), (4, .exoskeletonEquipment), (2, .radar), (1, .rocketTurret)],
  outputs := [(1, .spidertron)],
  time := 10
}
| .spidertronRecycling => {
  name := some "spidertron-recycling",
  inputs := [(1, .spidertron)],
  outputs := [(1, .exoskeletonEquipment), (0, .fissionReactorEquipment), (0, .rocketTurret), (0, .radar), (0, .rawFish)],
  time := 0.625
}
| .splitter => {
  name := some "splitter",
  inputs := [(5, .ironPlate), (5, .electronicCircuit), (4, .transportBelt)],
  outputs := [(1, .splitter)],
  time := 1
}
| .splitterRecycling => {
  name := some "splitter-recycling",
  inputs := [(1, .splitter)],
  outputs := [(1, .electronicCircuit), (1, .ironPlate), (1, .transportBelt)],
  time := 0.0625
}
| .spoilageRecycling => {
  name := some "spoilage-recycling",
  inputs := [(1, .spoilage)],
  outputs := [(1, .spoilage)],
  time := 0.03125
}
| .stackInserter => {
  name := some "stack-inserter",
  inputs := [(1, .processingUnit), (10, .jelly), (2, .carbonFiber), (1, .bulkInserter)],
  outputs := [(1, .stackInserter)],
  time := 0.5
}
| .stackInserterRecycling => {
  name := some "stack-inserter-recycling",
  inputs := [(1, .stackInserter)],
  outputs := [(0, .bulkInserter), (0, .processingUnit), (0, .carbonFiber), (2, .jelly)],
  time := 0.03125
}
| .steamCondensation => {
  name := some "steam-condensation",
  inputs := [(1000, .steam)],
  outputs := [(90, .water)],
  time := 1
}
| .steamEngine => {
  name := some "steam-engine",
  inputs := [(10, .ironPlate), (8, .ironGearWheel), (5, .pipe)],
  outputs := [(1, .steamEngine)],
  time := 0.5
}
| .steamEngineRecycling => {
  name := some "steam-engine-recycling",
  inputs := [(1, .steamEngine)],
  outputs := [(2, .ironGearWheel), (1, .pipe), (2, .ironPlate)],
  time := 0.03125
}
| .steamTurbine => {
  name := some "steam-turbine",
  inputs := [(50, .copperPlate), (50, .ironGearWheel), (20, .pipe)],
  outputs := [(1, .steamTurbine)],
  time := 3
}
| .steamTurbineRecycling => {
  name := some "steam-turbine-recycling",
  inputs := [(1, .steamTurbine)],
  outputs := [(12, .ironGearWheel), (12, .copperPlate), (5, .pipe)],
  time := 0.1875
}
| .steelChest => {
  name := some "steel-chest",
  inputs := [(8, .steelPlate)],
  outputs := [(1, .steelChest)],
  time := 0.5
}
| .steelChestRecycling => {
  name := some "steel-chest-recycling",
  inputs := [(1, .steelChest)],
  outputs := [(2, .steelPlate)],
  time := 0.03125
}
| .steelFurnace => {
  name := some "steel-furnace",
  inputs := [(6, .steelPlate), (10, .stoneBrick)],
  outputs := [(1, .steelFurnace)],
  time := 3
}
| .steelFurnaceRecycling => {
  name := some "steel-furnace-recycling",
  inputs := [(1, .steelFurnace)],
  outputs := [(1, .steelPlate), (2, .stoneBrick)],
  time := 0.1875
}
| .steelPlate => {
  name := some "steel-plate",
  inputs := [(5, .ironPlate)],
  outputs := [(1, .steelPlate)],
  time := 16
}
| .steelPlateRecycling => {
  name := some "steel-plate-recycling",
  inputs := [(1, .steelPlate)],
  outputs := [(1, .steelPlate)],
  time := 1
}
| .stoneBrick => {
  name := some "stone-brick",
  inputs := [(2, .stone)],
  outputs := [(1, .stoneBrick)],
  time := 3.2
}
| .stoneBrickRecycling => {
  name := some "stone-brick-recycling",
  inputs := [(1, .stoneBrick)],
  outputs := [(1, .stoneBrick)],
  time := 0.2
}
| .stoneFurnace => {
  name := some "stone-furnace",
  inputs := [(5, .stone)],
  outputs := [(1, .stoneFurnace)],
  time := 0.5
}
| .stoneFurnaceRecycling => {
  name := some "stone-furnace-recycling",
  inputs := [(1, .stoneFurnace)],
  outputs := [(1, .stone)],
  time := 0.03125
}
| .stoneRecycling => {
  name := some "stone-recycling",
  inputs := [(1, .stone)],
  outputs := [(1, .stone)],
  time := 0.03125
}
| .stoneWall => {
  name := some "stone-wall",
  inputs := [(5, .stoneBrick)],
  outputs := [(1, .stoneWall)],
  time := 0.5
}
| .stoneWallRecycling => {
  name := some "stone-wall-recycling",
  inputs := [(1, .stoneWall)],
  outputs := [(1, .stoneBrick)],
  time := 0.03125
}
| .storageChest => {
  name := some "storage-chest",
  inputs := [(3, .electronicCircuit), (1, .advancedCircuit), (1, .steelChest)],
  outputs := [(1, .storageChest)],
  time := 0.5
}
| .storageChestRecycling => {
  name := some "storage-chest-recycling",
  inputs := [(1, .storageChest)],
  outputs := [(0, .steelChest), (0, .electronicCircuit), (0, .advancedCircuit)],
  time := 0.03125
}
| .storageTank => {
  name := some "storage-tank",
  inputs := [(20, .ironPlate), (5, .steelPlate)],
  outputs := [(1, .storageTank)],
  time := 3
}
| .storageTankRecycling => {
  name := some "storage-tank-recycling",
  inputs := [(1, .storageTank)],
  outputs := [(5, .ironPlate), (1, .steelPlate)],
  time := 0.1875
}
| .submachineGun => {
  name := some "submachine-gun",
  inputs := [(10, .ironPlate), (5, .copperPlate), (10, .ironGearWheel)],
  outputs := [(1, .submachineGun)],
  time := 10
}
| .submachineGunRecycling => {
  name := some "submachine-gun-recycling",
  inputs := [(1, .submachineGun)],
  outputs := [(2, .ironGearWheel), (1, .copperPlate), (2, .ironPlate)],
  time := 0.625
}
| .substation => {
  name := some "substation",
  inputs := [(10, .steelPlate), (6, .copperCable), (5, .advancedCircuit)],
  outputs := [(1, .substation)],
  time := 0.5
}
| .substationRecycling => {
  name := some "substation-recycling",
  inputs := [(1, .substation)],
  outputs := [(2, .steelPlate), (1, .advancedCircuit), (1, .copperCable)],
  time := 0.03125
}
| .sulfur => {
  name := some "sulfur",
  inputs := [(30, .water), (30, .petroleumGas)],
  outputs := [(2, .sulfur)],
  time := 1
}
| .sulfurRecycling => {
  name := some "sulfur-recycling",
  inputs := [(1, .sulfur)],
  outputs := [(1, .sulfur)],
  time := 0.0625
}
| .sulfuricAcid => {
  name := some "sulfuric-acid",
  inputs := [(1, .ironPlate), (5, .sulfur), (100, .water)],
  outputs := [(50, .sulfuricAcid)],
  time := 1
}
| .sulfuricAcidBarrel => {
  name := some "sulfuric-acid-barrel",
  inputs := [(1, .barrel), (50, .sulfuricAcid)],
  outputs := [(1, .sulfuricAcidBarrel)],
  time := 0.2
}
| .sulfuricAcidBarrelRecycling => {
  name := some "sulfuric-acid-barrel-recycling",
  inputs := [(1, .sulfuricAcidBarrel)],
  outputs := [(0, .barrel)],
  time := 0.0125
}
| .supercapacitor => {
  name := some "supercapacitor",
  inputs := [(1, .battery), (4, .electronicCircuit), (2, .holmiumPlate), (2, .superconductor), (10, .electrolyte)],
  outputs := [(1, .supercapacitor)],
  time := 10
}
| .supercapacitorRecycling => {
  name := some "supercapacitor-recycling",
  inputs := [(1, .supercapacitor)],
  outputs := [(0, .holmiumPlate), (0, .superconductor), (1, .electronicCircuit), (0, .battery)],
  time := 0.625
}
| .superconductor => {
  name := some "superconductor",
  inputs := [(1, .copperPlate), (1, .plasticBar), (1, .holmiumPlate), (5, .lightOil)],
  outputs := [(2, .superconductor)],
  time := 5
}
| .superconductorRecycling => {
  name := some "superconductor-recycling",
  inputs := [(1, .superconductor)],
  outputs := [(1, .superconductor)],
  time := 0.3125
}
| .tank => {
  name := some "tank",
  inputs := [(50, .steelPlate), (15, .ironGearWheel), (10, .advancedCircuit), (32, .engineUnit)],
  outputs := [(1, .tank)],
  time := 5
}
| .tankRecycling => {
  name := some "tank-recycling",
  inputs := [(1, .tank)],
  outputs := [(8, .engineUnit), (12, .steelPlate), (3, .ironGearWheel), (2, .advancedCircuit)],
  time := 0.3125
}
| .teslaAmmo => {
  name := some "tesla-ammo",
  inputs := [(1, .plasticBar), (1, .supercapacitor), (10, .electrolyte)],
  outputs := [(1, .teslaAmmo)],
  time := 30
}
| .teslaAmmoRecycling => {
  name := some "tesla-ammo-recycling",
  inputs := [(1, .teslaAmmo)],
  outputs := [(0, .supercapacitor), (0, .plasticBar)],
  time := 1.875
}
| .teslaTurret => {
  name := some "tesla-turret",
  inputs := [(10, .processingUnit), (50, .superconductor), (10, .supercapacitor), (1, .teslagun), (500, .electrolyte)],
  outputs := [(1, .teslaTurret)],
  time := 30
}
| .teslaTurretRecycling => {
  name := some "tesla-turret-recycling",
  inputs := [(1, .teslaTurret)],
  outputs := [(0, .teslagun), (2, .supercapacitor), (2, .processingUnit), (12, .superconductor)],
  time := 1.875
}
| .teslagun => {
  name := some "teslagun",
  inputs := [(30, .plasticBar), (10, .holmiumPlate), (10, .superconductor), (100, .electrolyte)],
  outputs := [(1, .teslagun)],
  time := 30
}
| .teslagunRecycling => {
  name := some "teslagun-recycling",
  inputs := [(1, .teslagun)],
  outputs := [(2, .holmiumPlate), (2, .superconductor), (7, .plasticBar)],
  time := 1.875
}
| .thruster => {
  name := some "thruster",
  inputs := [(10, .steelPlate), (10, .processingUnit), (5, .electricEngineUnit)],
  outputs := [(1, .thruster)],
  time := 10
}
| .thrusterFuel => {
  name := some "thruster-fuel",
  inputs := [(2, .carbon), (10, .water)],
  outputs := [(75, .thrusterFuel)],
  time := 2
}
| .thrusterOxidizer => {
  name := some "thruster-oxidizer",
  inputs := [(2, .ironOre), (10, .water)],
  outputs := [(75, .thrusterOxidizer)],
  time := 2
}
| .thrusterRecycling => {
  name := some "thruster-recycling",
  inputs := [(1, .thruster)],
  outputs := [(2, .steelPlate), (2, .processingUnit), (1, .electricEngineUnit)],
  time := 0.625
}
| .toolbeltEquipment => {
  name := some "toolbelt-equipment",
  inputs := [(3, .advancedCircuit), (10, .carbonFiber)],
  outputs := [(1, .toolbeltEquipment)],
  time := 10
}
| .toolbeltEquipmentRecycling => {
  name := some "toolbelt-equipment-recycling",
  inputs := [(1, .toolbeltEquipment)],
  outputs := [(0, .advancedCircuit), (2, .carbonFiber)],
  time := 0.625
}
| .topUpValveRecycling => {
  name := some "top-up-valve-recycling",
  inputs := [(1, .topUpValve)],
  outputs := [(1, .topUpValve)],
  time := 0.03125
}
| .trainStop => {
  name := some "train-stop",
  inputs := [(6, .ironPlate), (3, .steelPlate), (6, .ironStick), (5, .electronicCircuit)],
  outputs := [(1, .trainStop)],
  time := 0.5
}
| .trainStopRecycling => {
  name := some "train-stop-recycling",
  inputs := [(1, .trainStop)],
  outputs := [(1, .electronicCircuit), (1, .ironPlate), (1, .ironStick), (0, .steelPlate)],
  time := 0.03125
}
| .transportBelt => {
  name := some "transport-belt",
  inputs := [(1, .ironPlate), (1, .ironGearWheel)],
  outputs := [(2, .transportBelt)],
  time := 0.5
}
| .transportBeltRecycling => {
  name := some "transport-belt-recycling",
  inputs := [(1, .transportBelt)],
  outputs := [(0, .ironPlate), (0, .ironGearWheel)],
  time := 0.03125
}
| .treeSeedRecycling => {
  name := some "tree-seed-recycling",
  inputs := [(1, .treeSeed)],
  outputs := [(1, .treeSeed)],
  time := 0.03125
}
| .tungstenCarbide => {
  name := some "tungsten-carbide",
  inputs := [(1, .carbon), (2, .tungstenOre), (10, .sulfuricAcid)],
  outputs := [(1, .tungstenCarbide)],
  time := 1
}
| .tungstenCarbideRecycling => {
  name := some "tungsten-carbide-recycling",
  inputs := [(1, .tungstenCarbide)],
  outputs := [(1, .tungstenCarbide)],
  time := 0.0625
}
| .tungstenOreRecycling => {
  name := some "tungsten-ore-recycling",
  inputs := [(1, .tungstenOre)],
  outputs := [(1, .tungstenOre)],
  time := 0.03125
}
| .tungstenPlate => {
  name := some "tungsten-plate",
  inputs := [(4, .tungstenOre), (10, .moltenIron)],
  outputs := [(1, .tungstenPlate)],
  time := 10
}
| .tungstenPlateRecycling => {
  name := some "tungsten-plate-recycling",
  inputs := [(1, .tungstenPlate)],
  outputs := [(1, .tungstenPlate)],
  time := 0.625
}
| .turboLoader => {
  name := some "turbo-loader",
  inputs := [(5, .turboTransportBelt), (1, .expressLoader)],
  outputs := [(1, .turboLoader)],
  time := 20
}
| .turboLoaderRecycling => {
  name := some "turbo-loader-recycling",
  inputs := [(1, .turboLoader)],
  outputs := [(1, .turboTransportBelt), (0, .expressLoader)],
  time := 1.25
}
| .turboSplitter => {
  name := some "turbo-splitter",
  inputs := [(2, .processingUnit), (15, .tungstenPlate), (1, .expressSplitter), (80, .lubricant)],
  outputs := [(1, .turboSplitter)],
  time := 2
}
| .turboSplitterRecycling => {
  name := some "turbo-splitter-recycling",
  inputs := [(1, .turboSplitter)],
  outputs := [(0, .expressSplitter), (3, .tungstenPlate), (0, .processingUnit)],
  time := 0.125
}
| .turboTransportBelt => {
  name := some "turbo-transport-belt",
  inputs := [(5, .tungstenPlate), (1, .expressTransportBelt), (20, .lubricant)],
  outputs := [(1, .turboTransportBelt)],
  time := 0.5
}
| .turboTransportBeltRecycling => {
  name := some "turbo-transport-belt-recycling",
  inputs := [(1, .turboTransportBelt)],
  outputs := [(1, .tungstenPlate), (0, .expressTransportBelt)],
  time := 0.03125
}
| .turboUndergroundBelt => {
  name := some "turbo-underground-belt",
  inputs := [(40, .tungstenPlate), (2, .expressUndergroundBelt), (40, .lubricant)],
  outputs := [(2, .turboUndergroundBelt)],
  time := 2
}
| .turboUndergroundBeltRecycling => {
  name := some "turbo-underground-belt-recycling",
  inputs := [(1, .turboUndergroundBelt)],
  outputs := [(5, .tungstenPlate), (0, .expressUndergroundBelt)],
  time := 0.125
}
| .undergroundBelt => {
  name := some "underground-belt",
  inputs := [(10, .ironPlate), (5, .transportBelt)],
  outputs := [(2, .undergroundBelt)],
  time := 1
}
| .undergroundBeltRecycling => {
  name := some "underground-belt-recycling",
  inputs := [(1, .undergroundBelt)],
  outputs := [(1, .ironPlate), (0, .transportBelt)],
  time := 0.0625
}
| .upgradePlannerRecycling => {
  name := some "upgrade-planner-recycling",
  inputs := [(1, .upgradePlanner)],
  outputs := [(1, .upgradePlanner)],
  time := 0.03125
}
| .uranium235Recycling => {
  name := some "uranium-235-recycling",
  inputs := [(1, .uranium235)],
  outputs := [(1, .uranium235)],
  time := 0.03125
}
| .uranium238Recycling => {
  name := some "uranium-238-recycling",
  inputs := [(1, .uranium238)],
  outputs := [(1, .uranium238)],
  time := 0.03125
}
| .uraniumCannonShell => {
  name := some "uranium-cannon-shell",
  inputs := [(1, .uranium238), (1, .cannonShell)],
  outputs := [(1, .uraniumCannonShell)],
  time := 12
}
| .uraniumCannonShellRecycling => {
  name := some "uranium-cannon-shell-recycling",
  inputs := [(1, .uraniumCannonShell)],
  outputs := [(0, .cannonShell), (0, .uranium238)],
  time := 0.75
}
| .uraniumFuelCell => {
  name := some "uranium-fuel-cell",
  inputs := [(10, .ironPlate), (1, .uranium235), (19, .uranium238)],
  outputs := [(10, .uraniumFuelCell)],
  time := 10
}
| .uraniumFuelCellRecycling => {
  name := some "uranium-fuel-cell-recycling",
  inputs := [(1, .uraniumFuelCell)],
  outputs := [(1, .uraniumFuelCell)],
  time := 0.625
}
| .uraniumOreRecycling => {
  name := some "uranium-ore-recycling",
  inputs := [(1, .uraniumOre)],
  outputs := [(1, .uraniumOre)],
  time := 0.03125
}
| .uraniumProcessing => {
  name := some "uranium-processing",
  inputs := [(10, .uraniumOre)],
  outputs := [(1, .uranium235), (1, .uranium238)],
  time := 12
}
| .uraniumRoundsMagazine => {
  name := some "uranium-rounds-magazine",
  inputs := [(1, .uranium238), (1, .piercingRoundsMagazine)],
  outputs := [(1, .uraniumRoundsMagazine)],
  time := 10
}
| .uraniumRoundsMagazineRecycling => {
  name := some "uranium-rounds-magazine-recycling",
  inputs := [(1, .uraniumRoundsMagazine)],
  outputs := [(0, .piercingRoundsMagazine), (0, .uranium238)],
  time := 0.625
}
| .utilitySciencePack => {
  name := some "utility-science-pack",
  inputs := [(2, .processingUnit), (1, .flyingRobotFrame), (3, .lowDensityStructure)],
  outputs := [(3, .utilitySciencePack)],
  time := 21
}
| .utilitySciencePackRecycling => {
  name := some "utility-science-pack-recycling",
  inputs := [(1, .utilitySciencePack)],
  outputs := [(1, .utilitySciencePack)],
  time := 1.3125
}
| .waterBarrel => {
  name := some "water-barrel",
  inputs := [(1, .barrel), (50, .water)],
  outputs := [(1, .waterBarrel)],
  time := 0.2
}
| .waterBarrelRecycling => {
  name := some "water-barrel-recycling",
  inputs := [(1, .waterBarrel)],
  outputs := [(0, .barrel)],
  time := 0.0125
}
| .woodProcessing => {
  name := some "wood-processing",
  inputs := [(2, .wood)],
  outputs := [(1, .treeSeed)],
  time := 2
}
| .woodRecycling => {
  name := some "wood-recycling",
  inputs := [(1, .wood)],
  outputs := [(1, .wood)],
  time := 0.03125
}
| .woodenChest => {
  name := some "wooden-chest",
  inputs := [(2, .wood)],
  outputs := [(1, .woodenChest)],
  time := 0.5
}
| .woodenChestRecycling => {
  name := some "wooden-chest-recycling",
  inputs := [(1, .woodenChest)],
  outputs := [(0, .wood)],
  time := 0.03125
}
| .yumakoMashRecycling => {
  name := some "yumako-mash-recycling",
  inputs := [(1, .yumakoMash)],
  outputs := [(1, .yumakoMash)],
  time := 0.03125
}
| .yumakoProcessing => {
  name := some "yumako-processing",
  inputs := [(1, .yumako)],
  outputs := [(1, .yumakoSeed), (2, .yumakoMash)],
  time := 1
}
| .yumakoRecycling => {
  name := some "yumako-recycling",
  inputs := [(1, .yumako)],
  outputs := [(1, .yumako)],
  time := 0.03125
}
| .yumakoSeedRecycling => {
  name := some "yumako-seed-recycling",
  inputs := [(1, .yumakoSeed)],
  outputs := [(1, .yumakoSeed)],
  time := 0.03125
}
