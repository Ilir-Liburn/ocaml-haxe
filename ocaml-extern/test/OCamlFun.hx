external id : 'a -> 'a = "%identity"
val const : 'a -> 'b -> 'a
val flip : ('a -> 'b -> 'c) -> 'b -> 'a -> 'c
val negate : ('a -> bool) -> 'a -> bool
exception Finally_raised of exn
val protect : finally:(unit -> unit) -> (unit -> 'a) -> 'a
