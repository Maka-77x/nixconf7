{
  unify.modules.base.nixos.boot = {
    initrd.systemd.enable = true;

    tmp.useTmpfs = true;
    tmpcleanOnBoot = true;
  };
}
