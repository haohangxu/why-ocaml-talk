type order = { quantity : int }
type execution = { shares : int }

type exchange_message =
  | New_order of order
  | Execution of execution

let size_on_exchange current_size message =
  match message with
  | New_order o -> current_size + o.quantity
  | Execution e -> current_size - e.shares
;;
