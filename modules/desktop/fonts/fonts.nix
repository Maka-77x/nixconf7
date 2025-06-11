{
  flake.modules = {
    nixos.desktop =
      { pkgs, ... }:
      {
        fonts.packages = with pkgs; [
          dina-font
          aporetic
          monaspace
          anonymousPro
          corefonts
          cozette
          fira-code
          fira-mono
          font-awesome
          lmodern
          martian-mono
          nerd-fonts._0xproto
          nerd-fonts.droid-sans-mono
          nerd-fonts.agave
          nerd-fonts.anonymice
          nerd-fonts.arimo
          nerd-fonts.aurulent-sans-mono
          nerd-fonts.cousine
          nerd-fonts.fantasque-sans-mono
          nerd-fonts.gohufont
          nerd-fonts.jetbrains-mono
          nerd-fonts.liberation
          nerd-fonts.monaspace
          #     nerd-fonts.mplus
          nerd-fonts.mononoki
          nerd-fonts.meslo-lg
          nerd-fonts.overpass
          nerd-fonts.proggy-clean-tt
          nerd-fonts.roboto-mono
          nerd-fonts.symbols-only
          nerd-fonts.space-mono
          nerd-fonts.victor-mono
          nerd-fonts.zed-mono
          mplus-outline-fonts.githubRelease
          dina-font
          proggyfonts
          # 		powerline-fonts
          #     serious-shanns
          source-code-pro
          openmoji-color
          twitter-color-emoji
        ];
        fonts.fontconfig = {
          defaultFonts = {
            emoji = [ "Twitter Color Emoji" ];
            monospace = [ "Aporetic Sans Mono" ];
            sansSerif = [ "Aporetic Sans Mono" ];
            serif = [ "Aporetic Sans Mono" ];
          };
        };
      };
    homeManager.desktop = {
      fonts = {
        fontconfig.enable = true;
      };
    };
  };
}
