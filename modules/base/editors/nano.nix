{
  flake.modules.nixos.base = {
    programs.nano.enable = false;
  };
  flake.modules.homeManager.base = {
    programs.nano.enable = false;
  };
}
