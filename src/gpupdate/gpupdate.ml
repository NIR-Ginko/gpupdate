(*open Lwt
open Lwt_react*)
(*open Lwt_io*)

let interface_name = "com.redhat.oddjob_gpupdate";;
let object_path = "/";;

let () = Lwt_main.run begin
(*let () = begin*)
  let%lwt system_bus = OBus_bus.system () in
  (*let%lwt peer = OBus_peer.make ~connection:system_bus ~name:interface_name in
  let%lwt proxy = OBus_proxy.make ~peer:peer ~path:[object_path] in*)
  let%lwt proxy = OBus_bus.get_proxy system_bus interface_name [object_path] in
  ( Ogpu_client.Com_redhat_oddjob_gpupdate.gpupdate proxy ~username:"nir" )
end

