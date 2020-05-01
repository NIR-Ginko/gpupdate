let frontend_module_path =
  "/usr/lib/gpoa/frontend"
;;

let frontend_module_pre_path =
  "/usr/lib/gpoa/frontend_pre"
;;

let frontend_module_post_path =
  "/usr/lib/gpoa/frontend_post"
;;

let cache_dir =
  "/var/lib/gpupdate"
;;

let is_regular_file fullpath =
  let ftype = (Unix.stat fullpath).Unix.st_kind in
    match ftype with
      Unix.S_REG -> true
        | _ -> false
;;

let is_executable_file fullpath =
  let fperm = (Unix.stat fullpath).Unix.st_perm in
    match fperm with
      0o755 -> true
        | _ -> false
;;

let list_modules moddir =
  let files = (Array.to_list (Sys.readdir moddir)) in
    List.filter (fun filename -> let full_path = (Filename.concat moddir filename) in
      if is_regular_file full_path && is_executable_file full_path then true else false)
      files
;;

let run_module moddir modname =
  let full_path = Filename.concat moddir modname in
  let result = Sys.command full_path in
    result
;;

