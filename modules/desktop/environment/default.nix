{
  inputs,
  ...
}:
{
  nixpkgs.allowedUnfreePackages = [
    # Intel camera/media
    "ipu6-camera-bins"
    "ipu6-camera-bins-unstable"
    "ivsc-firmware"
    "ivsc-firmware-unstable"
    "ivsc-firmware-unstable-2024-06-14-zstd"

    # Graphics drivers
    "nvidia-x11"
    "nvidia-settings"
    "cuda-toolkit"

    # Hardware firmware
    "broadcom-bt-firmware"
    "b43-firmware"

    # Other common unfree
    "steam"
    "discord"
    "spotify"
    "zerotierone"

    "vivaldi"
    "wootility"
    "corefonts"
  ];
  flake.modules = {
    nixos.desktop =
      { pkgs, lib, ... }:
      {
        xdg = {
          autostart.enable = true;
          portal = {
            config.common.default = "kde";
            config.hyprland.default = [
              "hyprland"
              "gtk"
            ];
            extraPortals = with pkgs; [
              kdePackages.xdg-desktop-portal-kde
              xdg-desktop-portal-wlr
            ];
            xdgOpenUsePortal = true;
            wlr.enable = true;
          };
        };

        nixpkgs = {
          config = {
            allowBroken = false;
            allowUnsupportedSystem = true;
            permittedInsecurePackages = [ ];
            allowAliases = true;
            enableParallelBuildingByDefault = false;
            showDerivationWarnings = [ ];
          };
        };

        services = {
          xserver = {
            excludePackages = with pkgs; [ xterm ];
            enable = lib.mkForce false;
            videoDrivers = [ "modesetting" ];
            xkb = {
              layout = "gb";
              variant = "";
              options = "eurosign:e";
            };
          };

          zerotierone.enable = true;
          # zerotierone.joinNetworks = secrets.zerotierone.networks;

          desktopManager = {
            gnome.enable = false;
            plasma6.enable = true;
            plasma6.enableQt5Integration = false;
          };

          displayManager = {
            gdm.enable = false;
            sddm = {
              enable = true;
              enableHidpi = true;
              wayland.enable = true;
              wayland.compositor = "kwin";
            };
            defaultSession = "plasma";
          };
        };
        programs = {
          droidcam.enable = true;
          kdeconnect.enable = true;
          kdeconnect.package = lib.mkForce pkgs.kdePackages.kdeconnect-kde;
          kde-pim.enable = true;
          mosh.enable = true;
          localsend.enable = true;
          nm-applet.enable = true;
          wireshark.enable = true;
          wireshark.package = pkgs.wireshark;
        };

        environment.defaultPackages = lib.mkForce [
          pkgs.rsync
          pkgs.parted
          pkgs.gptfdisk
          pkgs.e2fsprogs
        ];

        environment.plasma6.excludePackages = [
          pkgs.kdePackages.elisa
          pkgs.kdePackages.oxygen
          pkgs.ibus
        ];
      };

    homeManager.desktop =
      { pkgs, ... }:
      {
        xdg.portal.xdgOpenUsePortal = true;
        nixpkgs = {
          config.allowUnfree = true;
          overlays = [ inputs.self.overlays.default ];
        };
        services = {
          blueman-applet.enable = true;
          playerctld.enable = true;
          kdeconnect.enable = true;
          kdeconnect.package = pkgs.kdePackages.kdeconnect-kde;
          mpris-proxy.enable = true;
          network-manager-applet.enable = true;
        };
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
