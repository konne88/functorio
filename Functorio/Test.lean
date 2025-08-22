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
  let gear <- busAssemblyLine .ironGearWheel 1 iron
  let _ <- busAssemblyLine .automationSciencePack 1 copper gear.less
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
  let sulfur <- busAssemblyLine .sulfur 3 petrol water0
  let _ <- busAssemblyLine .sulfuricAcid 1 water1.exact iron sulfur.less
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
  | |↓←←←←← |→↑↑     |
  | |↓      |↑→↑     |
  | |↓      |↑↑|||||||
  | |⤓      |↑↑|
>┤|├|||||||||↑↑||||||||>
>⇥|↦⇥↧↦→→→→→→↑↑
>||  →→→→→→→→→↑

"

#guard (bus do
  let copper <- input .copperPlate 300
  let iron <- input .ironPlate 1050

  let (iron0, rest) <- split (left:=600) iron
  let (iron1, rest) <- split (left:=150) rest
  let (iron2, rest) <- split (left:=150) rest
  let iron3 : BusLane .ironPlate 150 := rest

  let gear <- busAssemblyLine .ironGearWheel 2 iron0
  let (gear0, rest) <- split (left:=150) gear
  let gear1 : BusLane .ironGearWheel 150 := rest.less

  let belt <- busAssemblyLine .transportBelt 1 iron1 gear0
  let cable <- busAssemblyLine .copperCable 2 copper
  let circuit <- busAssemblyLine .electronicCircuit 1 iron2 cable.less
  let inserter <- busAssemblyLine .inserter 1 iron3 gear1 circuit

  let _ <- busAssemblyLine .logisticSciencePack 1 inserter.less belt.less
).toAscii == s!"


 ↑ *** ↓        ↑ *** ↓
 ↑ *A* ↓        ↑ *A* ↓
 ↑⇨***⇨↓        ↑⇨***⇨↓
 ↑  ⚡  ↓        ↑  ⚡  ↓
 ↑ *** ↓↑↑ *** ↓↑ *** ↓↑↑ *** ↓↑↑ *** ↑↓↑↑ *** ↓
 ↑ *A* ↓↑↑↠*A* ↓↑ *A* ↓↑↑↠*A* ↓↑↑↠*A*↠↑↓↑↑↠*A* ↓
 ↑⇨***⇨↓↑↑⇨***⇨↓↑⇨***⇨↓↑↑⇨***⇨↓↑↑⇨***⇦↑↓↑↑⇨***⇨↓
 ↑  ⚡  ↓↑↑  ⚡  ↓↑  ⚡  ↓↑↑  ⚡  ↓↑↑  ⚡  ↑↓↑↑  ⚡  ↓
 ↑  ↓←←←↑↑   ↓←←↑ ↓←←←←↑↑   ↓←←↑↑ →→→→↑↓↑↑ ↓←←←←
 ↑  ↓   ↑↑←←←↓  ↑ ↓    ↑↑←←←↓  ↑↑←↑↓←←←←↑↑←↓
 ↑←←↓   ↑←← ↑↓  ↑←↓    ↑←← ↑↓  ↑←↑↑↓    ↑←↑↓
   ↑↓     ↑ ↑↓   ↑↓      ↑ ↑↓   ↑↥↑↓     ↑↑↓
>⇥*↑↓↦→→⇥*↑ ↑↓↦→→↑→→→→→⇥*↑↦↑→→→⇥↑↦↑→→→→→→↑↑→→→→→>
>→S⇥↓↦→→→S⇥*↑↓↦→→→→→→→→→S→→→→→→→↑⤒        ↑
    →→→→→→→S⇥↓↦→→→→→→→→→→→→→→→→→→↑        ↑
             →→→→→→→→→→→→→→→→→→→→→→→→→→→→→↑

"

end Test
