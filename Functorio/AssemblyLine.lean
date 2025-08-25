import Functorio.Entity
import Functorio.Factory
import Functorio.Crop
import Functorio.Recipe
import Functorio.Row
import Functorio.Bus
import Functorio.Cap
import Functorio.Fraction
import Functorio.Util
import Functorio.Config

namespace RecipeName

@[simp]
def speedUp (recipeName:RecipeName) : Fraction :=
  match recipeName.getRecipe.category with
  -- chemical plant
  | .chemistry
  | .organicOrChemistry
  | .chemistryOrCryogenics => 1

  -- assembly machine 3
  | .crafting
  | .advancedCrafting
  | .craftingWithFluid
  | .craftingWithFluidOrMetallurgy
  | .electronics
  | .electronicsOrAssembling
  | .electronicsWithFluid
  | .metallurgyOrAssembling
  | .organicOrAssembling
  | .pressing
  | .cryogenicsOrAssembling => 5/4

  -- refinery
  | .oilProcessing => 1

  -- rocket silo
  | .rocketBuilding => 1

  -- electric furnance
  | .smelting => 2

  | .captiveSpawnerProcess
  | .centrifuging
  | .crushing
  | .cryogenics
  | .electromagnetics
  | .metallurgy
  | .organic
  | .organicOrHandCrafting
  | .parameters
  | .recycling
  | .recyclingOrHandCrafting => error! s!"recipeName speedup not yet defined {reprStr recipeName}"

end RecipeName

private inductive LeftPipes
| none
| top : Ingredient -> LeftPipes
| middle : Ingredient -> LeftPipes
| topAndBottom : Ingredient -> Ingredient -> LeftPipes

private def interfaceNS (inputs:List Ingredient) (outputs:List Ingredient) : List InterfaceV :=
  (inputs.map (., .N)) ++ (outputs.map (.,.S))

private def interfaceE (rightPipe : Option Ingredient := .none) : List InterfaceH :=
  match rightPipe with
  | .none => []
  | .some i => [(i, .E)]

private def interfaceW  (leftPipes: LeftPipes:= .none) : List InterfaceH :=
  match leftPipes with
  | .none => []
  | .top i => [(i,.E)]
  | .middle i => [(i,.E)]
  | .topAndBottom i j => [(i,.E), (j,.E)]

private def beltline (x:Nat) (dir:Direction) (height:Nat) : List Entity :=
  (List.range height).map (fun y => belt x y dir)

abbrev Station ns (e w := []) := Factory ns e ns w

private def stationWithoutPipes (fabricator : Fabricator) (inputs:List Ingredient) (outputs:List Ingredient)
  (leftPipes: LeftPipes:= .none) (rightPipe : Option Ingredient := .none)
  : Station (interfaceNS inputs outputs) (interfaceE rightPipe) (interfaceW leftPipes)  :=

  let fabricator := fabricator 3 0
  let size := fabricator.width

  let inputLen := inputs.length
  let outputLen := outputs.length

  if inputLen > 3 then error! "cannot use more than 3 belt inputs" else
  if outputLen > 2 then error! "cannot use more than 2 belt outputs" else
  if outputLen == 2 && inputLen == 3 then error! "2 belt outputs cannot be combined with 3 belt inputs" else

  let inFarLeft    := beltline (x:=0) (height:=size+1) .N
  let inNearLeft   := beltline (x:=1) (height:=size+1) .N

  let inNearRight  := beltline (x:=size+4) (height:=size+1) .N ++ [inserter (size+3) 2 .E]
  let outNearRight := beltline (x:=size+4) (height:=size+1) .S ++ [inserter (size+3) 2 .W]
  let outFarRight  := beltline (x:=size+5) (height:=size+1) .S ++ [longInserter (size+3) 1 .W]

  let leftPipeEntities : List Entity :=
    match leftPipes with
    | .none => []
    | .top _ => [pipeToGround 2 0 .E]
    | .middle _ => [pipeToGround 2 1 .E]
    | .topAndBottom _ _ => [pipeToGround 2 0 .E, pipeToGround 2 2 .E]

  let rightPipeEntities :=
    if rightPipe.isNone then [] else [pipeToGround (size+3) 0 .W]

  let leftInserters : List Entity :=
    match leftPipes, inputLen with
    | .topAndBottom _ _, 0 => []
    | .topAndBottom _ _, 1 => [inserter 2 1 .W]
    | .topAndBottom _ _, _ => error! s!"cannot use two left pipes and more than 1 input {reprStr outputs}"
    | .middle _, 0 => []
    | .middle _, 1 => [inserter 2 2 .W]
    | .middle _, _ => [inserter 2 2 .W, longInserter 2 0 .W]
    | _, 0 => []
    | _, 1 => [inserter 2 2 .W]
    | _, _ => [inserter 2 2 .W, longInserter 2 1 .W]

  let interfaceNS : List InterfaceImpl :=[
     -- inputs belts
     if inputLen > 1 then [0] else [],
     if inputLen > 0 then [1] else [],
     if inputLen > 2 then [(size+4)] else [],

    -- output belts
    match outputs.length with
    | 0 => []
    | 1 => if inputLen > 2 then [(size+5)] else [(size+4)]
    | _ => [size+4, size+5]
  ].flatten

  let interfaceE : List InterfaceImpl := if rightPipe.isNone then [] else [0]
  let interfaceW : List InterfaceImpl := match leftPipes with
  | .none => []
  | .top _ => [0]
  | .middle _ => [1]
  | .topAndBottom _ _ => [0,2]

  crop {
    width:= size + 6,
    height:= size + 1,
    entities := [
        [fabricator, pole (3 + size/2) size],
        -- input belts
        if inputLen > 0 then inNearLeft else [],
        if inputLen > 1 then inFarLeft else [],
        if inputLen > 2 then inNearRight else [],

        -- output belts
        match outputs.length with
        | 0 => []
        | 1 => if inputLen > 2 then outFarRight else outNearRight
        | _ => outFarRight ++ outNearRight,

        -- access
        leftInserters,
        leftPipeEntities,
        rightPipeEntities
      ].flatten,
    interface := {
      n := interfaceNS.castToVector!
      e := interfaceE.castToVector!
      s := interfaceNS.castToVector!
      w := interfaceW.castToVector!
    }
    name := s!"stationWithoutPipes {reprStr outputs}"
  }

private def poweredChemicalPlant (recipe : String) (pipesIn:List Ingredient) (pipesOut:List Ingredient) (mirror:=false)
: Station [] (pipesOut.map (.,.E)) (pipesIn.map (.,.E))
:=
  let interfaceE := pipesOut.toVector.mapIdx fun i _ => (2*i+1 : InterfaceImpl)
  let interfaceW := pipesIn.toVector.mapIdx fun i _ => (2*i+1 : InterfaceImpl)

  {
    width:= 3,
    height:= 5,
    entities := [
      chemicalPlant recipe 0 1 mirror,
      pole 1 4
    ],
    interface := {
      n := #v[]
      e := cast (by simp) interfaceE
      s := #v[]
      w := cast (by simp) interfaceW
    }
    name := s!"chemicalPlant {recipe}"
  }

private def poweredRefinery : Station []
[(.heavyOil,.E), (.lightOil,.E), (.petroleumGas, .E)] [(.water,.E), (.crudeOil,.E)] :=
 {
    width:= 5,
    height:= 7,
    entities := [
      refinery RecipeName.advancedOilProcessing.getRecipe.name.get! 0 1 (mirror:=true),
      pole 2 6
    ],
    interface := {
      n := #v[]
      e := #v[1,3,5]
      s := #v[]
      w := #v[2,4]
    }
    name := "advancedOilProcessing"
  }

-- Special case, because it takes 4 inputs.
private def flyingRobotFrameStation : Station [(.steelPlate,.N), (.battery,.N), (.electronicCircuit,.N), (.electricEngineUnit,.N), (.flyingRobotFrame,.S)] :=
  let entities : List Entity :=
    beltline (x:=0) (height:=4) .N ++
    beltline (x:=1) (height:=4) .N ++
    [
      beltUp 2 0 .N,
      longInserter 2 1 .W,
      beltDown 2 2 .N,
      belt 2 3 .N,

      longInserter 3 0 .W,
      inserter 3 2 .W,

      assembler RecipeName.flyingRobotFrame.getRecipe.name.get! 4 0,
      pole 5 3,

      longInserter 7 1 .W,
      inserter 7 2 .E
    ] ++
    beltline (x:=8) (height:=4) .N ++
    beltline (x:=9) (height:=4) .S

  {
    width:= 10, height:= 4, entities := entities
    interface := {
      n := #v[0,1,2,8,9]
      e := #v[]
      s := #v[0,1,2,8,9]
      w := #v[]
    }
    name := "flyingRobotFrame"
  }

-- Special case, because it needs extra inserters to handle the speed.
def railStation : Station [(.stone,.N), (.steelPlate,.N), (.ironStick,.N), (.rail, .S)] :=
  let recipe := RecipeName.rail.getRecipe
  let fabricator := assembler recipe.name.get!
  let factory := stationWithoutPipes fabricator (recipe.inputs.map Prod.snd) (recipe.outputs.map Prod.snd)
  -- Needs two output inserters to keep up with the production rate.
  {factory with
    entities := factory.entities.append [
      longInserter 6 0 .W
    ]
  }

-- Special case, because it has no belt inputs, so taking the pipes underground looks bad
private def sulfurStation : Station [(.sulfur,.S)] [] [(.water,.E), (.petroleumGas, .E)] :=
  let entities : List Entity :=
    beltline (x:=4) (height:=4) .S ++
    [
      inserter 3 2 .W,
      chemicalPlant RecipeName.sulfur.getRecipe.name.get! 0 0 (mirror:=true),
      pole 1 3,
    ]

  {
    width:=5, height:=4, entities := entities
    interface := {
      n := #v[4]
      e := #v[]
      s := #v[4]
      w := #v[0,2]
    }
    name := "sulfur"
  }

-- Special case, because it has no belt inputs, so taking the pipes underground looks bad
private def solidFuelFromLightOilStation : Station [(.solidFuel,.S)] [] [(.lightOil, .E)] :=
  let entities : List Entity :=
    beltline (x:=4) (height:=4) .S ++
    [
      inserter 3 2 .W,
      chemicalPlant RecipeName.solidFuelFromLightOil.getRecipe.name.get! 0 0,
      pole 1 3,
    ]

  {
    width:=5, height:=4, entities := entities
    interface := {
      n := #v[4]
      e := #v[]
      s := #v[4]
      w := #v[0]
    }
    name := "solidFuelFromLightOil"
  }

-- Special case, because it has no belt outputs, so taking the pipes underground looks bad
private def sulfuricAcidStation : Station [(.ironPlate,.N),(.sulfur,.N)] [(.sulfuricAcid,.E)] [(.water,.E)] :=
  let entities : List Entity :=
    beltline (x:=0) (height:=4) .N ++
    beltline (x:=1) (height:=4) .N ++
    [
      pipeToGround 2 0 .E,
      longInserter 2 1 .W,
      inserter 2 2 .W,
      chemicalPlant RecipeName.sulfuricAcid.getRecipe.name.get! 3 0,
      pole 4 3,
    ]

  {
    width:=6, height:=4, entities := entities
    interface := {
      n := #v[0,1]
      e := #v[0]
      s := #v[0,1]
      w := #v[0]
    }
    name := "sulfuricAcid"
  }

private def pipesIn (ingredients:List Ingredient) (underground:Bool := false)
: Factory (ingredients.map (.,.N)) (ingredients.map (.,.E)) (ingredients.map (.,.N)) []
:=
  let pipes := ingredients.length
  let width := pipes * 2 + 1
  let height := pipes * 2 - 1

  let pipelines : List Entity :=
    (List.range pipes).flatMap fun i =>
      (List.range height).map fun y =>
        let x := i * 2 + 1
        pipe x y

  let goDown : List Entity :=
    (List.range pipes).map fun i =>
      let x := 2 * i + 2
      let y := 2 * i

      if i == pipes - 1 && !underground
      then pipe x y
      else pipeToGround x y .W

  let comeUp : List Entity :=
    (List.range pipes).flatMap fun i =>
      let x := 2 * pipes
      let y := 2 * i

      if i == pipes - 1 || underground
      then []
      else [pipeToGround x y .E]

  let interfaceNS := ingredients.toVector.mapIdx fun i _ => (i * 2 + 1 : InterfaceImpl)
  let interfaceE := ingredients.toVector.mapIdx fun i _ => (i * 2 : InterfaceImpl)

  {
    width := width
    height := height
    entities := pipelines ++ goDown ++ comeUp
    interface := {
      n := cast (by simp) interfaceNS
      e := cast (by simp) interfaceE
      s := cast (by simp) interfaceNS
      w := #v[]
    }
    name := s!"pipesIn {reprStr ingredients}"
  }

private def pipesOut (ingredients:List Ingredient)
: Factory (ingredients.map (.,.S)) [] (ingredients.map (.,.S)) (ingredients.map (.,.E))
:=
  let pipes := ingredients.length
  let width := pipes * 2 + 1
  let height := pipes * 2 - 1

  let pipelines : List Entity :=
    (List.range pipes).flatMap fun i =>
      (List.range height).map fun y =>
        let x := i * 2 + 1
        pipe x y

  let goDown : List Entity :=
    (List.range pipes).map fun i =>
      let x := 2 * i
      let y := 2 * i

      if i == 0
      then pipe x y
      else pipeToGround x y .E

  let comeUp : List Entity :=
    (List.range pipes).flatMap fun i =>
      let x := 0
      let y := 2 * i

      if i == 0
      then []
      else [pipeToGround x y .W]

  let interfaceNS := ingredients.toVector.mapIdx fun i _ => (i * 2 + 1 : InterfaceImpl)
  let interfaceW := ingredients.toVector.mapIdx fun i _ => (i * 2 : InterfaceImpl)

  {
    width := width
    height := height
    entities := pipelines ++ goDown ++ comeUp
    interface := {
      n := cast (by simp) interfaceNS
      e := #v[]
      s := cast (by simp) interfaceNS
      w := cast (by simp) interfaceW
    }
    name := s!"pipesOut {reprStr ingredients}"
  }

def stationInterface (recipeName:RecipeName) : List InterfaceV :=
  let recipe := recipeName.getRecipe
  let inputs := (recipe.inputs.map Prod.snd).map (., .N)
  let outputs := (recipe.outputs.map Prod.snd).map (., .S)
  inputs ++ outputs

def station (recipeName:RecipeName) : Station (stationInterface recipeName) :=
  let recipe := recipeName.getRecipe
  let fabricator :=
    match recipeName with
    | .copperPlate
    | .ironPlate
    | .steelPlate
    | .stoneBrick => furnace

    | .rocketPart => rocketSilo

    | .sulfur
    | .plasticBar
    | .battery
    | .sulfuricAcid
    | .solidFuelFromLightOil
    | .lubricant
    | .heavyOilCracking
    | .lightOilCracking => chemicalPlant recipe.name.get!

    | .advancedOilProcessing => refinery recipe.name.get!

    | .electricEngineUnit
    | .utilitySciencePack
    | .productionSciencePack
    | .militarySciencePack
    | .chemicalSciencePack
    | .logisticSciencePack
    | .automationSciencePack
    | .stoneWall
    | .grenade
    | .piercingRoundsMagazine
    | .firearmMagazine
    | .productivityModule
    | .electricFurnace
    | .rail
    | .pipe
    | .transportBelt
    | .inserter
    | .lowDensityStructure
    | .flyingRobotFrame
    | .engineUnit
    | .processingUnit
    | .advancedCircuit
    | .electronicCircuit
    | .ironStick
    | .copperCable
    | .ironGearWheel
    | .rocketFuel => assembler recipe.name.get!

    | _ => assembler "not-yet-supported"

  let factory : Station (stationInterface recipeName) :=
    match recipeName with
    | .flyingRobotFrame => flyingRobotFrameStation
    | .rail => railStation
    | .sulfur =>
      let factory := row
        (pipesIn [.water, .petroleumGas])
        sulfurStation
      factory
    | .plasticBar =>
      let factory := row
        (pipesIn [.petroleumGas] (underground:=true))
        (stationWithoutPipes fabricator [.coal] [.plasticBar] (.top .petroleumGas))
      factory
    | .battery =>
      let factory := row
          (pipesIn [.sulfuricAcid] (underground:=true))
          (stationWithoutPipes fabricator [.ironPlate, .copperPlate] [.battery] (.top .sulfuricAcid))
      factory
    | .electricEngineUnit =>
      let factory := row
        (pipesIn [.lubricant] (underground:=true))
        (stationWithoutPipes fabricator [.electronicCircuit, .engineUnit] [.electricEngineUnit] (.middle .lubricant))
      factory
    | .processingUnit =>
      let factory := row
        (pipesIn [.sulfuricAcid] (underground:=true))
        (stationWithoutPipes fabricator [.electronicCircuit, .advancedCircuit] [.processingUnit] (.middle .sulfuricAcid))
      factory
    | .rocketFuel =>
      let factory := row
        (pipesIn [.lightOil] (underground:=true))
        (stationWithoutPipes fabricator [.solidFuel] [.rocketFuel] (.middle .lightOil))
      factory
     | .solidFuelFromLightOil =>
      let factory := row
        (pipesIn [.lightOil])
        solidFuelFromLightOilStation
      factory
    | .sulfuricAcid => row3
      (pipesIn [.water] (underground:=true))
      sulfuricAcidStation
      (pipesOut [.sulfuricAcid])
    | .advancedOilProcessing => row3
      (pipesIn [.water, .crudeOil])
      poweredRefinery
      (pipesOut [.heavyOil, .lightOil, .petroleumGas])
    | .heavyOilCracking =>
      let recipe := RecipeName.heavyOilCracking.getRecipe
      let inputs := recipe.inputs.map Prod.snd
      let outputs := recipe.outputs.map Prod.snd
      row3
        (pipesIn inputs)
        (poweredChemicalPlant recipe.name.get! inputs outputs)
        (pipesOut outputs)
    | .lubricant =>
      let recipe := RecipeName.lubricant.getRecipe
      let inputs := recipe.inputs.map Prod.snd
      let outputs := recipe.outputs.map Prod.snd
      row3
        (pipesIn inputs)
        (poweredChemicalPlant recipe.name.get! inputs outputs)
        (pipesOut outputs)
    | .lightOilCracking =>
      let recipe := RecipeName.lightOilCracking.getRecipe
      let inputs := recipe.inputs.map Prod.snd
      let outputs := recipe.outputs.map Prod.snd
      row3
        (pipesIn inputs)
        (poweredChemicalPlant recipe.name.get! inputs outputs)
        (pipesOut outputs)
    | recipeName =>
      let recipe := recipeName.getRecipe
      stationWithoutPipes fabricator (recipe.inputs.map Prod.snd) (recipe.outputs.map Prod.snd)

  factory.setName (reprStr recipeName)

-- Item's per minute
@[simp]
def throughput (recipeName:RecipeName) (stations:Nat) (items:Fraction) : Fraction :=
  stations * items * recipeName.speedUp * 60 / recipeName.getRecipe.time

@[simp]
def providedThroughput (recipeName:RecipeName) (stations:Nat) (ingredient:Ingredient) (items:Fraction) : Fraction :=
  let t := throughput recipeName stations items
  if ingredient.isLiquid then t else min expressBeltTroughput t

def expressBeltHalfThroughput := expressBeltTroughput / 2

def firstOffsetWithGap (offsets : Array Nat) (gap:Nat) := Id.run do
  for (offset, i) in offsets.zipIdx do
    let nextOffset := offsets[i + 1]?.getD 0
    if nextOffset - offset >= gap then
      return offset

  error! s!"Expected there to be a gap of {gap}"

def bigPoleInsert [config:Config] {interface} (offsets : Vector InterfaceImpl interface.length) : Factory interface [] interface [] :=
  if !config.generateBigPoles then emptyFactoryH offsets else

  let factory := (emptyFactoryH offsets).expand .S 2
  {
    factory with
    entities := factory.entities ++ [bigPole (3 + firstOffsetWithGap offsets.toArray 4) 0]
  }

def roboportInsert [config:Config] {interface} (offsets : Vector InterfaceImpl interface.length) : Factory interface [] interface [] :=
  if !config.generateRoboports then emptyFactoryH offsets else

  let factory := (emptyFactoryH offsets).expand .S 4
  {
    factory with
    entities := factory.entities ++ [roboport (2 + firstOffsetWithGap offsets.toArray 4) 0]
  }

def eraseRectangle (x y width height:Nat) (es:List Entity) : List Entity :=
  es.filter fun e => !(
    x <= e.x && e.x < x + width &&
    y <= e.y && e.y < y + height
  )

def providerChestInsert [config:Config] {interface} (recipeName:RecipeName) (offsets : Vector InterfaceImpl interface.length) : Factory interface [] interface [] :=
  let recipe := recipeName.getRecipe
  if config.providerChestCapacity == 0 || recipe.outputs.isEmpty || recipe.outputs[0]!.snd.isLiquid then emptyFactoryH offsets else

  let outputOffset := offsets[interface.length-1]!

  let chest := [
    passiveProviderChest (outputOffset - 2) 1 (capacity:=config.providerChestCapacity),
    inserter (outputOffset - 1) 1 .E
  ]

  let factory := (emptyFactoryH offsets).expand .S 4
  {
    factory with
    entities := (eraseRectangle (outputOffset - 1) 0 1 3 factory.entities) ++ chest ++
      if (recipe.inputs.filter (fun input => !input.snd.isLiquid)).length <= 2 then [pole (outputOffset - 3) 1]
      else [pole (outputOffset - 4) 1,
            beltUp (outputOffset - 1) 0 .N,
            beltDown (outputOffset - 1) 2 .N]
  }

def outputBalancerInsert {interface} (offsets : Vector InterfaceImpl interface.length) : Factory interface [] interface [] :=
  let factory := (emptyFactoryH offsets).expand .S 4

  let x := 1 + firstOffsetWithGap offsets.toArray 5
  let balancer : List Entity := [
    belt (x+2) 0 .S,
    belt (x+3) 0 .W,
    splitter (x+4) 0 .W (outputPriority := "right"),

    belt x 1 .S,
    belt (x+1) 1 .W,
    belt (x+2) 1 .W,
    belt (x+3) 1 .S,

    belt x 2 .S,
    belt (x+2) 2 .N,
    belt (x+3) 2 .W,
    belt (x+4) 2 .E,

    belt x 3 .E,
    beltDown (x+1) 3 .E,
    pole (x+2) 3,
    beltUp (x+3) 3 .E,
    belt (x+4) 3 .N,
  ]

  let outputOffset := offsets[interface.length-1]!

  let adapter :=
    let x := outputOffset
    [belt x 0 .S, belt x 1 .W, belt x 2 .S, belt x 3 .S]

  let avoider :=
    let x := outputOffset - 1
    [beltUp x 0 .N, belt x 1 .W, belt x 2 .E, beltDown x 3 .N]

  let connector :=
    match outputOffset - x with
    | 5 => adapter
    | 6 => adapter ++ avoider
    | _ => error! s!"Couldn't generate outputBalancerInsert for {reprStr interface}"

  {
    factory with
    entities := (eraseRectangle (outputOffset - 1) 0 2 4 factory.entities) ++
                balancer ++ connector
  }

def maxRoboportLogisticsDistance := 46

def assemblyLine [Config] (recipeName:RecipeName) (stations:Nat) : Factory [] [] (stationInterface recipeName) [] :=
  Id.run do
    let output := recipeName.getRecipe.outputs[0]!
    let stationOutput := throughput recipeName 1 output.fst
    let station := station recipeName
    let mut factories : Array (Factory (stationInterface recipeName) [] (stationInterface recipeName) []) := #[
      bigPoleInsert station.interface.s,
      providerChestInsert recipeName station.interface.s,
      roboportInsert station.interface.s
    ]
    let mut outputSinceBalance : Fraction := 0
    let mut distanceFromRoboport : Nat := 0

    for _ in List.range stations do
      if !output.snd.isLiquid && outputSinceBalance + stationOutput > expressBeltHalfThroughput then
        factories := factories.push (outputBalancerInsert station.interface.s)
        outputSinceBalance := 0
        distanceFromRoboport := distanceFromRoboport + 4

      if distanceFromRoboport + station.height > maxRoboportLogisticsDistance then
        factories := factories.push (roboportInsert station.interface.s)
        distanceFromRoboport := 0

      factories := factories.push station
      outputSinceBalance := outputSinceBalance + stationOutput
      distanceFromRoboport := distanceFromRoboport + station.height

    capN (columnList factories.toList.reverse)

def tupleType {T} (ts:List T) (type:T->Type) : Type :=
  match ts with
  | [] => Unit
  | [t] => type t
  | t::types => type t × tupleType types type

def tuple {T} {ts:List T} {type:T->Type} (value : (t:T) -> Nat -> type t) (index:=0) : tupleType ts type :=
  match ts with
  | [] => ()
  | [t] => value t index
  | t::_::_ => (value t index, tuple value (index + 1))

@[simp]
def BusAssemblyLineReturn (recipeName: RecipeName) (stations:Nat) : Type :=
  Bus (tupleType recipeName.getRecipe.outputs fun (items, ingredient) => BusLane ingredient (providedThroughput recipeName stations ingredient items))

@[simp]
def BusAssemblyLineType (recipeName:RecipeName) (stations:Nat) (remainingInputs: List (Fraction × Ingredient) := recipeName.getRecipe.inputs): Type :=
  match remainingInputs with
  | [] => BusAssemblyLineReturn recipeName stations
  | (items,ingredient)::inputs => BusLane ingredient (throughput recipeName stations items) -> BusAssemblyLineType recipeName stations inputs

def processBusAssemblyLineArguments
  (recipeName:RecipeName)
  (stations:Nat)
  (processor: List BusLane' -> BusAssemblyLineReturn recipeName stations)
  (remainingInputs: List (Fraction × Ingredient) := recipeName.getRecipe.inputs)
  (args: List BusLane' := [])
: BusAssemblyLineType recipeName stations remainingInputs := by
  revert args
  refine (match remainingInputs with
  | [] => processor
  | _::inputs => fun args arg =>
    processBusAssemblyLineArguments recipeName stations processor inputs (args ++ [arg.toBusLane'])
  )

def busAssemblyLine [config:Config] (recipeName: RecipeName) (stations:Nat) : BusAssemblyLineType recipeName stations :=
  processBusAssemblyLineArguments recipeName stations fun inputs => do
    let factory := assemblyLine recipeName stations
    let namedFactory := factory.setName s!"{stations}x{reprStr recipeName}"
    let indexes <- busTapGeneric
      inputs
      (recipeName.getRecipe.outputs.map Prod.snd)
      (unsafeFactoryCast namedFactory)
      (adapterMinHeight := config.adapterMinHeight)
    return tuple (fun (_, _) i => {index:=indexes[i]!})
