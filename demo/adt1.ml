open! Core
open! Std_internal

let map_of_known_spirit_animals =
  [ "bruce wayne", "bat"
  ; "peter parker", "spider"
  ; "rocket", "raccoon"
  ; "haohang", "rock"
  ]
  |> String.Map.of_alist_exn
;;

let get_spirit_animal name_of_person =
  String.Map.find map_of_known_spirit_animals name_of_person
;;
