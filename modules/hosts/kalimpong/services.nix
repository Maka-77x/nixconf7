{
  unify.hosts.nixos.kalimpong.nixos = {
    services = {
      xserver = {
        xkb = {
          layout = "gb";
        };
      };
      thermald.enable = true;
      avahi.enable = true;
    };
  };
}
