type expression_a =
    | Affect of string * expression_a * int
    | Plus  of expression_a * expression_a * int
    | Moins of expression_a * expression_a * int
    | Mult  of expression_a * expression_a * int 
    | Mod   of expression_a * expression_a * int 
    | And   of expression_a * expression_a * int
    | Or    of expression_a * expression_a * int
    | Neg   of expression_a * int 
    | Num   of float
    | Egal  of expression_a * expression_a * int
    | NotEql of expression_a * expression_a * int
    | Sup   of expression_a * expression_a * int
    | Sup_egal of expression_a * expression_a * int
    | Inf_egal   of expression_a * expression_a * int
    | Inf   of expression_a * expression_a * int
    | Non of expression_a * int
    | Bool of bool
    | Var of string
    | Nan of string
;;
let convert_to_num = String.concat "\n" ["TypeOf";
                                        "Case 2";
                                        "BoToNumber";
                                        "Jump 6";
                                        "Noop";
                                        "Jump 4";
                                        "Noop";
                                        "Jump 2";
                                        "Drop";
                                        "CsteNb NaN"];;
let size_convert_to_num = 10;;

let convert_to_bool = String.concat "\n" ["TypeOf";
                                        "Case 2";
                                        "Noop";
                                        "Jump 6";
                                        "NbToBe";
                                        "Jump 4";
                                        "Noop";
                                        "Jump 2";
                                        "Drop";
                                        "CsteNb NaN"];;
 let size_convert_to_bool = 10;;

let get_size_expression expression =
  match expression with
  | Affect (_,_,i) -> i
  | Plus  (_,_,i) -> i
  | Or  (_,_,i) -> i
  | And  (_,_,i) -> i
  | Moins (_,_,i) -> i
  | Mult  (_,_,i) -> i
  | Mod  (_,_,i) -> i
  | Sup  (_,_,i) -> i
  | Sup_egal  (_,_,i) -> i
  | Inf  (_,_,i) -> i
  | Inf_egal  (_,_,i) -> i
  | Egal  (_,_,i) -> i
  | NotEql (_,_,i) ->i
  | Neg    (_,i)   -> i
  | Non    (_,i)    -> i
  | Nan _       -> 1
  | Num    _    -> 1
  | Bool    _    -> 1
  | Var    _    -> 1

;;


(* Fonctions d'affichage *)

let rec expression_code expression =
  match expression with
  | Affect (v,e,_) -> Printf.sprintf "%s\n%s %s\n%s %s" (expression_code e) "SetVar" v "GetVar" v
  | Plus  (g,d,_) -> Printf.sprintf "%s\n%s\n%s\n%s\n%s" (expression_code g) convert_to_num (expression_code d) convert_to_num "AddiNb"
  | Moins (g,d,_) -> Printf.sprintf "%s\n%s\n%s\n%s\n%s" (expression_code g) convert_to_num (expression_code d) convert_to_num "SubsNb"
  | Mult  (g,d,_) -> Printf.sprintf "%s\n%s\n%s\n%s\n%s" (expression_code g) convert_to_num (expression_code d) convert_to_num "MultNb"
  | Mod  (g,d,_) -> Printf.sprintf "%s\n%s\n%s\n%s\n%s" (expression_code g) convert_to_num (expression_code d) convert_to_num "ModuNb"
  | Sup  (g,d,_) -> Printf.sprintf "%s\n%s\n%s\n%s\n%s" (expression_code g) convert_to_num (expression_code d) convert_to_num "GrStNb"
  | And  (g,d,_) -> Printf.sprintf "%s\n%s\n%s\n%s %n\n%s" (expression_code g)
                                                                          "Copy"
                                                                          convert_to_bool
                                                                          "ConJmp" (get_size_expression d)
                                                                          (expression_code d)
  | Or  (g,d,_) -> Printf.sprintf "%s\n%s\n%s\n%s\n%s %n\n%s" (expression_code g)
                                                                          "Copy"
                                                                          convert_to_bool
                                                                          "ConJmp 1"
                                                                          "Jump" (get_size_expression d)
                                                                          (expression_code d)
  | Sup_egal  (g,d,_) -> Printf.sprintf "%s\n%s\n%s\n%s\n%s" (expression_code g) convert_to_num (expression_code d) convert_to_num "GrEqNb"
  | Inf  (g,d,_) -> Printf.sprintf "%s\n%s\n%s\n%s\n%s" (expression_code g) convert_to_num (expression_code d) convert_to_num "LoStNb"
  | Inf_egal  (g,d,_) -> Printf.sprintf "%s\n%s\n%s\n%s\n%s" (expression_code g) convert_to_num (expression_code d) convert_to_num "LoEqNb"
  | Egal  (g,d,_) -> Printf.sprintf "%s\n%s\n%s\n%s\n%s" (expression_code g) convert_to_num (expression_code d) convert_to_num "Equals"
  | NotEql (g,d,_) -> Printf.sprintf "%s\n%s\n%s\n%s\n%s" (expression_code g) convert_to_num (expression_code d) convert_to_num "NotEql"
  | Neg    (e,_)    -> Printf.sprintf "%s\n%s\n%s" (expression_code e) convert_to_num "NegaNb"
  | Non    (e,_)    -> Printf.sprintf "%s\n%s\n%s" (expression_code e) convert_to_bool "Not"
  
  | Num    n    -> Printf.sprintf "%s %f" "CsteNb" n
  | Bool    b    -> Printf.sprintf "%s %B" "CsteBo" b
  | Var    s    -> Printf.sprintf "%s %s" "GetVar" s
  | Nan u     -> "CsteNb NaN"
  
  let print_gen_code programme =

    String.concat (expression_code programme) [""; "\nHalt"]
    
    
;; 
