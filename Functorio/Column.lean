import Functorio.Factory
import Functorio.Expand
import Functorio.Adapter
import Functorio.Util

private def columnPerfect {n e s w e' s' w'} (top : Factory n e s w) (bot:Factory s e' s' w'): Factory n (e ++ e') s' (w ++ w') :=
  if top.interface.s != bot.interface.n then impossible! "perfect column must have exactly the same interface positions" else
  if top.width != bot.width then impossible! "perfect column must have exactly the same width" else
  let width := top.width
  {
    width := width,
    height := top.height + bot.height,
    entities := top.entities ++ bot.entities.map (Entity.offsetPosition 0 top.height)
    wires := top.wires ++ bot.wires.map fun wire => wire.incrementLabels top.entities.length
    interface :=
    {
      n := top.interface.n
      e := cast (by simp) (top.interface.e ++ increaseOffset top.height (bot.interface.e))
      s := bot.interface.s
      w := cast (by simp) (top.interface.w ++ increaseOffset top.height (bot.interface.w))
    }
    name := s!"col({top.name},{bot.name})"
  }

private def columnSameWidth {n e s w e' s' w'} (top : Factory n e s w) (bot:Factory s e' s' w') (adapterMinHeight:Nat) : Factory n (e ++ e') s' (w ++ w') :=
  if top.width != bot.width then impossible! s!"same width of factories expected {top.width}" else
  let width := top.width
  let adapter := adapterV (top.interface.s) (bot.interface.n) width adapterMinHeight
  columnPerfect top (columnPerfect adapter bot)

def column {n e s w e' s' w'} (top : Factory n e s w) (bot:Factory s e' s' w') (adapterMinHeight := 0) : Factory n (e ++ e') s' (w ++ w') :=
  -- Similar code in rowTwo

  -- Align the two factories on their 0th interface,
  -- then expand the smaller one to match the bigger one's size.
  if (top.width > bot.width) then
    let diff := top.width - bot.width
    let shift := if top.interface.s.isEmpty then 0
                 else min diff ((top.interface.s)[0]! - (bot.interface.n)[0]!)
    columnSameWidth top ((bot.expand .E (diff - shift)).expand .W shift) adapterMinHeight else
  if (top.width < bot.width) then
    let diff := bot.width - top.width
    let shift := if top.interface.s.isEmpty then 0
                 else min diff ((bot.interface.n)[0]! - (top.interface.s)[0]!)
    columnSameWidth ((top.expand .E (diff - shift)).expand .W shift) bot adapterMinHeight else
  columnSameWidth top bot adapterMinHeight

def columnList {i} (fs:List (Factory i [] i [])) : Factory i [] i [] :=
  match fs with
  | f::fs => fs.foldl column f
  | [] => error! "can't make a column with empty list of factories yet"

def column3 {n e s w e' s' w' e'' s'' w''} (top : Factory n e s w) (middle:Factory s e' s' w') (bot:Factory s'  e'' s'' w'') : Factory n (e ++ e' ++ e'') s'' (w ++ w' ++ w'') :=
  column (column top middle) bot
