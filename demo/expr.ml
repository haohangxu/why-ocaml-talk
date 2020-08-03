open Std_internal

type property =
  | Sent_from        of string
  | Sent_to          of string
  | Subject_contains of string

type filter =
  | Property of property
  | And      of filter * filter
  | Or       of filter * filter
  | Not      of filter

(* Example filters

   "Anything that looks like a rollout email"

   {[ 
      (Or (Property (Sent_to "rollouts@email.com"),
           Property (Subject_contains "rollout")))
   ]}

   "Anything sent to haohang that's not sent from mom"
 
   {[
      (And (Property (Sent_to "haohang@email.com"),
           (Not (Property (Sent_from "mom@email.com")))))
   ]}
*)

type email =
  { from : string
  ; to_ : string
  ; subject : string
  }

let has_property email property =
  match property with
  | Sent_from address          -> email.from = address
  | Sent_to address            -> email.to_ = address
  | Subject_contains substring -> is_substring email.subject substring
;;

let rec evaluate_filter email filter =
  let eval filter = evaluate_filter email filter in
  match filter with
  | Property property -> has_property email property
  | And (x, y)        -> eval x && eval y
  | Or (x, y)         -> eval x || eval y
  | Not x             -> not (eval x)
;;
