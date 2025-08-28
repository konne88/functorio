import Functorio.AssemblyLine
import Functorio.Ascii

#guard (assemblyLine .advancedCircuit 3).toAscii == s!"


 ↑↑⇨***⇦↑↓
 ↑↑↠*A*↠↑↓
 ↑↑⚡***⚡↑↓
 ↑↑⇨***⇦↑↓
 ↑↑↠*A*↠↑↓
 ↑↑⚡***⚡↑↓
 ↑↑⇨***⇦↑↓
 ↑↑↠*A*↠↑↓
 ↑↑⚡***⚡↑↓
 ^^     ^v
"

#guard (bus do
  let acid <- input .sulfuricAcid (75/2)
  let green <- input .electronicCircuit 150
  let red <- input .advancedCircuit 15
  let _ <- busAssemblyLine RecipeName.processingUnit 1 acid.exact green red
).toAscii == s!"


  | ↑⇨***⇦↑↓
  |┤↑├*A*↠↑↓
  | ↑⚡***⚡↑↓
  |→↑     ↑↓
  |↑ →→→→→↑↓
  |↑ ↑↓←←←←←
  |↑ ↑↓
>||↑ ↑→→→→→→>
>→⇥↑↦↑
>→→↑

"

#guard (bus do
  let copper <- input .copperPlate 750
  let _ <- busAssemblyLine RecipeName.copperCable 5 copper
).toAscii == s!"


 ↑⇨***⇨↓
 ↑ *A* ↓
 ↑⚡***⚡↓
 ↑  ↓←*↓
 ↑↓←←↓S←
 ↑↓ ↑←→↓
 ↑→⇥⚡↦↑↓
 ↑⇨***⇨↓
 ↑ *A* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *A* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *A* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *A* ↓
 ↑⚡***⚡↓
 ↑←↓←←←←
  ↑↓
>→↑→→→→→>

"

instance : Config where
  generateBigPoles := true
  generateRoboports := true
  providerChestCapacity := 3
  adapterMinHeight := 3

#guard (bus do
  let ironOre <- input .ironOre 600
  let _ <- busAssemblyLine RecipeName.ironPlate 16 ironOre
).toAscii = s!"


 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ↑ ****↓
 ↑ ****↓
 ↑ **R*↓
 ↑ ****↓
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ↑ ****↓
 ↑ ****↓
 ↑ **R*↓
 ↑ ****↓
 ↑     ↓
 ↑  ⚡🄿⇦↓
 ↑     ↓
 ↑     ↓
 ↑  ** ↓
 ↑  *↯ ↓
 ↑ ↓←←←←
 ↑ ↓
 ↑←↓
  ↑↓
>→↑→→→→→>

"

-- TODO: rails are still broken :(
#guard (bus do
  let stone <- input .stone 750
  let steel <- input .steelPlate 750
  let stick <- input .ironStick 750
  let _ <- busAssemblyLine RecipeName.rail 5 stone stick steel
).toAscii == s!"


 ↑↑⇨***!↑↓
 ↑↑↠*A*↠↑↓
 ↑↑⚡***⚡↑↓
 ↑↑  ↓←*↥↓
 ↑↑↓←←↓S←←
 ↑↑↓ ↑←→→↓
 ↑↑→⇥⚡↦↑⤒↓
 ↑↑⇨***!↑↓
 ↑↑↠*A*↠↑↓
 ↑↑⚡***⚡↑↓
 ↑↑⇨***!↑↓
 ↑↑↠*A*↠↑↓
 ↑↑⚡***⚡↑↓
 ↑↑⇨***!↑↓
 ↑↑↠*A*↠↑↓
 ↑↑⚡***⚡↑↓
 ↑↑⇨***!↑↓
 ↑↑↠*A*↠↑↓
 ↑↑⚡***⚡↑↓
 ↑↑ ****↑↓
 ↑↑ ****↑↓
 ↑↑ **R*↑↓
 ↑↑ ****↑↓
 ↑↑     ↥↓
 ↑↑  ⚡ 🄿⇦↓
 ↑↑     ⤒↓
 ↑↑     ↑↓
 ↑↑  ** ↑↓
 ↑↑  *↯ ↑↓
 ↑↑  →→→↑↓
 ↑↑← ↑↓←←←
 ↑←↑ ↑↓
  ↑↑ ↑↓
>→↑↑ ↑→→→→>
>→⇥↑↦↑
>→→↑

"
