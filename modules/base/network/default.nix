{
  flake.modules.nixos.base =
    { hostConfig, lib, ... }:
    {
      networking.hostName = hostConfig.name;
      networking.networkmanager.enable = true;
      networking.networkmanager.dns = "systemd-resolved";
      networking.useDHCP = false;
      networking.nameservers = [
        "9.9.9.9"
        "9.9.9.10"
        "9.9.9.11"
        "2620:fe::9"
        "2620:fe::10"
        "2620:fe::11"
      ];
      networking.firewall.allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      networking.firewall.allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      networking.nftables.enable = true;
      networking.search = [ ];

      systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false;
      systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
      systemd.network.wait-online.enable = false;
      systemd.network.enable = lib.mkForce false;

      users.users.mimi.extraGroups = [
        "networkmanager"
      ];

    };
}
