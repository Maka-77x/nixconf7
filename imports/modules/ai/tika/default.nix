{
  unify.modules.ai.nixos = {
    services.tika.enable = true;
    services.tika.configFile = ./tika-config.xml;
  };

    networking.firewall.allowedTCPPorts = [
      80
    ];
  };
}
