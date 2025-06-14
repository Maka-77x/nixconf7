{
  flake.modules.nixos."hosts/gouda" = {
    networking = {
      firewall.allowedUDPPorts = [ 5678 ];
      interfaces.wlan0.useDHCP = true;
    };

    # 	 enable systemd DNS resolver daemon
    services = {
      commafeed.enable = true;
      deluge = {
        enable = true;
        web.enable = true;
      };
      libinput.enable = true;
      pcscd.enable = true;
      ratbagd.enable = true;
      resolved = {
        enable = true;
        dnssec = "allow-downgrade";
        dnsovertls = "opportunistic";
        # ideally our fallbackDns should be something more widely available
        # but I do not want my last resort to sell my data to every company available
        # NOTE: DNS fallback is not a recovery DNS
        # See <https://github.com/systemd/systemd/issues/5771#issuecomment-296673115>
        fallbackDns = [
          "9.9.9.9"
          "9.9.9.10"
          "9.9.9.11"
          "2620:fe::9"
          "2620:fe::10"
          "2620:fe::11"
        ];
        extraConfig = ''
          		MulticastDNS=no # This is handled by Avahi.
           	'';
      };
    };
  };
}
