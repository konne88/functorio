import Functorio.AssemblyLine
import Functorio.Blueprint
import Functorio.Column
import Functorio.Bus
import Functorio.Expand
import Functorio.Ascii

namespace Test

instance : Config where
  generateBigPoles := false
  generateRoboports := false
  providerChestCapacity := 0
  adapterMinHeight := 3

#guard (bus do
  let iron <- input .ironPlate 300
  let copper <- input .copperPlate 15
  let gear <- busAssemblyLine RecipeName.ironGearWheel 1 iron
  let _ <- busAssemblyLine RecipeName.automationSciencePack 1 copper gear.less
).toAscii == s!"


 ↑ *** ↓↑↑ *** ↓
 ↑ *A* ↓↑↑↠*A* ↓
 ↑⇨***⇨↓↑↑⇨***⇨↓
 ↑  ⚡  ↓↑↑  ⚡  ↓
 ↑ ↓←←←←↑↑  ↓←←←
 ↑ ↓    ↑↑←←↓
 ↑←↓    ↑← ↑↓
  ↑↓     ↑ ↑↓
>→↑→→→→→⇥↑↦↑→→→→>
>→→→→→→→→↑

"

#guard (bus do
  let water <- input .water 11400
  let petrol <- input .petroleumGas 5400
  let iron <- input .ironPlate 60
  let (water0, water1) <- split (left:=5400) water
  let sulfur <- busAssemblyLine RecipeName.sulfur 3 water0 petrol
  let _ <- busAssemblyLine RecipeName.sulfuricAcid 1 water1.exact sulfur.less iron
).toAscii == s!"


  |┤|├*** ↓
  | | *C* ↓
  | ||***⇨↓
  | |  ⚡  ↓
  |┤|├*** ↓
  | | *C* ↓
  | ||***⇨↓
  | |  ⚡  ↓
  |┤|├*** ↓ |┤↑↑├***||
  | | *C* ↓ | ↑↑↠*C* |
  | ||***⇨↓ | ↑↑⇨*** |
  | |  ⚡  ↓ | ↑↑  ⚡  |
  | |↓←←←←← |→↑↑||||||
  | |↓      |↑ ↑|
  | |↓      |↑ ↑|
  | |↓      |↑ ↑|
>||┤|↓├||||||↑ ↑|||||||>
>→→⇥|↓↦→→→→→⇥↑↦↑
>||||→→→→→→→→↑

"

#guard (bus do
  let copper <- input .copperPlate 300
  let iron <- input .ironPlate 1050

  let (iron0, rest) <- split (left:=600) iron
  let (iron1, rest) <- split (left:=150) rest
  let (iron2, rest) <- split (left:=150) rest
  let iron3 : BusLane .ironPlate 150 := rest

  let gear <- busAssemblyLine RecipeName.ironGearWheel 2 iron0
  let (gear0, rest) <- split (left:=150) gear
  let gear1 : BusLane .ironGearWheel 150 := rest.less

  let belt <- busAssemblyLine RecipeName.transportBelt 1 iron1 gear0
  let cable <- busAssemblyLine RecipeName.copperCable 2 copper
  let circuit <- busAssemblyLine RecipeName.electronicCircuit 1 iron2 cable.less
  let inserter <- busAssemblyLine RecipeName.inserter 1 circuit gear1 iron3

  let _ <- busAssemblyLine RecipeName.logisticSciencePack 1 inserter.less belt.less
).toAscii == s!"


 ↑ *** ↓        ↑ *** ↓
 ↑ *A* ↓        ↑ *A* ↓
 ↑⇨***⇨↓        ↑⇨***⇨↓
 ↑  ⚡  ↓        ↑  ⚡  ↓
 ↑ *** ↓↑↑ *** ↓↑ *** ↓↑↑ *** ↓↑↑ *** ↑↓↑↑ *** ↓
 ↑ *A* ↓↑↑↠*A* ↓↑ *A* ↓↑↑↠*A* ↓↑↑↠*A*↠↑↓↑↑↠*A* ↓
 ↑⇨***⇨↓↑↑⇨***⇨↓↑⇨***⇨↓↑↑⇨***⇨↓↑↑⇨***⇦↑↓↑↑⇨***⇨↓
 ↑  ⚡  ↓↑↑  ⚡  ↓↑  ⚡  ↓↑↑  ⚡  ↓↑↑  ⚡  ↑↓↑↑  ⚡  ↓
 ↑  ↓←←←↑↑   ↓←←↑ ↓←←←←↑↑   ↓←←↑↑  →→→↑↓↑↑ ↓←←←←
 ↑  ↓   ↑↑←←←↓  ↑ ↓    ↑↑←←←↓  ↑↑← ↑↓←←←↑↑←↓
 ↑←←↓   ↑←← ↑↓  ↑←↓    ↑←← ↑↓  ↑←↑ ↑↓   ↑←↑↓
   ↑↓     ↑ ↑↓   ↑↓      ↑ ↑↓   ↑↑ ↑↓    ↑↑↓
>⇥*↑↓↦→→⇥*↑ ↑↓↦→→↑→→→→→⇥*↑↦↑→→→→↑↑ ↑→→→→→↑↑→→→→→>
>→S⇥↓↦→→→S⇥*↑↓↦→→→→→→→→→S→→→→→→→⇥↑↦↑      ↑
    →→→→→→→S⇥↓↦→→→→→→→→→→→→→→→→→→↑        ↑
             →→→→→→→→→→→→→→→→→→→→→→→→→→→→→↑

"

end Test
