open Cmdliner;;

type verbosity = Quiet | Fatal | Warning | Normal | Debug

(* Main function *)
let gpoa loglevel username =
  let frontend_path = Gpupdate.frontend_module_path in
  ( Printf.printf "%d\n" loglevel
  ; Gpupdate.run_modules frontend_path
  ; print_endline username )
;;

let loglevel =
  let doc = "Set the logging verbosity" in
  Arg.(value & opt int 1 & info ["l"; "loglevel"] ~docv:"LOGLEVEL" ~doc)

let username =
  let doc = "User name to apply group policies for" in
  Arg.(value & pos 0 string Gpupdate.machinename & info [] ~docv:"USERNAME" ~doc)

let info =
  let doc = "Apply Group Policies for specified user" in
  Term.info "gpoa" ~version:"1.0" ~doc ~exits:Term.default_exits

let gpoa_t = Term.(const gpoa $ loglevel $ username)

let main () =
  Term.exit @@ Term.eval (gpoa_t, info)
;;

main ()

