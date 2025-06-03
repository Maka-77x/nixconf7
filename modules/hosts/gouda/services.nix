{
  unify.hosts.nixos.gouda.nixos = {
    services = {
      xserver = {
        xkb = {
          layout = "gb";
        };
      };
      thermald.enable = true;
      avahi.enable = true;
      deluge = {
        enable = true;
        web.enable = true;
      };
    };
  };
}
