{
  flake.modules.nixos.virtualisation = {
    virtualisation = {
      oci-containers.backend = "podman";
      containers.registries.search = [ "docker.io" ];

      podman = {
        enable = true;
        defaultNetwork.settings.dns_enabled = true;
        defaultNetwork.settings.ipv6_enabled = true;
        dockerCompat = true;
        dockerSocket.enable = true;
        autoPrune.enable = true;
        autoPrune.flags = [ "--all" ];
        autoPrune.dates = "weekly";
      };
    };
  };
}
