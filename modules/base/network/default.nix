{
  flake.modules.nixos.base =
    { hostConfig, lib, ... }:
    {
      systemd = {
        services.NetworkManager-wait-online.enable = lib.mkForce false;
        network.wait-online.enable = false;
        network.enable = lib.mkForce false;
      };
      networking = {
        hostName = hostConfig.name;
        useDHCP = false;
        nftables.enable = true;
        search = [ ];
        networkmanager.enable = true;
        networkmanager.dns = "systemd-resolved";

        nameservers = [
          "9.9.9.9"
          "9.9.9.10"
          "9.9.9.11"
          "2620:fe::9"
          "2620:fe::10"
          "2620:fe::11"
        ];
        firewall.allowedTCPPorts = [
          22
          80
          443
          139
          445
          9000
          9090
          3483
          32400
        ];
        firewall.allowedTCPPortRanges = [
          {
            from = 1714;
            to = 1764;
          }
          {
            from = 32768;
            to = 65535;
          }
          {
            from = 8520;
            to = 8522;
          }
        ];
        firewall.allowedUDPPorts = [
          137
          138
          3483
        ];
        firewall.allowedUDPPortRanges = [
          {
            from = 1714;
            to = 1764;
          }
          {
            from = 60000;
            to = 61000;
          }
          {
            # for mosh
            from = 60001;
            to = 60010;
          }
        ];
      };

    };
}
