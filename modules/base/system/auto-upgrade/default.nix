{
  unify.modules.base.nixos = {
    system.autoUpgrade.enable = false;
    system.autoUpgrade.flake = "github:Maka-77x/nixconf7";
    system.autoUpgrade.allowReboot = true;
  };
}
