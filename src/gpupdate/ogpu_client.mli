
module Com_redhat_oddjob_gpupdate : sig
  val gpupdate_computer : OBus_proxy.t -> unit Lwt.t
  val gpupdate : OBus_proxy.t -> username : string -> unit Lwt.t
  val gpupdatefor : OBus_proxy.t -> username : string -> unit Lwt.t
end
