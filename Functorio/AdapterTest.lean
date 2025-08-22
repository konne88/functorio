import Functorio.Adapter
import Functorio.Ascii

#guard (adapterV (interface:=[(.coal,.N), (.coal,.N)]) #v[0,1] #v[0,1]).toAscii == s!"
 ^^
 ^^
"

#guard (adapterV (interface:=[(.coal,.N), (.coal,.N)]) #v[0,1] #v[2,3]).toAscii == s!"
 ^^
 ↑↑←←
 ↑←←↑
   ^^
"

#guard (adapterV (interface:=[(.coal,.N), (.coal,.N)]) #v[2,3] #v[0,1]).toAscii == s!"
   ^^
 →→↑↑
 ↑→→↑
 ^^
"

#guard (adapterV (interface:=[(.coal,.N), (.coal,.N)]) #v[0,1] #v[0,3]).toAscii == s!"
 ^^
 ↑↑←←
 ^  ^
"

#guard (adapterV (interface:=[(.water,.N), (.lubricant,.N), (.crudeOil,.N)]) #v[0,2,4] #v[5,8,10]).toAscii == s!"
 ^ ^ ^
 | | |||||||
 | |       |
 | ||||||| |
 |       | |
 ||||||  | |
      ^  ^ ^
"

#guard (adapterV (interface:=[(.water,.N), (.ironOre,.N), (.crudeOil,.N)]) #v[0,2,4] #v[5,8,10]).toAscii == s!"
 ^ ^ ^
 | ↑ |||||||
 | ↑←←←←←← |
 ||||||  ↑ |
      ^  ^ ^
"
