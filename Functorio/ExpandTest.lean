import Functorio.Factory
import Functorio.Expand
import Functorio.Column
import Functorio.Ascii

#guard (
  (@emptyFactoryH [(.coal,.S), (.coal,.N), (.water,.N)] #v[0,2,4]).expand .S 3
).toAscii == s!"
 v ^ ^
 ↓ ↑ |
 ↓ ↑ |
 ↓ ↑ |
 v ^ ^
"

#guard (column
  ((@emptyFactoryH [(.coal,.S), (.coal,.N), (.water,.N)] #v[0,2,4]).expand .N 2)
  ((@emptyFactoryH [(.coal,.S), (.coal,.N), (.water,.N)] #v[0,2,4]).expand .S 3)
).toAscii == s!"
 v ^ ^
 ↓ ↑ |
 ↓ ↑ |
 ↓ ↑ |
 ↓ ↑ |
 ↓ ↑ |
 v ^ ^
"
