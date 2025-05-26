{
  unify.modules.base.nixos = {
    system.autoUpgrade = {
      enable = false;
      flake = "github:Maka-77x/nixconf7";
      allowReboot = true;
    };
  };
}
