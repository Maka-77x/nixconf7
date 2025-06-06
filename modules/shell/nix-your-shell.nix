{
  flake.module.homeManager.shell = {
    programs.nix-your-shell.enable = true;
    programs.nix-your-shell.enableNushellIntegration = false;
    programs.nix-your-shell.enableZshIntegration = false;
  };
}
