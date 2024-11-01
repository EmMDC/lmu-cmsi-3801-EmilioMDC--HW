exception Negative_Amount

let change amount =
  if amount < 0 then
    raise Negative_Amount
  else
    let denominations = [25; 10; 5; 1] in
    let rec aux remaining denominations =
      match denominations with
      | [] -> []
      | d :: ds -> (remaining / d) :: aux (remaining mod d) ds
    in
    aux amount denominations

(* Problem 1 --First Applied *)
let first_then_apply array predicate consumer =
  match List.find_opt predicate array with
  | None -> None
  | Some matched_element -> consumer matched_element

(* Problem 2 -- Powers Generator *)
let powers_generator base = 
  let rec generate_from power () =
    Seq.Cons (power,generate_from (power * base))
  in
  generate_from 1

(* Problem 3 -- Line Count *)
let meaningful_line_count filename = 
  let meaningful_line line =
    let trimmed_line = String.trim line in
    String.length trimmed_line > 0 && not (String.starts_with ~prefix:"#" trimmed_line)
  in
  let input_file = open_in filename in
  let finally () = close_in input_file in
  let rec count_lines line_count =
    try
      let line = input_line input_file in
      if meaningful_line line then
        count_lines (line_count + 1)
      else 
        count_lines line_count
    with 
      End_of_file -> line_count
  in
  Fun.protect ~finally (fun () -> count_lines 0);;

(* Problem 4 -- Shapes Surface Area/Volume*)
type shape = 
  | Sphere of float
  | Box of float * float * float

let volume shape_item = 
  match shape_item with 
  | Sphere radius -> Float.pi *. (radius ** 3.) *. 4. /. 3.
  | Box (length, width, height) -> length *. width *. height

let surface_area shape_item = 
  match shape_item with
  | Sphere radius -> Float.pi *. (radius ** 2.) *. 4.
  | Box (length, width, height) -> 2. *. (length *. width +. height *. length +. height *. width)

(* Problem 5 -- Binary Search Tree *)
type 'a binary_search_tree = 
  | Empty 
  | Node of 'a binary_search_tree * 'a * 'a binary_search_tree

let rec size tree = 
  match tree with 
  | Empty -> 0
  | Node (left_child, _, right_child) -> 1 + size left_child + size right_child

let rec insert value tree =
  match tree with
  | Empty -> Node(Empty, value, Empty)
  | Node (left_child, node_value, right_child) -> 
    if value < node_value then
      Node (insert value left_child, node_value, right_child)
    else if value > node_value then
      Node (left_child, node_value, insert value right_child)
    else 
      tree 

let rec contains value tree =
  match tree with
  | Empty -> false
  | Node (left_child, node_value, right_child) -> 
    if value < node_value then 
      contains value left_child
    else if value > node_value then
      contains value right_child 
    else
      true

let rec inorder tree = 
  match tree with 
  | Empty -> []
  | Node (left_child, node_value, right_child) -> inorder left_child @ [node_value] @ inorder right_child