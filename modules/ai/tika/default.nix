{
  flake.modules.nixos.ai = {
    services.tika.enable = true;
    services.tika.configFile = ./tika-config.xml;

    networking.firewall.allowedTCPPorts = [
      80
    ];
  };
}
