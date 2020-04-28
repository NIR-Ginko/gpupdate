open Cmdliner;;
open Unix;;

type verbosity = Quiet | Fatal | Warning | Normal | Debug

(* Main function *)
let gpoa loglevel username =
  ( Printf.printf "%d\n" loglevel
  ; print_endline username )
;;

(* Get Machine Name for Active Directory *)
let machinename =
    let host = Unix.gethostname () in
    let upperhost = String.uppercase_ascii host in
      upperhost ^ "$"
;;

let loglevel =
  let doc = "Set the logging verbosity" in
  Arg.(value & opt int 1 & info ["l"; "loglevel"] ~docv:"LOGLEVEL" ~doc)

let username =
  let doc = "User name to apply group policies for" in
  Arg.(value & pos 0 string machinename & info [] ~docv:"USERNAME" ~doc)

let info =
  let doc = "Apply Group Policies for specified user" in
  Term.info "gpoa" ~version:"1.0" ~doc ~exits:Term.default_exits

let gpoa_t = Term.(const gpoa $ loglevel $ username)

let main () =
  Term.exit @@ Term.eval (gpoa_t, info)
;;

main ()

