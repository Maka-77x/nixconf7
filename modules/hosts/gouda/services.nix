{
  unify.hosts.nixos.gouda.nixos = {
    services.xserver.xkb.layout = "gb";

    services.thermald.enable = true;
    services.avahi.enable = true;
    services.deluge.enable = true;
    services.deluge.web.enable = true;
  };
}
