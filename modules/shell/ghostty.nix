{
  unify.modules.shell.home = {
    programs.ghostty.enable = true;
    programs.ghostty.enableFishIntegration = true;
    programs.ghostty.settings = {
      font-family = "Aporetic Sans Mono";
      gtk-titlebar = false;
      gtk-adwaita = false;
      background-opacity = "0.95";
      window-theme = "system";
    };
  };
}
