let machinename =
  Hostname.machinename
;;

let frontend_module_path = Paths.frontend_module_path ;;

let run_modules moddir =
  let modules = Paths.list_modules moddir in
    List.iter (fun modname -> (let result = Paths.run_module moddir modname in ())) modules
;;

