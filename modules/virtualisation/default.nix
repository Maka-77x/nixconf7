{
  unify.modules.virtualisation.nixos = {
    virtualisation.oci-containers.backend = "podman";
    virtualisation.containers.registries.search = [ "docker.io" ];
    virtualisation.podman.enable = true;
    virtualisation.podman.defaultNetwork.settings.dns_enabled = true;
    virtualisation.podman.dockerCompat = true;
    virtualisation.podman.dockerSocket.enable = true;
    virtualisation.podman.autoPrune.enable = true;
    virtualisation.podman.autoPrune.flags = [ "--all" ];
    virtualisation.podman.autoPrune.dates = "weekly";

  };
}
