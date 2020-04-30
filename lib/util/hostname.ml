let machinename =
  let host = Unix.gethostname () in
  let upperhost = String.uppercase_ascii host in
    upperhost ^ "$"
;;

