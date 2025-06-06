{
  flake.modules.nixos.base = {
    programs.command-not-found.enable = false;
  };

  flake.modules.homeManager.base = {
    programs.command-not-found.enable = false;
  };
}
