(*open Lwt*)
open Ogpu_interfaces

module Com_redhat_oddjob_gpupdate =
struct
  open Com_redhat_oddjob_gpupdate


  let gpupdate_computer proxy =
    OBus_method.call m_gpupdate_computer proxy ()

  let gpupdate proxy ~username =
    OBus_method.call m_gpupdate proxy username

  let gpupdatefor proxy ~username =
    OBus_method.call m_gpupdatefor proxy username
end
