{
  flake.modules = {
    nixos.base = {
      boot.initrd.systemd.enable = true;

      boot.tmp.useTmpfs = true;
      boot.tmp.cleanOnBoot = true;
    };
  };
}
