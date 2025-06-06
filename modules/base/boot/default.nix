{
  flake.modules.nixos.base.boot = {
    initrd.systemd.enable = true;

    tmp.useTmpfs = true;
    tmpcleanOnBoot = true;
  };
}
