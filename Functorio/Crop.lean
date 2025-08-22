import Functorio.Factory

private def cropOption {n e s w} (f:Factory n e s w) : Option (Factory n e s w) :=
  let xs := f.entities.map (fun e => e.x)
  let ys := f.entities.map (fun e => e.y)
  do
    let xMin <- List.min? xs
    let xMax <- List.max? xs
    let yMin <- List.min? ys
    let yMax <- List.max? ys
    some {
      width := xMax - xMin + 1,
      height:= yMax - yMin + 1,
      entities:= f.entities.map (fun e => {
        x := e.x - xMin,
        y := e.y - yMin,
        type := e.type
      }),
      interface := {
        n := decreaseOffset xMin (f.interface.n)
        e := decreaseOffset yMin (f.interface.e)
        s := decreaseOffset xMin (f.interface.s)
        w := decreaseOffset yMin (f.interface.w)
      }
      name := f.name
    }

-- Removes empty space from all sides of the factory.
def crop {n e s w} (f:Factory n e s w) : Factory n e s w :=
  (cropOption f).getD f
