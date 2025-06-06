{
  flake.module.homeManager.shell = {
    programs.zoxide.enable = true;
    programs.zoxide.enableFishIntegration = true;
  };
}
