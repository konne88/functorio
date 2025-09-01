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

#guard (station RecipeName.superconductor).toAscii == s!"
  ^ ^^      ^v
  | ↑↑⇨****⇦↑↓
  | ↑↑↠****↠↑↓
  |┤↑↑├**E* ↑↓
  | ↑↑⚡****⚡↑↓
  ^ ^^      ^v
"

-- TODO all of these are broken some some reason or another
-- #eval (IO.print ((station RecipeName.supercapacitor).toAscii))  -- 4 inputs
-- #eval (IO.print ((station RecipeName.electrolyte).toAscii))     -- 2 input fluids
-- #eval (IO.print ((station RecipeName.electromagneticSciencePack).toAscii))  -- 2 input fluids

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
