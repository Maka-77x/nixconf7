{
  flake.modules.homeManager.dev = {
    programs.lazygit.enable = true;
    programs.lazygit.settings.git.overrideGpg = true;
  };
}
