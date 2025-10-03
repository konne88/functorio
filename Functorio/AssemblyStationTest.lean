import Functorio.AssemblyStation
import Functorio.Ascii

#guard (station (recipe .ironPlate)).toAscii == s!"
 ^     v
 ↑⇨***⇨↓
 ↑ *F* ↓
 ↑⚡***⚡↓
 ^     v
"

#guard (station (recipe .electronicCircuit)).toAscii == s!"
 ^     ^v
 ↑⇨***⇦↑↓
 ↑ *A*↠↑↓
 ↑⚡***⚡↑↓
 ^     ^v
"

#guard (station (recipe .advancedCircuit)).toAscii == s!"
 ^^     ^v
 ↑↑⇨***⇦↑↓
 ↑↑↠*A*↠↑↓
 ↑↑⚡***⚡↑↓
 ^^     ^v
"

#guard (station (recipe .superconductor)).toAscii == s!"
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

#guard (station (recipe .supercapacitor)).toAscii == s!"
  ^ ^^^      ^v
  | ↑↑↥⇨****↠↑↓
  | ↑↑↠↠****⇦↑↓
  |┤↑↑⤒├**E* ↑↓
  | ↑↑↑⚡****⚡↑↓
  ^ ^^^      ^v
"

#guard (station (recipe .electromagneticSciencePack)).toAscii == s!"
  ^ ^ ^^      v
  |┤| ↑↑ ├|   ↓
  | | ↑↑⇨****⇨↓
  | | ↑↑↠**** ↓
  | | ↑↑ **E* ↓
  | | ↑↑⚡****⚡↓
  | |┤↑↑  ├|  ↓
  ^ ^ ^^      v
"

#guard (station (recipe .electrolyte)).toAscii == s!"
  ^ ^ ^     v
  |┤| ↑ ├|  |
  | | ↑⇨****|
  | | ↑ ****|
  | | ↑ **E*|
  | | ↑⚡****|
  | |┤↑  ├| |
  ^ ^ ^     v
"

#guard (station (recipe .flyingRobotFrame)).toAscii == s!"
 ^^^     ^v
 ↑↑↥↠***↠↑↓
 ↑↑↠⚡*A*⚡↑↓
 ↑↑⤒⇨***⇦↑↓
 ^^^     ^v
"

#guard (station (recipe .rail)).toAscii == s!"
 ^^     ^v
 ↑↑⇨***⇦↑↓
 ↑↑↠*A*↠↑↓
 ↑↑ ***↠↑↓
 ↑↑  ⚡  ↑↓
 ^^     ^v
"

#guard (station (recipe .processingUnit)).toAscii == s!"
  ^ ^     ^v
  | ↑⇨***⇦↑↓
  |┤↑├*A*↠↑↓
  | ↑⚡***⚡↑↓
  ^ ^     ^v
"

#guard (station (recipe .battery)).toAscii == s!"
  ^ ^     ^v
  |┤↑├***⇦↑↓
  | ↑⇨*C*↠↑↓
  | ↑⚡***⚡↑↓
  ^ ^     ^v
"

#guard (station (recipe .sulfuricAcid)).toAscii == s!"
  ^ ^     ^ v
  |┤↑├***┤↑├|
  | ↑⇨*C*⇦↑ |
  | ↑⚡***⚡↑ |
  ^ ^     ^ v
"

#guard (station (recipe .sulfur)).toAscii == s!"
  ^ ^     v
  |┤|├***⇨↓
  | | *C* ↓
  | ||***⚡↓
  ^ ^     v
"

#guard (station (recipe .solidFuelFromLightOil)).toAscii == s!"
  ^     v
  ||***⇨↓
  | *C* ↓
  | ***⚡↓
  ^     v
"

#guard (station (recipe .rocketFuel)).toAscii == s!"
  ^ ^     v
  | ↑⇨***⇨↓
  |┤↑├*A* ↓
  | ↑⚡***⚡↓
  ^ ^     v
"

#guard (station (recipe .heavyOilCracking)).toAscii == s!"
  ^ ^     v
  |┤|├***||
  | |⚡*C* |
  | ||*** |
  ^ ^     v
"

#guard (station (recipe .advancedOilProcessing)).toAscii == s!"
  ^ ^       v v v
  | | *****|| | |
  |┤|├***** | | |
  | |⚡**O**┤|├| |
  | ||***** | | |
  | | *****┤| |├|
  ^ ^       v v v
"

#guard (station (recipe .rocketPart)).toAscii == s!"
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

#guard (station (recipe .pentapodEgg)).toAscii == s!"
  ^ ^     ^v
  |┤↑├***⇦↑↓
  | ↑⇨*B*↠↑↓
  | ↑⚡***⚡↑↓
  ^ ^     ^v
"

#guard (station (recipe .nutrientsFromBioflux)).toAscii == s!"
 ^^     v
 ↑↑⇨***⇨↓
 ↑↑↠*B*⇨↓
 ↑↑↠***⇨↓
 ↑↑⚡⇩⇩⇩⚡↓
 ↑↑ →→→→↓
 ^^     v
"
