import Functorio.Recipe
import Functorio.Factory
import Functorio.Util
import Functorio.Row

structure Process where
  recipe:RecipeName
  fabricator:Fabricator
  -- fabricatorOk : fabricator.handlesCategory recipeName.getRecipe.category := by decide

namespace RecipeName

def inputIngredients (r:RecipeName) : List Ingredient :=
  r.getRecipe.inputs.map (Prod.snd)

def outputIngredients (r:RecipeName) : List Ingredient :=
  r.getRecipe.outputs.map (Prod.snd)

end RecipeName

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

instance : Coe RecipeName Process where
  coe recipe := {
    recipe := recipe,
    fabricator := defaultCategoryFabricator recipe.getRecipe.category,
  }

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
  mirror := true
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

def liquidInputs (recipe:RecipeName) : List Ingredient :=
  (recipe.getRecipe.inputs.map Prod.snd).filter Ingredient.isLiquid

def liquidOutputs (recipe:RecipeName): List Ingredient :=
  (recipe.getRecipe.outputs.map Prod.snd).filter Ingredient.isLiquid

def solidInputs (recipe:RecipeName): List Ingredient :=
  (recipe.getRecipe.inputs.map Prod.snd).filter (!Ingredient.isLiquid .)

def solidOutputs (recipe:RecipeName): List Ingredient :=
  (recipe.getRecipe.outputs.map Prod.snd).filter (!Ingredient.isLiquid .)

def interfaceE (recipe:RecipeName) : List InterfaceH :=
  (liquidOutputs recipe).map (.,.E)

def interfaceW (recipe:RecipeName) : List InterfaceH :=
  (liquidInputs recipe).map (.,.E)

def plainStation (process:Process) : Factory [] (interfaceE process.recipe) [] (interfaceW process.recipe) :=
  let details := fabricatorConfig process.fabricator
  {
    entities := [
      fabricator 0 0 process.fabricator process.recipe details.direction details.mirror
    ]
    width := process.fabricator.width
    height := process.fabricator.height
    interface := {
      n := #v[]
      e := (details.outputOffsets.splitAt (liquidOutputs process.recipe).length).fst.castToVector!
      s := #v[]
      w := (details.inputOffsets.splitAt (liquidInputs process.recipe).length).fst.castToVector!
    }
    name := reprStr process.recipe.getRecipe.name
  }

private def beltline (x:Nat) (dir:Direction) (height:Nat) : List Entity :=
  (List.range height).map (fun y => belt x y dir)

structure Access where
  direction: DirectionV
  ingredient: Ingredient

-- factoryDir = direction in which the factory lies
def accessEntities (x:Nat) (height:Nat) (ewOffsets:List InterfaceImpl) (ns : List InterfaceV) (factoryDir: DirectionH) : List Entity :=
  Id.run do
    let mut entities : Vector (Option EntityType) height := Vector.replicate height .none

    let inputInserterDir : DirectionH := match factoryDir with | .E => .W | .W => .E
    let outputInserterDir : DirectionH := factoryDir

    for y in ewOffsets do
      entities := entities.set! y (.some (.pipeToGround factoryDir))

    for ((_, dir), i) in ns.zipIdx do
      for y in List.range height do
        if entities[y]! == .none then
          let inserterDir := match dir with | .N => inputInserterDir | .S => outputInserterDir
          match i with
          | 0 => entities := entities.set! y (.some (.inserter inserterDir))
          | 1 => entities := entities.set! y (.some (.longInserter inserterDir))
          | _ => error! "nope"
          break

    for y in List.range height do
      if entities[y]! == .none then
        entities := entities.set! y (.some .pole)

    return entities.toList.zipIdx.flatMap fun (type, y) =>
      match type with | .none => [] | .some type => [{x:=x, y:=y, type:=type}]

def rightAccessor {ew} (ewOffsets: Vector InterfaceImpl ew.length) (height:Nat) (ns : List InterfaceV) : Factory ns ew ns ew :=
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
        accessEntities 0 height ewOffsets.toList ns .W ++
        (ns.zipIdx.flatMap fun ((_, dir), i) => beltline (i + 1) dir height)
    }

def leftAccessor {ew} (ewOffsets: Vector InterfaceImpl ew.length) (height:Nat) (ns : List InterfaceV) : Factory ns ew ns ew :=
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
        accessEntities ns.length height ewOffsets.toList ns .E ++
        (ns.zipIdx.flatMap fun ((_, dir), i) => beltline i dir height)
    }


def interfaceNS' (recipe:RecipeName) : List InterfaceV :=
  (solidInputs recipe).map (.,.N) ++ (solidOutputs recipe).map (.,.S)

def pipesOnSideStation (process:Process) : Factory
  (interfaceNS' process.recipe)
  (interfaceE process.recipe)
  (interfaceNS' process.recipe)
  (interfaceW process.recipe)
:=
  let station := plainStation process
  let ns := interfaceNS' process.recipe
  let (leftNS, rightNS) := ns.splitAt (ns.length / 2)
  let leftAccess := leftAccessor station.interface.w station.height leftNS
  let rightAccess := rightAccessor station.interface.e station.height rightNS

  unsafeFactoryCast (row3 leftAccess station rightAccess)

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

private def pipesOut (ingredients:List Ingredient) (underground:Bool)
: Factory (ingredients.map (.,.S)) [] (ingredients.map (.,.S)) (ingredients.map (.,.E))
:=
  if !underground then unimplemented! s!"pipesOut requires underground belts, passed {underground}" else

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

def interfaceNS (recipe:RecipeName) : List InterfaceV :=
  recipe.inputIngredients.map (., .N) ++
  recipe.outputIngredients.map (., .S)

abbrev Station recipe := Factory (interfaceNS recipe) [] (interfaceNS recipe) []

-- Special case, because it takes 4 inputs.
private def flyingRobotFrameStation : Station .flyingRobotFrame :=
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

      assembler RecipeName.flyingRobotFrame 4 0,
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
def railStation : Station .rail :=
  let factory := pipesOnSideStation RecipeName.rail
  -- Needs two output inserters to keep up with the production rate.
  {factory with
    entities := factory.entities.append [
      longInserter 6 0 .W
    ]
  }

def station (process:Process) : Station process.recipe :=
  match process.recipe with
  | .flyingRobotFrame => flyingRobotFrameStation
  | .rail => railStation
  | _ =>
    let station := pipesOnSideStation process

    let ns := interfaceNS' process.recipe
    let (leftNS, rightNS) := ns.splitAt (ns.length / 2)

    unsafeFactoryCast (row3
      (pipesIn (liquidInputs process.recipe) (underground:=!leftNS.isEmpty))
      station
      (pipesOut (liquidOutputs process.recipe) (underground:=!rightNS.isEmpty)))
