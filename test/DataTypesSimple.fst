module DataTypesSimple

open FStar.HyperStack.ST

type t = | Cons1 | Cons2

type point = | Point2D: x:Int32.t -> y:Int32.t -> point

// Can't get * and + to resolve here
// module I32 = FStar.Int32
// todo restore this with proper preconditions
//let magnitude = function
//  | Point2D x y -> I32.mul x (I32.add x (I32.mul y y))
      // FStar.Int32.(x * x + y * y)

let f (): Stack t (fun _ -> true) (fun _ _ _ -> true) =
  Cons1

val main: Int32.t -> FStar.Buffer.buffer (FStar.Buffer.buffer C.char) ->
  Stack Int32.t (fun _ -> true) (fun _ _ _ -> true)
let main argc argv =
  push_frame ();
  let x = Cons1, Cons2 in
  let y = Point2D 0l 1l in
  let z = match f () with
    | Cons1 -> 0ul
    | Cons2 -> 1ul
  in
  pop_frame ();
  C.exit_success
