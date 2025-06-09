{
  inputs,
  ...
}:
{
  flake.modules = {
    nixos.desktop =
      { pkgs, lib, ... }:
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

        nixpkgs.config.allowBroken = false;
        nixpkgs.config.allowUnsupportedSystem = true;
        nixpkgs.config.permittedInsecurePackages = [ ];
        nixpkgs.config.allowAliases = true;
        nixpkgs.config.enableParallelBuildingByDefault = false;
        nixpkgs.config.showDerivationWarnings = [ ];
        nixpkgs.config.packageOverrides = pkgs: {
          vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
        };

        services.xserver.xkb = {
          # options = "eurosign:e";
        };
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
        programs.kde-pim.enable = true;
        environment.defaultPackages = lib.mkForce [
          pkgs.rsync
          pkgs.parted
          pkgs.gptfdisk
          pkgs.e2fsprogs
        ];
        # Remove unneeded KDE apps
        environment.plasma6.excludePackages = [
          pkgs.kdePackages.elisa
          pkgs.kdePackages.oxygen
          pkgs.ibus
        ];
      };

    homeManager.desktop =
      { pkgs, lib, ... }:
      {
        nixpkgs.config.allowUnfree = true;
        nixpkgs.overlays = [ inputs.self.overlays.default ];
        services.mpris-proxy.enable = true;
        services.network-manager-applet.enable = true;
        programs.droidcam.enable = true;
        programs.kdeconnect.enable = true;
        programs.kdeconnect.package = lib.mkForce pkgs.kdePackages.kdeconnect-kde;
        programs.mosh.enable = true;
        programs.localsend.enable = true;
        programs.nm-applet.enable = true;
        services.zerotierone.enable = true;
        # services.zerotierone.joinNetworks = secrets.zerotierone.networks;
        programs.wireshark.enable = true;
        programs.wireshark.package = pkgs.wireshark;
        services.blueman-applet.enable = true;
        services.playerctld.enable = true;
        services.kdeconnect.enable = true;
        services.kdeconnect.package = pkgs.kdePackages.kdeconnect-kde;
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
          pkgs.local.gh-flake-update
          vlc
          vscode-runner
          zotero
        ];
      };
  };
}
