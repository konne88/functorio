import Functorio.Bus
import Functorio.Cap
import Functorio.Ascii

namespace Test

#guard (bus do
  let iron <- inputs 10 .ironOre 2700
  busTapNoOutput [iron[9], iron[1]] (capN emptyFactoryH)
).toAscii == s!"


  ↑↑
>⇥↥↑↦>
>→→↑
>⇥⤒↦→>
>⇥↑↦→>
>⇥↑↦→>
>⇥↑↦→>
>⇥↑↦→>
>⇥↑↦→>
>⇥↑↦→>
>→↑

"

#guard (bus do
  let iron <- inputs 6 .ironOre 2700
  busTapNoOutput [iron[4], iron[1]] (capN emptyFactoryH)
).toAscii == s!"


  ↑↑
>⇥↥↑↦>
>→→↑
>⇥⤒↦→>
>⇥↑↦→>
>→↑
>→→→→>

"

#guard (bus do
  let iron <- inputs 5 .ironOre 2700
  busTapNoOutput [iron[0], iron[1], iron[2]] (capN emptyFactoryH)
).toAscii == s!"


  ↑↑↑
>→↑↑↑
>→→↑↑
>→→→↑
>→→→→→>
>→→→→→>

"

#guard (bus do
  let iron <- inputs 5 .ironOre 2700
  busTapNoOutput [iron[0], iron[2], iron[4]] (capN emptyFactoryH)
).toAscii == s!"


  ↑↑↑
>→↑↑↑
>→⇥↑↑↦>
>→→↑↑
>→→⇥↑↦>
>→→→↑

"

#guard (bus do
  let iron <- inputs 5 .ironOre 2700
  busTapNoOutput [iron[4], iron[3]] (capN emptyFactoryH)
).toAscii == s!"


  ↑↑←
  ↑ ↑
>⇥↑ ↑↦>
>⇥↑ ↑↦>
>⇥↑ ↑↦>
>⇥↑↦↑
>→↑

"

#guard (bus do
  let iron <- inputs 5 .ironOre 2700
  busTapNoOutput [iron[4], iron[2]] (capN emptyFactoryH)
).toAscii == s!"


  ↑↑
>⇥↑↑↦>
>⇥↥↑↦>
>→→↑
>⇥⤒↦→>
>→↑

"

#guard (bus do
  let iron <- inputs 5 .ironOre 2700
  busTapNoOutput [iron[4], iron[0], iron[1], iron[2]] (capN emptyFactoryH)
).toAscii == s!"


  ↥↑↑↑
>→→↑↑↑
>⇥⤒↦↑↑
>⇥↑↦→↑
>⇥↑↦→→→>
>→↑

"

#guard (bus do
  let petrol <- input .petroleumGas 1
  let water <- input .water 1
  let _ <- inputs 5 .ironOre 2700
  busTapNoOutput [petrol, water] (capN (emptyFactoryH #v[0,2]))
).toAscii == s!"


  | |
>|| |
>→→⇥|↦>
>||||
>→→→→→>
>→→→→→>
>→→→→→>
>→→→→→>

"

#guard (bus do
  let _ <- inputs 5 .ironOre 2700
  let petrol <- input .petroleumGas 1
  let water <- input .water 1
  busTapNoOutput [petrol, water] (capN (emptyFactoryH #v[0,2]))
).toAscii == s!"


  | |
>⇥| |↦>
>⇥| |↦>
>⇥| |↦>
>⇥| |↦>
>⇥| |↦>
>|| |
    |
>||||

"

#guard (bus do
  let iron <- inputs 5 .ironOre 2700
  let petrol <- input .petroleumGas 1
  let water <- input .water 1
  busTapNoOutput [petrol, iron[2], water] (capN emptyFactoryH)
).toAscii == s!"


  |↑|
>⇥|↑|↦>
>⇥┴↑|↦>
>→→↑|
>⇥┬ |↦>
>⇥| |↦>
>|| |
    |
>||||

"

#guard (bus do
  let iron <- inputs 2 .ironOre 2700
  let _coal : BusLane .coal 100 <- busTap [iron[0]] (capN emptyFactoryH)
).toAscii == s!"


  ↑↓
>→↑→→>
>→→→→>

"

#guard (bus do
  let iron <- inputs 5 .ironOre 2700
  let _coal : BusLane .coal 100  <- busTap [iron[2]] (capN emptyFactoryH)
).toAscii == s!"


  ↑↓
>⇥↑↓↦>
>⇥↑↓↦>
>→↑→→>
>→→→→>
>→→→→>

"

#guard (bus do
  let iron <- inputs 5 .ironOre 2700
  let _gear : BusLane .coal 100 <- busTap [iron[1], iron[3]] (capN emptyFactoryH)
).toAscii == s!"


  ↑↑↓
>⇥↑↑↓↦>
>→↑↑→→>
>→⇥↑↦→>
>→→↑
>→→→→→>

"

#guard (bus do
  let iron <- inputs 5 .ironOre 2700
  let _water : BusLane .water 100 <- busTap [iron[2]] (capN emptyFactoryH)
).toAscii == s!"


  ↑|
>⇥↑|↦>
>⇥↑|↦>
>→↑||>
>→→→→>
>→→→→>

"

#guard (bus do
  let iron <- inputs 3 .ironOre 2700
  let (iron0, _) <- split iron[0] (left:=100)
  busTapNoOutput [iron0] (capN emptyFactoryH)
).toAscii == s!"


  *↑
>→S→→>
>→→→→>
>→→→→>

"

#guard (bus do
  let iron <- inputs 4 .ironOre 2700
  let (iron0, _) <- split iron[2] (left:=100)
  busTapNoOutput [iron0] (capN emptyFactoryH)
).toAscii == s!"


   ↑
>→⇥↑↦>
>⇥*↑↦>
>→S→→>
>→→→→>

"

#guard (bus do
  let iron <- inputs 4 .ironOre 2700
  let water <- input .water 1000
  let (iron0, _) <- split iron[2] (left:=100)
  busTapNoOutput [water, iron0] (capN emptyFactoryH)
).toAscii == s!"


  |↑
>⇥┴↑↦>
>⇥*↑↦>
>→S→→>
>⇥┬↦→>
>||

"

#guard (bus do
  let iron <- inputs 5 .ironOre 2700
  let petrol <- input .petroleumGas 1
  let water <- input .water 10
  let (water0, _) <- split (left:=5) water
  busTapNoOutput [petrol, iron[2], water0] (capN emptyFactoryH)
).toAscii == s!"


  |↑|
>⇥|↑|↦>
>⇥┴↑|↦>
>→→↑|
>⇥┬ |↦>
>⇥| |↦>
>|| |
    |
>|||||>

"

#guard (bus do
  let iron <- inputs 10 .ironOre 2700
  let petrol <- input .petroleumGas 1
  let water <- input .water 10
  let (water0, _) <- split (left:=5) water
  busTapNoOutput [petrol, iron[2], water0] (capN emptyFactoryH)
).toAscii == s!"


  |↑|
>⇥|↑|↦>
>⇥┴↑|↦>
>→→↑|
>⇥┬ |↦>
>⇥| |↦>
>⇥| |↦>
>⇥| |↦>
>⇥| |↦>
>⇥| |↦>
>⇥| |↦>
>|| |
    |
>|||||>

"

-- TODO we're getting iron1[0] but it should be iron1[1]
#guard (bus do
  let iron0 <- inputs 3 .ironOre 2700
  let water <- input .water 1000
  let iron1 <- inputs 3 .ironOre 2700
  let (water0, _) <- split (left:=1) water
  busTapNoOutput [water0, iron1[0], iron1[1], iron0[0], iron0[1], iron0[2]] (capN emptyFactoryH)
).toAscii == s!"


  |↑↑↑↑↑←
  |↑↑↑↑←↑
  |↑↑↑←↑↑
  |↑↑←↑↑↑
  |↑ ↥↑↑↑
>⇥|↑↦→↑↑↑
>⇥|↑ ⤒↦↑↑
>⇥|↥ ↑↦→↑
>|||┤↑├|||>
>→⇥⤒↦↑
>→→↑
>→→→→→→→→→>

"

-- TODO we're getting iron1[0] but it should be iron1[1]
#guard (bus do
  let iron0 <- inputs 3 .ironOre 2700
  let water <- input .water 1000
  let iron1 <- inputs 3 .ironOre 2700
  let (water0, _) <- split (left:=1) water
  busTapNoOutput [water0, iron1[0], iron1[1], iron0[0]] (capN emptyFactoryH)
).toAscii == s!"


  |↑↑↑←
  |↑↑←↑
  |↑ ↥↑
>⇥|↑↦→↑
>⇥|↑ ⤒↦→>
>⇥|↥ ↑↦→>
>|||┤↑├|>
>→⇥⤒↦↑
>→→↑
>→→→→→→→>

"

#guard (bus do
  let iron <- inputs 6 .ironOre 2700
  let water <- input .water 1000
  let (iron0, _) <- split iron[2] (left:=100)
  let (iron1, _) <- split iron[4] (left:=100)
  busTapNoOutput [water, iron0, iron1] (capN emptyFactoryH)
).toAscii == s!"


  |↑↑
>⇥┴↑↑↦>
>⇥*↑↑↦>
>→S⇥↑↦>
>→⇥*↑↦>
>→→S→→>
>⇥┬↦→→>
>||

"

#guard (bus do
  let iron <- inputs 10 .ironOre 2700
  let (iron0, _) <- split iron[6] (left:=100)
  let (iron1, _) <- split iron[4] (left:=100)
  let (iron2, _) <- split iron[2] (left:=100)
  let _coal : BusLane .coal 4 <- busTap [iron0, iron1, iron2] (capN emptyFactoryH)
).toAscii == s!"


   ↑↑↑→→→→↓
   ↑↑↑←←←←↓
   ↑↑←←  ↑↓
   ↑  ↑  ↑↓
>→⇥↑↦⇥↑↦⇥↑↓↦>
>→⇥↑↦⇥↑ *↑↓↦>
>→⇥↑↦⇥↑↦S⇥↓↦>
>→⇥↑ *↑↦→⇥↓↦>
>→⇥↑↦S→→→⇥↓↦>
>⇥*↑↦→→→→⇥↓↦>
>→S→→→→→→⇥↓↦>
>→→→→→→→→⇥↓↦>
>→→→→→→→→⇥↓↦>
>→→→→→→→→⇥↓↦>
          →→>

"

#guard (bus do
  let iron <- inputs 15 .ironOre 2700
  let petrol <- input .petroleumGas 2
  let (petrol0, petrol1) <- split (left:=1) petrol
  let water <- input .water 2
  let (water0, water1) <- split (left:=1) water
  busTapNoOutput [petrol0, iron[0], water0] (capN emptyFactoryH)
  pipePumps
  busTapNoOutput [water1, iron[5], petrol1] (capN emptyFactoryH)
).toAscii == s!"

      **
      *↯
  ┴↑|  ⚡    |↑|
>→→↑|       |↑|
>⇥┬ |↦→→→→→⇥|↑|↦>
>⇥| |↦→→→→→⇥|↑|↦>
>⇥| |↦→→→→→⇥|↑|↦>
>⇥| |↦→→→→→⇥┴↑|↦>
>⇥| |↦→→→→→→→↑|
>⇥| |↦⇥⚡↦→→⇥┬ |↦>
>⇥| |↦→→→→→⇥| |↦>
>⇥| |↦→→→→→⇥| |↦>
>⇥| |↦→→→→→⇥| |↦>
>⇥| |↦→→→→→⇥| |↦>
>⇥| |↦→→→→→⇥| |↦>
>⇥| |↦→→→→→⇥| |↦>
>⇥| |↦⇥⚡↦→→⇥| |↦>
>⇥| |↦→→→→→⇥| |↦>
>||┤|├|||*P┤|├|
    |       |
>||||||||*P||

"

#guard (bus do
  let iron0 <- input .ironPlate 10
  let iron1 <- input .ironPlate 15
  let _ <- merge iron0 iron1
).toAscii == s!"

   →↓
   ↑⤓
  →↑←
  ↑→↑
  *S↧
  ↑↑↓
>→↑↑→→>
>→→↑

"

-- #guard (bus do
--   let copper <- input .copperPlate 750
--   let _ <- busAssemblyLine .copperCable 5 copper
-- ).toAscii == s!"


--  ↑ *** ↓
--  ↑ *A* ↓
--  ↑⇨***⇨↓
--  ↑  ⚡  ↓
--  ↑  ↓←*↓
--  ↑↓←←↓S←
--  ↑↓ ↑←→↓
--  ↑→⇥⚡↦↑↓
--  ↑ *** ↓
--  ↑ *A* ↓
--  ↑⇨***⇨↓
--  ↑  ⚡  ↓
--  ↑ *** ↓
--  ↑ *A* ↓
--  ↑⇨***⇨↓
--  ↑  ⚡  ↓
--  ↑ *** ↓
--  ↑ *A* ↓
--  ↑⇨***⇨↓
--  ↑  ⚡  ↓
--  ↑ *** ↓
--  ↑ *A* ↓
--  ↑⇨***⇨↓
--  ↑  ⚡  ↓
--  ↑↓←←←←←
--  ↑↓
--  ↑↓
-- >↑→→→→→→>

-- "
