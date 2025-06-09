{
  flake.modules = {
    nixos."hosts/gouda" =
      { pkgs, lib, ... }:
      {
        networking.firewall.allowedUDPPorts = [ 5678 ];

        networking.interfaces.wlan0.useDHCP = true;

        # 	 enable systemd DNS resolver daemon
        services.resolved.enable = true;
        services.resolved.dnssec = "allow-downgrade";
        services.resolved.dnsovertls = "opportunistic";
        # ideally our fallbackDns should be something more widely available
        # but I do not want my last resort to sell my data to every company available
        # NOTE: DNS fallback is not a recovery DNS
        # See <https://github.com/systemd/systemd/issues/5771#issuecomment-296673115>
        services.resolved.fallbackDns = [
          "9.9.9.9"
          "9.9.9.10"
          "9.9.9.11"
          "2620:fe::9"
          "2620:fe::10"
          "2620:fe::11"
        ];
        services.resolved.extraConfig = ''
          		MulticastDNS=no # This is handled by Avahi.
           	'';
        services.mpris-proxy.enable = true;
        services.network-manager-applet.enable = true;
        programs.droidcam.enable = true;
        programs.kdeconnect.enable = true;
        programs.kdeconnect.package = lib.mkForce pkgs.kdePackages.kdeconnect-kde;
        programs.mosh.enable = true;
        programs.localsend.enable = true;
        programs.nm-applet.enable = true;
        services.zerotierone.enable = true;
        # services.zerotierone.joinNetworks = secrets.zerotierone.networks;
        programs.wireshark.enable = true;
        programs.wireshark.package = pkgs.wireshark;
      };
  };
}
