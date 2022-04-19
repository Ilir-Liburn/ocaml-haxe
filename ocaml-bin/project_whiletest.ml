exception BOOL of bool;;
exception STRING of string;;
exception INT of int;;
exception FLOAT of float;;

let getString () = while true do
ignore (raise (STRING "123123"));
done;
"123"
;;

let getParam () = while true do
ignore (raise (BOOL false));
done;
true
;;

let () = let i = ref 0 in
while !i < 10 do
i := !i + 1;
Printf.printf "%i %b" !i (getParam ());
done;
;;


