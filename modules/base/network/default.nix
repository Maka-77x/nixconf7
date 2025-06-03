{
  unify.modules.base.nixos =
    { hostConfig, ... }:
    {
      networkin.hostName = hostConfig.name;
      networkin.networkmanager.enable = true;
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

      users.users.mimi.extraGroups = [
        "networkmanager"
      ];

    };
}
