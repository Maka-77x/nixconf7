{
  flake.modules.nixos."nixos/gouda" = {
    services.xserver.xkb.layout = "gb";

    services.thermald.enable = true;
    services.avahi.enable = true;
    services.deluge.enable = true;
    services.deluge.web.enable = true;
  };
}
