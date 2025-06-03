{
  unify.modules.base.nixos = {
    # See https://github.com/NixOS/nixpkgs/pull/308801
    system.switch.enable = false;
    system.switch.enableNg = true;
  };
}
