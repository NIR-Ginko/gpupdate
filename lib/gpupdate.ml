(*open Unix;;*)
open Sqlite3;;

class virtual storage (id : string) =
  object
    val default_registry_name = "registry"
    val default_registry_path = "/var/cache/gpupdate"

    method get_id =
      id
  end;;

(*let full_registry_name = String.concat "" [default_registry_path; "/"; default_registry_name; ".sqlite3"];;*)

let mkregdir dirname =
  Unix.mkdir dirname 0o640
;;

let db = db_open "db.sqlite3"

