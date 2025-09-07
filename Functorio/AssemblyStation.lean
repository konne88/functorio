import Functorio.Recipe
import Functorio.Factory
import Functorio.Util
import Functorio.Row

structure Process where
  recipe:RecipeName
  fabricator:Fabricator
  -- fabricatorOk : fabricator.handlesCategory recipeName.getRecipe.category := by decide
  deriving Repr, DecidableEq

namespace Process

@[simp]
def getRecipe (process:Process) : Recipe :=
  let original := process.recipe.getRecipe
  if process.fabricator != .biochamber then original else
  let nutrientInput := [( original.time / process.fabricator.speedup / 4 , Ingredient.nutrients )]
  let liquidInputs := original.inputs.filter fun input => input.snd.isLiquid
  let solidInputs := original.inputs.filter fun input => !input.snd.isLiquid

  { original with
    inputs := liquidInputs ++ nutrientInput ++ solidInputs
  }

def liquidInputs (process:Process) : List Ingredient :=
  (process.getRecipe.inputs.map Prod.snd).filter Ingredient.isLiquid

def liquidOutputs (process:Process): List Ingredient :=
  (process.getRecipe.outputs.map Prod.snd).filter Ingredient.isLiquid

def solidInputs (process:Process): List Ingredient :=
  (process.getRecipe.inputs.map Prod.snd).filter (!Ingredient.isLiquid .)

def solidOutputs (process:Process): List Ingredient :=
  (process.getRecipe.outputs.map Prod.snd).filter (!Ingredient.isLiquid .)

@[simp]
def inputIngredients (process:Process) : List Ingredient :=
  process.getRecipe.inputs.map (Prod.snd)

@[simp]
def outputIngredients (process:Process) : List Ingredient :=
  process.getRecipe.outputs.map (Prod.snd)

end Process

@[simp]
def defaultCategoryFabricator : RecipeCategory -> Fabricator
| .chemistry
| .organicOrChemistry
| .chemistryOrCryogenics => .chemicalPlant
| .basicCrafting
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
| .parameters
| .cryogenicsOrAssembling => .assemblingMachine3
| .oilProcessing => .oilRefinery
| .rocketBuilding => .rocketSilo
| .smelting => .electricFurnace
| .captiveSpawnerProcess => .captiveBiterSpawner
| .centrifuging => .centrifuge
| .crushing => .crusher
| .cryogenics => .cryogenicPlant
| .electromagnetics => .electromagneticPlant
| .metallurgy => .foundry
| .organic
| .organicOrHandCrafting => .biochamber
| .recyclingOrHandCrafting
| .recycling => .recycler

@[simp]
def recipe (recipe:RecipeName) : Process := {
  recipe := recipe,
  fabricator := defaultCategoryFabricator recipe.getRecipe.category,
}

-- instance : Coe RecipeName Process where
--   coe recipe := {
--     recipe := recipe,
--     fabricator := defaultCategoryFabricator recipe.getRecipe.category,
--   }

structure FabricatorConfig where
  direction : Direction
  mirror : Bool
  inputOffsets : List Nat
  outputOffsets : List Nat

def fabricatorConfig : Fabricator -> FabricatorConfig
| .assemblingMachine1
| .recycler
| .steelFurnace
| .stoneFurnace
| .electricFurnace
| .rocketSilo
| .centrifuge
| .crusher
| .captiveBiterSpawner => {
  direction := .N
  mirror := false
  inputOffsets := []
  outputOffsets := []
}
| .assemblingMachine2
| .assemblingMachine3 => {
  direction := .W
  mirror := false
  inputOffsets := [1]
  outputOffsets := [1]
}
| .chemicalPlant
| .biochamber => {
  direction := .W
  mirror := true
  inputOffsets := [0,2]
  outputOffsets := [0,2]
}
| .oilRefinery => {
  direction := .E
  mirror := false
  inputOffsets := [1,3]
  outputOffsets := [0,2,4]
}
| .cryogenicPlant => {
  direction := .E
  mirror := false
  inputOffsets := [0,2,4]
  outputOffsets := [0,2,4]
}
| .foundry => {
  direction := .E
  mirror := false
  inputOffsets := [1,3]
  outputOffsets := [1,3]
}
| .electromagneticPlant => {
  direction := .N
  mirror := false
  inputOffsets := [2]
  outputOffsets := [1]
}

def interfaceE (process:Process) : List InterfaceH :=
  process.liquidOutputs.map (.,.E)

def interfaceW (process:Process) : List InterfaceH :=
  process.liquidInputs.map (.,.E)

def plainStation (process:Process) : Factory [] (interfaceE process) [] (interfaceW process) :=
  let details := fabricatorConfig process.fabricator
  {
    entities := [
      fabricator 0 0 process.fabricator process.recipe details.direction details.mirror
    ]
    width := process.fabricator.width
    height := process.fabricator.height
    interface := {
      n := #v[]
      e := (details.outputOffsets.splitAt process.liquidOutputs.length).fst.castToVector!
      s := #v[]
      w := (details.inputOffsets.splitAt process.liquidInputs.length).fst.castToVector!
    }
    name := reprStr process.getRecipe.name
  }

private def beltline (x:Nat) (dir:Direction) (height:Nat) : List Entity :=
  (List.range height).map (fun y => belt x y dir)

private def pipeline (x:Nat) (height:Nat): List Entity :=
  (List.range height).map fun y => pipe x y

structure Access where
  direction: DirectionV
  ingredient: Ingredient

-- factoryDir = direction in which the factory lies
def accessEntities (x:Nat) (height:Nat) (ewOffsets:List InterfaceImpl) (ns : List InterfaceV) (factoryDir: DirectionH) (numSolidOutputs:Nat) : List Entity :=
  Id.run do
    let mut entities : Vector (Option EntityType) height := Vector.replicate height .none

    let inputInserterDir : DirectionH := match factoryDir with | .E => .W | .W => .E
    let outputInserterDir : DirectionH := factoryDir

    for y in ewOffsets do
      entities := entities.set! y (.some (.pipeToGround factoryDir))

    for ((ingredient, dir), i) in ns.zipIdx do
      for y in List.range height do
        if entities[y]! == .none then
          let inserterDir := match dir with | .N => inputInserterDir | .S => outputInserterDir
          let filter := if dir == .S && numSolidOutputs > 1 then [ingredient] ++ ingredient.spoilResult.toList else []
          match i with
          | 0 => entities := entities.set! y (.some (.inserter inserterDir filter))
          | 1 => entities := entities.set! y (.some (.longInserter inserterDir filter))
          | _ => error! s!"More than 2 belt inputs/outputs per side are not supported, belt index = {i}"
          break

    for y in (List.range height).reverse do
      if entities[y]! == .none then
        entities := entities.set! y (.some .pole)
        break

    return entities.toList.zipIdx.flatMap fun (type, y) =>
      match type with | .none => [] | .some type => [{x:=x, y:=y, type:=type}]

def rightAccessor {ew} (ewOffsets: Vector InterfaceImpl ew.length) (height:Nat) (ns : List InterfaceV) (numSolidOutputs:Nat): Factory ns ew ns ew :=
  match ns with
  | [] => emptyFactoryV ewOffsets
  | _ =>
    {
      width := ns.length + 1
      height := height
      interface := {
        n := (ns.mapIdx fun i _ => i + 1).castToVector!
        e := ewOffsets
        s := (ns.mapIdx fun i _ => i + 1).castToVector!
        w := ewOffsets
      }
      name := "rightAccessor"
      entities :=
        accessEntities 0 height ewOffsets.toList ns .W numSolidOutputs ++
        (ns.zipIdx.flatMap fun ((_, dir), i) => beltline (i + 1) dir height)
    }

def leftAccessor {ew} (ewOffsets: Vector InterfaceImpl ew.length) (height:Nat) (ns : List InterfaceV) (numSolidOutputs:Nat): Factory ns ew ns ew :=
  match ns with
  | [] => emptyFactoryV ewOffsets
  | _ =>
    {
      width := ns.length + 1
      height := height
      interface := {
        n := (ns.mapIdx fun i _ => i).castToVector!
        e := ewOffsets
        s := (ns.mapIdx fun i _ => i).castToVector!
        w := ewOffsets
      }
      name := "leftAccessor"
      entities :=
        accessEntities ns.length height ewOffsets.toList ns .E numSolidOutputs ++
        (ns.zipIdx.flatMap fun ((_, dir), i) => beltline i dir height)
    }


def interfaceNS (process:Process) : List InterfaceV :=
  process.solidInputs.map (.,.N) ++ process.solidOutputs.map (.,.S)

def pipesOnSideStation (process:Process) : Factory
  (interfaceNS process)
  (interfaceE process)
  (interfaceNS process)
  (interfaceW process)
:=
  let station := plainStation process
  let ns := interfaceNS process
  let (leftNS, rightNS) := ns.splitAt (ns.length / 2)
  let leftAccess := leftAccessor station.interface.w station.height leftNS process.solidOutputs.length
  let rightAccess := rightAccessor station.interface.e station.height rightNS process.solidOutputs.length

  -- in these cases, there might not be enough space for poles right next to the fabricator
  -- if ns.length == 0--  || process.inputIngredients.length + process.outputIngredients.length >= station.height * 2 - 1
  -- then
  --   let factory := station.expand .S 1
  --   unsafeFactoryCast {factory with
  --     entities := factory.entities.append [pole (factory.width/2) (factory.height - 1)]
  --   }
  -- else

  unsafeFactoryCast (row3 leftAccess station rightAccess)

private def pipesIn (ingredients:List Ingredient) (underground:Bool := false) (powerPole:Bool := false)
: Factory (ingredients.map (.,.N)) (ingredients.map (.,.E)) (ingredients.map (.,.N)) []
:=
  let pipes := ingredients.length
  let width := if pipes == 0 then 0 else pipes * 2 + 1
  let height := if powerPole then max 2 (pipes * 2 - 1) else pipes * 2 - 1

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

  let power : List Entity :=
    if powerPole then [pole (width-1) 1] else []

  let interfaceNS := ingredients.toVector.mapIdx fun i _ => (i * 2 + 1 : InterfaceImpl)
  let interfaceE := ingredients.toVector.mapIdx fun i _ => (i * 2 : InterfaceImpl)

  {
    width := width
    height := height
    entities := pipelines ++ goDown ++ comeUp ++ power
    interface := {
      n := cast (by simp) interfaceNS
      e := cast (by simp) interfaceE
      s := cast (by simp) interfaceNS
      w := #v[]
    }
    name := s!"pipesIn {reprStr ingredients}"
  }

private def pipesOut (ingredients:List Ingredient) (underground:Bool := false)
: Factory (ingredients.map (.,.S)) [] (ingredients.map (.,.S)) (ingredients.map (.,.E))
:=
  let pipes := ingredients.length
  let width := if pipes == 0 then 0 else pipes * 2 + 1
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

      if i == 0 && !underground
      then pipe x y
      else pipeToGround x y .E

  let comeUp : List Entity :=
    (List.range pipes).flatMap fun i =>
      let x := 0
      let y := 2 * i

      if i == 0 || underground
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

def stationInterface (process:Process) : List InterfaceV :=
  process.inputIngredients.map (., .N) ++
  process.outputIngredients.map (., .S)

abbrev Station process := Factory (stationInterface process) [] (stationInterface process) []

def stationWithoutOverride (process:Process) : Station process :=
  let station := pipesOnSideStation process
  let height := process.fabricator.height

  let ns := interfaceNS process
  let (leftNS, rightNS) := ns.splitAt (ns.length / 2)

  unsafeFactoryCast (row3
    (pipesIn process.liquidInputs (underground:=!leftNS.isEmpty) (powerPole:=
      ns.length == 0 ||
      process.liquidInputs.length + leftNS.length >= height))
    station
    (pipesOut process.liquidOutputs (underground:=!rightNS.isEmpty)))

-- Special case, because it takes 4 inputs.
private def flyingRobotFrameStation : Station (recipe .flyingRobotFrame) :=
  let height := 3
  let entities : List Entity :=
    beltline (x:=0) .N height ++
    beltline (x:=1) .N height ++
    [
      beltUp 2 0 .N,
      longInserter 2 1 .W,
      beltDown 2 2 .N,

      longInserter 3 0 .W,
      pole 3 1,
      inserter 3 2 .W,

      assembler RecipeName.flyingRobotFrame 4 0,

      longInserter 7 0 .W,
      pole 7 1,
      inserter 7 2 .E
    ] ++
    beltline (x:=8) .N height ++
    beltline (x:=9) .S height

  {
    width:= 10, height:=height, entities := entities
    interface := {
      n := #v[0,1,2,8,9]
      e := #v[]
      s := #v[0,1,2,8,9]
      w := #v[]
    }
    name := "flyingRobotFrame"
  }

-- Special case, because it has incredible requirements on output speed
private def nutrientsFromBiofluxStation : Station (recipe .nutrientsFromBioflux) :=
  let height := 5
  let entities : List Entity :=
    beltline (x:=0) .N height ++
    beltline (x:=1) .N height ++
    [
      inserter 2 0 .W,
      longInserter 2 1 .W,
      pole 2 2,

      fabricator 3 0 .biochamber .nutrientsFromBioflux,

      inserter 6 0 .W,
      inserter 6 1 .W,
      inserter 6 2 .W,

      inserter 3 3 .N,
      inserter 4 3 .N,
      inserter 5 3 .N,
      pole 6 3,

      belt 3 4 .E,
      belt 4 4 .E,
      belt 5 4 .E,
      belt 6 4 .E
    ] ++
    beltline (x:=7) .S height

  {
    width:= 8, height:=height, entities := entities
    interface := {
      n := #v[0,1,7]
      e := #v[]
      s := #v[0,1,7]
      w := #v[]
    }
    name := "nutrientsFromBioflux"
  }

-- Special case, needs two output inserters to keep up with the production rate.
def railStation : Station (recipe .rail) :=
  let factory := (pipesOnSideStation (recipe .rail)).expand .S 1
  let removedLeftPole := eraseRectangle 2 2 1 1 factory.entities
  let removedPoles := eraseRectangle 6 2 1 1 removedLeftPole
  {factory with
    entities := removedPoles.append [
      longInserter 6 2 .W,
      pole 4 3
    ]
  }

-- Special case, needs more powerpoles to covert the huge size of the building
def rocketPart : Station (recipe .rocketPart) :=
  let factory := pipesOnSideStation (recipe .rocketPart)
  {factory with
    entities := factory.entities.append [
      pole 1 3, pole 11 3,
    ]
  }

def acccessPipe (x:Nat) (ingredient:Ingredient): Factory [] [] [] [(ingredient, .E)] := {
  width := 4, height := 1
  entities := [pipe x 0, pipeToGround (x-1) 0 .E]
  name := "accessPipe"
  interface := {n := #v[], e := #v[], s := #v[], w := #v[0]}
}

-- Special case, because the plant's pipes come out in weird spots
def electrolyteStation : Station (recipe .electrolyte) :=
  {
    width := 13, height := 6,
    name := ".electrolyte"
    interface := {n := #v[1,3,5,11], e := #v[], s := #v[1,3,5,11], w := #v[]}
    entities :=
      pipeline 1 6 ++
      pipeline 3 6 ++
      beltline 5 .N 6 ++
      [
        pipeToGround 2 0 .W, pipeToGround 7 0 .E, pipe 8 0,
        pipeToGround 4 5 .W, pipeToGround 8 5 .E, pipe 9 5,
        inserter 6 1 .W, pole 6 4,
        fabricator 7 1 .electromagneticPlant .electrolyte .E,
      ] ++
      pipeline 11 6
  }

-- Special case, because the plant's pipes come out in weird spots
def electromagneticScienceStation : Station (recipe .electromagneticSciencePack) :=
  {
    width := 14, height := 6,
    name := ".electromagneticSciencePack"
    interface := {n := #v[1,3,5,6,13], e := #v[], s := #v[1,3,5,6,13], w := #v[]}
    entities :=
      pipeline 1 6 ++
      pipeline 3 6 ++
      beltline 5 .N 6 ++
      beltline 6 .N 6 ++
      [
        pipeToGround 2 0 .W, pipeToGround 8 0 .E, pipe 9 0,
        pipeToGround 4 5 .W, pipeToGround 9 5 .E, pipe 10 5,
        inserter 7 1 .W, longInserter 7 2 .W, pole 7 4,
        fabricator 8 1 .electromagneticPlant .electromagneticSciencePack .E,
        inserter 12 1 .W, pole 12 4,
      ] ++
      beltline 13 .S 6
  }

-- Special case, because of 4 solid inputs
private def supercapacitorStation : Station (recipe .supercapacitor) :=
  let height := 4
  let entities : List Entity :=
    pipeline (x:=1) height ++
    beltline (x:=3) .N height ++
    beltline (x:=4) .N height ++
    [
      beltUp 5 0 .N,
      longInserter 5 1 .W,
      beltDown 5 2 .N,
      belt 5 3 .N,

      inserter 6 0 .W,
      longInserter 6 1 .W,
      pipeToGround 2 2 .W, pipeToGround 6 2 .E,
      pole 6 3,

      fabricator 7 0 .electromagneticPlant .supercapacitor,

      longInserter 11 0 .W,
      inserter 11 1 .E,
      pole 11 3,
    ] ++
    beltline (x:=12) .N height ++
    beltline (x:=13) .S height

  {
    width:= 14, height:=height, entities := entities
    interface := {
      n := #v[1,3,4,5,12,13]
      e := #v[]
      s := #v[1,3,4,5,12,13]
      w := #v[]
    }
    name := ".supercapacitor"
  }

def station (process:Process) : Station process :=
  match process.recipe with
  | .flyingRobotFrame => unsafeFactoryCast flyingRobotFrameStation
  | .electrolyte => unsafeFactoryCast electrolyteStation
  | .electromagneticSciencePack => unsafeFactoryCast electromagneticScienceStation
  | .supercapacitor => unsafeFactoryCast supercapacitorStation
  | .rail => unsafeFactoryCast railStation
  | .rocketPart => unsafeFactoryCast rocketPart
  | .nutrientsFromBioflux => unsafeFactoryCast nutrientsFromBiofluxStation
  | _ => stationWithoutOverride process
