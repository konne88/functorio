import Functorio.AssemblyStation
import Functorio.Ascii

#guard (station RecipeName.ironPlate).toAscii ==s!"
 ^     v
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ^     v
"

#guard (station RecipeName.electronicCircuit).toAscii == s!"
 ^     ^v
 ↑⇨***⇦↑↓
 ↑ *A*↠↑↓
 ↑⚡***⚡↑↓
 ^     ^v
"

#guard (station RecipeName.advancedCircuit).toAscii == s!"
 ^^     ^v
 ↑↑⇨***⇦↑↓
 ↑↑↠*A*↠↑↓
 ↑↑⚡***⚡↑↓
 ^^     ^v
"

#guard (station RecipeName.superconductor).toAscii == s!"
  ^ ^^      ^v
  | ↑↑⇨****⇦↑↓
  | ↑↑↠****↠↑↓
  |┤↑↑├**E* ↑↓
  | ↑↑⚡****⚡↑↓
  ^ ^^      ^v
"

#guard (station { recipe := .accumulator, fabricator := .electromagneticPlant }).toAscii == s!"
 ^      ^v
 ↑⇨****⇦↑↓
 ↑ ****↠↑↓
 ↑ **E* ↑↓
 ↑⚡****⚡↑↓
 ^      ^v
"

#guard (station RecipeName.supercapacitor).toAscii == s!"
  ^ ^^^      ^v
  | ↑↑↥⇨****↠↑↓
  | ↑↑↠↠****⇦↑↓
  |┤↑↑⤒├**E* ↑↓
  | ↑↑↑⚡****⚡↑↓
  ^ ^^^      ^v
"

#guard (station RecipeName.electromagneticSciencePack).toAscii == s!"
  ^ ^ ^^      v
  |┤| ↑↑ ├|   ↓
  | | ↑↑⇨****⇨↓
  | | ↑↑↠**** ↓
  | | ↑↑ **E* ↓
  | | ↑↑⚡****⚡↓
  | |┤↑↑  ├|  ↓
  ^ ^ ^^      v
"

#guard (station RecipeName.electrolyte).toAscii == s!"
  ^ ^ ^     v
  |┤| ↑ ├|  |
  | | ↑⇨****|
  | | ↑ ****|
  | | ↑ **E*|
  | | ↑⚡****|
  | |┤↑  ├| |
  ^ ^ ^     v
"

#guard (station RecipeName.flyingRobotFrame).toAscii == s!"
 ^^^     ^v
 ↑↑↥↠***↠↑↓
 ↑↑↠⚡*A*⚡↑↓
 ↑↑⤒⇨***⇦↑↓
 ^^^     ^v
"

#guard (station RecipeName.rail).toAscii == s!"
 ^^     ^v
 ↑↑⇨***⇦↑↓
 ↑↑↠*A*↠↑↓
 ↑↑ ***↠↑↓
 ↑↑  ⚡  ↑↓
 ^^     ^v
"

#guard (station RecipeName.processingUnit).toAscii == s!"
  ^ ^     ^v
  | ↑⇨***⇦↑↓
  |┤↑├*A*↠↑↓
  | ↑⚡***⚡↑↓
  ^ ^     ^v
"

#guard (station RecipeName.battery).toAscii == s!"
  ^ ^     ^v
  |┤↑├***⇦↑↓
  | ↑⇨*C*↠↑↓
  | ↑⚡***⚡↑↓
  ^ ^     ^v
"

#guard (station RecipeName.sulfuricAcid).toAscii == s!"
  ^ ^     ^ v
  |┤↑├***┤↑├|
  | ↑⇨*C*⇦↑ |
  | ↑⚡***⚡↑ |
  ^ ^     ^ v
"

#guard (station RecipeName.sulfur).toAscii == s!"
  ^ ^     v
  |┤|├***⇨↓
  | | *C* ↓
  | ||***⚡↓
  ^ ^     v
"

#guard (station RecipeName.solidFuelFromLightOil).toAscii == s!"
  ^     v
  ||***⇨↓
  | *C* ↓
  | ***⚡↓
  ^     v
"

#guard (station RecipeName.rocketFuel).toAscii == s!"
  ^ ^     v
  | ↑⇨***⇨↓
  |┤↑├*A* ↓
  | ↑⚡***⚡↓
  ^ ^     v
"

#guard (station RecipeName.heavyOilCracking).toAscii == s!"
  ^ ^     v
  |┤|├***||
  | | *C* |
  | ||*** |
  | |  ⚡  |
  ^ ^     v
"

#guard (station RecipeName.advancedOilProcessing).toAscii == s!"
  ^ ^       v v v
  | | *****|| | |
  |┤|├***** | | |
  | | **O**┤|├| |
  | ||***** | | |
  | | *****┤| |├|
  | |   ⚡   | | |
  ^ ^       v v v
"

#guard (station RecipeName.rocketPart).toAscii == s!"
 ^           ^^
 ↑⇨*********⇦↑↑
 ↑ *********↞↑↑
 ↑ ********* ↑↑
 ↑⚡*********⚡↑↑
 ↑ ****L**** ↑↑
 ↑ ********* ↑↑
 ↑ ********* ↑↑
 ↑ ********* ↑↑
 ↑⚡*********⚡↑↑
 ^           ^^
"
