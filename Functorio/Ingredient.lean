inductive Ingredient
  -- Ores
  | copperOre
  | ironOre
  | coal
  | stone
  | uraniumOre

  -- Furnace products
  | copperPlate
  | ironPlate
  | steelPlate
  | stoneBrick

  -- Liquids
  | crudeOil
  | water
  | sulfuricAcid
  | petroleumGas
  | lightOil
  | heavyOil
  | lubricant

  -- Intermediate products
  | ironGearWheel
  | copperCable
  | solidFuel
  | plasticBar
  | sulfur
  | ironStick
  | electronicCircuit -- green
  | advancedCircuit   -- red
  | processingUnit    -- blue
  | battery
  | engineUnit
  | electricEngineUnit
  | flyingRobotFrame
  | lowDensityStructure
  | rocketFuel

  -- Buildings
  | inserter
  | transportBelt
  | pipe
  | rail
  | electricFurnace
  | productivityModule

  -- Military
  | firearmMagazine        -- yellow
  | piercingRoundsMagazine -- red
  | grenade
  | stoneWall

  -- Science Packs
  | automationSciencePack  -- red
  | logisticSciencePack    -- green
  | chemicalSciencePack    -- blue
  | militarySciencePack    -- black
  | productionSciencePack  -- purple
  | utilitySciencePack     -- yellow

  -- Aquilo
  | ammoniacalSolution
  | ammonia
  | ice
  | icePlatform
  | lithium
  | lithiumPlate
  | lithiumBrine
  | holmiumPlate
  | fluorine
  | coldFluoroketone
  | hotFluoroketone
  | cryogenicSciencePack
  deriving DecidableEq, Repr

instance : Inhabited Ingredient where
  default := .coal

namespace Ingredient

def isLiquid (i:Ingredient) : Bool :=
  match i with
  | .crudeOil
  | .water
  | .sulfuricAcid
  | .petroleumGas
  | .lightOil
  | .heavyOil
  | .lubricant
  | .ammoniacalSolution
  | .ammonia
  | .lithiumBrine
  | .fluorine
  | .coldFluoroketone
  | .hotFluoroketone => true
  | _ => false

end Ingredient
