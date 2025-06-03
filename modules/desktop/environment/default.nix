{
  unify.modules.desktop.nixos =
    { pkgs, ... }:
    {
      xdg = {
        portal = {
          config.common.default = "kde";
          extraPortals = with pkgs; [ kdePackages.xdg-desktop-portal-kde ];
        };
      };

      services = {
        xserver = {
          enable = true;
          xkb = {
            #             options = "eurosign:e";
          };
        };
        desktopManager = {
          plasma6 = {
            enable = true;
          };
        };
        displayManager = {
          sddm = {
            enable = true;
          };
        };
      };

      # Only for Winbox
      networking = {
        firewall.allowedUDPPorts = [ 5678 ];
      };
    };

  unify.modules.desktop.home =
    { pkgs, ... }:
    {
      nixpkgs.config.allowUnfree = true;

      home.packages = with pkgs; [
        kdePackages.accounts-qt
        kdePackages.akonadi-search
        kdePackages.akregator
        kdePackages.ark
        kdePackages.filelight
        kdePackages.kaccounts-integration
        kdePackages.kaccounts-providers
        kdePackages.kate
        kdePackages.kauth
        kdePackages.kcalc
        kdePackages.kdialog
        kdePackages.kgpg
        kdePackages.kpipewire
        kdePackages.krdc
        kdePackages.krfb
        kdePackages.ksystemlog
        kdePackages.kweather
        kdePackages.okular
        kdePackages.plasma-browser-integration
        kdePackages.plasmatube
        kdePackages.sddm-kcm
        kdePackages.spectacle
        kdePackages.yakuake
        kdePackages.xdg-desktop-portal-kde
        krita
        vlc
        vscode-runner
        zotero
      ];
    };
}
