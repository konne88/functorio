import Functorio.AssemblyStation
import Functorio.Ascii

#guard (station RecipeName.ironPlate).toAscii ==s!"
  ^     v
  ↑⇨***⇨↓
  ↑ *F* ↓
  ↑⚡***⚡↓
  ^     v
"

-- TODO: It would be prettier if all inputs were on the left
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

#guard (station RecipeName.flyingRobotFrame).toAscii == s!"
 ^^^     ^v
 ↑↑↥↠***↠↑↓
 ↑↑↠⚡*A*⚡↑↓
 ↑↑⤒⇨***⇦↑↓
 ^^^     ^v
"

-- TODO: this is currently broken
#guard (station RecipeName.rail).toAscii == s!"
 ^^     ^v
 ↑↑⇨***!↑↓
 ↑↑↠*A*↠↑↓
 ↑↑⚡***⚡↑↓
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

-- TODO: need power
#guard (station RecipeName.heavyOilCracking).toAscii == s!"
  ^ ^     v
  |┤|├***||
  | | *C* |
  | ||*** |
  ^ ^     v
"

-- TODO: need power
#guard (station RecipeName.advancedOilProcessing).toAscii == s!"
  ^ ^       v v v
  | | *****|| | |
  |┤|├***** | | |
  | | **O**┤|├| |
  | ||***** | | |
  | | *****┤| |├|
  ^ ^       v v v
"

-- TODO: need power for inserters
#guard (station RecipeName.rocketPart).toAscii == s!"
  ^           ^^
  ↑⇨*********⇦↑↑
  ↑ *********↞↑↑
  ↑ ********* ↑↑
  ↑ ********* ↑↑
  ↑ ****L**** ↑↑
  ↑ ********* ↑↑
  ↑ ********* ↑↑
  ↑ ********* ↑↑
  ↑⚡*********⚡↑↑
  ^           ^^
"
