{
  unify.modules.desktop.nixos =
    { pkgs,lib, ... }:
    {
      xdg.autostart.enable = true;

      xdg.portal.config.common.default = "kde";
      xdg.portal.config.hyprland.default = [
        "hyprland"
        "gtk"
      ];

      xdg.portal.extraPortals = with pkgs; [ kdePackages.xdg-desktop-portal-kde ];
      xdg.portal.xdgOpenUsePortal = true;
      xdg.portal.wlr.enable = true;

      services.xserver.xkb = { /* options = "eurosign:e"; */ };
      services.xserver.excludePackages = with pkgs; [ xterm ];
      services.xserver.enable = lib.mkForce false;
      services.xserver.displayManager.gdm.enable = false;
      services.xserver.desktopManager.gnome.enable = false;

      services.xserver.videoDrivers = [ "modesetting" ];
      services.xserver.xkb.layout = "gb";
      services.xserver.xkb.variant = "";

      services.desktopManager.plasma6.enable = true;
      services.desktopManager.plasma6.enableQt5Integration = false;
      services.displayManager.sddm.enable = true;
      services.displayManager.sddm.enableHidpi = true;
      services.displayManager.sddm.wayland.enable = true;
      services.displayManager.sddm.wayland.compositor = "kwin";
      services.displayManager.defaultSession = "plasma";

      networking.firewall.allowedUDPPorts = [ 5678 ];
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
