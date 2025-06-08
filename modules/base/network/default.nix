{
  flake.modules = {
    nixos.base =
      { hostConfig, lib, ... }:
      {
        networking.hostName = hostConfig.name;
        networking.useDHCP = false;
        networking.nftables.enable = true;
        networking.search = [ ];
        networking.networkmanager.enable = true;
        networking.networkmanager.dns = "systemd-resolved";

        networking.nameservers = [
          "9.9.9.9"
          "9.9.9.10"
          "9.9.9.11"
          "2620:fe::9"
          "2620:fe::10"
          "2620:fe::11"
        ];
        networking.firewall.allowedTCPPorts = [
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
        networking.firewall.allowedTCPPortRanges = [
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
        networking.firewall.allowedUDPPorts = [
          137
          138
          3483
        ];
        networking.firewall.allowedUDPPortRanges = [
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
        systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
        systemd.network.wait-online.enable = false;
        systemd.network.enable = lib.mkForce false;
      };
  };
}
