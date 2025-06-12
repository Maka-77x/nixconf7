{
  config,
  ...
}:
{
  flake = {
    meta.users = {
      mimi = {
        email = "mimi99078878+Maka-77x@users.noreply.github.com";
        name = "Michael Parrett";
        username = "mimi";
        key = "0AAF2901E8040715";
        authorizedKeys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCkwFDi5HxDlr+L3KVhmUdhAu1VD0CmiuI+VhPHRjXjXQP/mltQhagFQBEpBeXJbeOw1e9GDQA+Ij0/zZReVpkA9vD/a7KEfSN026iFzI1qUyJNPbEnAD9fH/TA6dJCspHIykK9vDf3Zl1DQ1OvuDHjBmx+6XZgv8qAaHYOLfE8U/v2GmUhrLbNbzYhaohpcbPL50u/uDtJToIZI7raAm20iITY2l2pj66sTuvN8W1JZRaiSb27ZI5pm2nZPxR7KnVT9ssdLsijOyyuRqwkjfEI1HKLtpor02lzS6hc4wAaEWdWVv+U7ey+ih0Ff7Fn0b05UnYQpN1fwBuFONbzokB0x6l52A/9D+2bUqpXJokY0Ot84QOddLxTeP1GcvXswX/yRjI+ljkDmAfhO5cni0Zq/v9mxwgtUx9TQX70lYmjdMTOOJpsarnnwSebzH1hb1hyoKD7HwUM6mZKwCijEoVSFfq8VjW1zD0d3stTZJOMV2BR9tvaZ8T6cuQIMth51He4lYvd0tmtYowGqB8iVigg3CoEvoVCdG4//TtKST9vOJOSgIdtxRVazj0WnPrfsWXI1oWv1AdlBg/QjjcGnjM/5PCg43dkx0nc0sk3i+TZPl36utunJHVggRorj7xOSSPX8IOkkgsdsOQstOg8rBVcuMHLt7gbaY9RV90PKPHlKw=="
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA98KfahoWZCJKdNqNXGIHBbKE4c4WsUQr+UT2ZdO/nh"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAUzP2TgczfS2tvhMpWof7fzBvxDt+dh/wK3/WWdYPpF"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN2Ve36/FI5XPkC47dsQHilCsRLDn3hNn2zGXf1PYKKd"
        ];
      };
    };
    modules.nixos.mimi =
      { pkgs, lib, ... }:
      {
        programs = {
          ssh = {
            enableAskPassword = true;
            askPassword = "${lib.getExe' pkgs.kdePackages.ksshaskpass "ksshaskpass"}";
            hostKeyAlgorithms = [
              "ssh-ed25519"
              "ssh-rsa"
            ];
            startAgent = false;
          };
          adb.enable = true; # nixos
          less.lessopen = lib.mkDefault null;
          partition-manager.enable = true;
          virt-manager.enable = true;
          xwayland.enable = true;
          obs-studio = {
            plugins = with pkgs.obs-studio-plugins; [
              obs-vkcapture
              input-overlay
              obs-pipewire-audio-capture
              wlrobs
              droidcam-obs
              #inputs.obs-image-reaction.packages.${pkgs.system}.default
            ];
          };
        };

        environment.systemPackages = with pkgs; [
          # Custom scripts for KDE's D-Bus interface
          (pkgs.writeShellScriptBin "qdbus-qt6" "exec -a $0 ${pkgs.kdePackages.qttools}/bin/qdbus $@") # Creates qdbus-qt6 command for Qt6 D-Bus interaction
          (pkgs.writeShellScriptBin "qdbus6" "exec -a $0 ${pkgs.kdePackages.qttools}/bin/qdbus $@") # Creates compatibility alias for qdbus6 for script portability
          # Custom Vivaldi browser build with KDE integration
          (vivaldi.overrideAttrs (oldAttrs: {
            dontWrapQtApps = false; # Enables Qt wrapping for KDE integration
            dontPatchELF = true; # Prevents ELF binary modification
            nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ pkgs.kdePackages.wrapQtAppsHook ]; # Adds Qt wrapping hook
          }))
          # Packages for nixos

          ## KDE System Integration
          kdePackages.breeze # system pkg ## KDE Breeze theme
          kdePackages.krdp # system pkg ## Remote Desktop service
          kdePackages.plasma-thunderbolt # system pkg ## Hardware integration
          kdePackages.qtwayland # system pkg ## Qt Wayland integration
          kdePackages.qtwebsockets # system pkg ## Qt Network WebSockets module
          kdePackages.sddm-kcm # system pkg ## KDE Config Module for SDDM
          kdePackages.xwaylandvideobridge # system pkg ## System bridge

          ## various
          bind-utils # DNS utilities including dig
          lm_sensors

          ## Hardware, Drivers & Core System
          cdrkit # System-level image creation # CD/DVD writing tools, includes genisoimage
          cpufrequtils # CPU frequency scaling utilities
          dmidecode # DMI table decoder for hardware information
          exfat # ExFAT filesystem tools
          fuse # Filesystem support
          gparted # Partition editor (system-wide installation needed)
          hwinfo # Hardware information tool
          intel-gpu-tools
          ladspaPlugins # Often needed system-wide by audio servers
          libGL # Core graphics drivers
          libguestfs-with-appliance # Tools for accessing VM disk images
          libudev-zero # Drop-in replacement for libudev
          libva-utils # Video Acceleration API tools
          lm_sensors # Hardware monitoring tool
          lshw # Hardware lister
          mesa # OpenGL implementation
          microcodeIntel # Intel CPU microcode updates
          pciutils
          ryzenadj # Adjust power management for Ryzen CPUs
          sbctl # Secure Boot management
          spice # Remote display protocol
          spice-gtk # Virtualization infrastructure # GTK client for SPICE
          spice-protocol # SPICE protocol definitions
          usbutils # USB utilities
          util-linux
          virtio-win # VirtIO drivers for Windows guests
          virtiofsd # Shared filesystem daemon for VMs
          virt-manager # Desktop UI for managing virtual machines
          virt-viewer # UI for system virtualization
          win-spice # SPICE for Windows VMs
          wirelesstools # Linux wireless networking tools
          x11docker # Core X11 components
          xdg-utils # Often useful to have system-wide # Desktop integration utilities
          xorg.xhost
          xorg.libX11
          xorriso # ISO 9660 filesystem creation tool
          xz # Core compression utility

          ## System Services & Daemons
          at-spi2-core # Accessibility service
          avahi # Network discovery
          bluez # Core Bluetooth service
          bluez-tools # Command-line tools for BlueZ
          distrobox # Often better system-wide for sharing /nix/store # Use any Linux inside your terminal
          fwupd-efi # EFI firmware updater
          hypridle # System-level session locking/idling # Idle daemon for Hyprland
          hyprlock # Screen locker for Hyprland
          iwd # Wireless daemon
          libvirtd # if virt-manager is used
          lxqt.lxqt-policykit # PolicyKit agent for GVFS permissions
          networkmanager
          nats-server # The server component
          pulseaudioFull # The system's sound server
          sddm-chili-theme # Theme for the system login manager
          udev # Device management
          udisks # Storage device daemon
          wireguard-tools # Kernel-level VPN # VPN tools
        ];
        users.users.mimi = {
          description = config.flake.meta.users.mimi.name;
          isNormalUser = true;
          createHome = true;
          extraGroups = [
            # "audio" # Enabled in 'sound' module
            "disk"
            "docker"
            "corectrl"
            "gamemode"
            "git"
            "input"
            "incus"
            "incus-admin"
            "kvm"
            "libvirtd"
            "lxd"
            "nix"
            "network"
            "networkmanager"
            "power"
            # "podman"  # Enabled in 'virtualisation' module
            "qemu-libvirtd"
            # "sound" # Enabled in 'sound' module
            "tty"
            "video"
            "vboxusers"
            "wheel"
          ];
          shell = pkgs.fish;
          openssh.authorizedKeys.keys = config.flake.meta.users.mimi.authorizedKeys;
          initialPassword = "id";
        };
        nix = {
          settings.trusted-users = [ config.flake.meta.users.mimi.username ];
          daemonCPUSchedPolicy = "idle";
        };
        # hardware.
        home-manager.users.mimi =
          { config, pkgs, ... }:
          {
            home.file = {
              ".face" = {
                source = ../../../files/home/mimi/.face;
                recursive = true;
              };
              "${config.xdg.configHome}/.password-store/.keep" = {
                text = "";
                recursive = true;
              };
            };
            home.packages = with pkgs; [
              # Packages for Home-Manager
              ## KDE GUI
              kdePackages.accounts-qt
              kdePackages.akonadi-search
              kdePackages.akregator
              kdePackages.ark
              kdePackages.discover # Exists in HM
              kdePackages.filelight
              kdePackages.kaccounts-integration
              kdePackages.kaccounts-providers
              kdePackages.kate
              kdePackages.kauth
              kdePackages.kcalc
              kdePackages.kdeconnect-kde
              kdePackages.kdenlive
              kdePackages.kdialog
              kdePackages.kgpg
              kdePackages.khelpcenter # Exists in HM
              kdePackages.kpipewire
              kdePackages.krdc
              kdePackages.krfb
              kdePackages.krohnkite # Dynamic tiling extension for KWin
              kdePackages.ksystemlog
              kdePackages.kup
              kdePackages.kweather
              kdePackages.libksysguard # KDE system monitor library
              kdePackages.okular
              kdePackages.plasma-browser-integration
              kdePackages.plasmatube
              kdePackages.sddm-kcm
              kdePackages.skanlite
              kdePackages.spectacle
              kdePackages.yakuake
              kdePackages.xdg-desktop-portal-kde

              ## GUI
              alacritty
              alacritty-theme
              commafeed
              file-roller # Archive manager for GNOME
              gimp # not in list, but example
              gnome-disk-utility # can be in HM, but needs udisks daemon in NixOS # Disk management tool
              keepassxc # Password manager
              mpv
              nomacs # Image viewer
              obsidian
              podman-desktop # GUI for Podman containers
              signal-desktop
              steam
              steam-run # Run unpatched Linux programs
              thunderbird
              vscodium
              xfce.mousepad # Simple text editor
              zathura # Document viewer
              zed-editor
              obs-studio-plugins.droidcam-obs

              ## various
              adwaita-icon-theme # GNOME's default icon theme
              bashmount # Tool to mount/unmount removable media
              buildah # Container build tool
              cacert # Certificate Authority certificates
              dconf # Low-level configuration system for GNOME
              glxinfo # Display info about OpenGL and GLX
              gnupg # GNU Privacy Guard for encryption
              gnused # GNU stream editor
              gnutar # GNU tar archiver
              grim # Screenshot utility for Wayland
              helix # Modal text editor
              ldns # DNS programming library and tools
              libarchive # Multi-format archive library, provides bsdtar
              libnotify # Desktop notification library
              man-pages # Linux manual pages
              man-pages-posix # POSIX manual pages
              memtest86plus # Memory testing utility
              nmap # Network exploration and security auditing
              nushell # Modern shell
              nvd # Diff tool for comparing Nix packages

              oils-for-unix # Shell replacement (formerly Oil shell)
              openssl # Cryptography and SSL/TLS toolkit
              podman-compose # Docker Compose for Podman
              qt6ct # Qt6 configuration tool
              strace # System call tracer
              sysstat # System performance tools
              ufetch # Tiny system info for Unix-like OSes
              waycheck # Check Wayland compatibility
              wireshark # Network protocol analyzer

              ## Command-Line Tools & Utilities
              appimage-run
              arandr
              aria2
              axel
              backblaze-b2
              bandwhich
              bash-completion
              bat
              bfg-repo-cleaner
              btop
              bulky # Bulk file renamer
              ccze # Log colorizer for better readability
              cpufetch # CPU architecture fetching tool
              curl # Command-line tool for transferring data with URLs
              czkawka # Multi-functional app to find duplicates, similar images, etc.
              dogdns # Modern DNS client alternative to dig
              dos2unix # Text file format converter1
              ed # Line-oriented text editor
              eternal-terminal # Remote terminal that reconnects after disconnections
              exiftool # Read, write and edit metadata
              eza # Modern replacement for 'ls'
              fd # Simple, fast alternative to 'find'
              ffmpeg # Complete solution for recording/converting audio/video
              ffmpegthumbnailer # Video thumbnailing library
              file # Determine file type
              fio # Flexible I/O tester
              fx # Terminal JSON viewer and processor
              fzf # Command-line fuzzy finder
              gawk # GNU awk for text processing
              gh # GitHub CLI
              git # Distributed version control system
              git-filter-repo # Tool for rewriting git repository history
              git-lfs # Git extension for versioning large files
              glab # GitLab CLI client
              glib # Core library for GNOME
              glow # Markdown renderer for terminal
              htop # Interactive process viewer
              iftop # Network bandwidth monitor
              imagemagick # Image manipulation tools
              inetutils # Basic networking utilities
              intel-gpu-tools # Tools for Intel GPU debugging
              iotop # I/O monitoring tool
              ipcalc # IP address calculator
              iperf3 # Network performance measurement tool
              iw # Wireless configuration tool
              jhead # JPEG header manipulation tool
              jq # Lightweight JSON processor
              jujutsu # VCS with feature branches in a stack
              just # Command runner (makefile alternative)
              jupyter
              lazygit # Terminal UI for git
              lazyjj # Terminal UI for jujutsu
              killall
              lsof # List open files
              ltrace # Library call tracer
              luarocks # Lua package manager
              micro # Modern terminal-based text editor
              minicom # Serial communications program
              mitmproxy # HTTPS proxy for debugging
              mtr # Network diagnostic tool
              mutagen # Fast file synchronization
              mutagen-compose # Docker Compose with Mutagen integration
              natscli # CLI for NATS messaging system
              nemo-with-extensions # File manager for Cinnamon
              neofetch # System information tool
              neovim # Vim-fork focused on extensibility
              nethogs # Net top tool grouping by process
              networkmanager # Network connection manager
              networkmanagerapplet # NetworkManager GUI applet
              ouch # Compression/decompression tool
              p7zip # File archiver with high compression ratio
              papirus-folders # Papirus icon theme folder customization
              passt # User-mode networking for containers (required by buildah)
              pciutils # PCI utilities
              powershell # Microsoft PowerShell
              powertop # Power consumption analyzer
              pstree # Display process tree
              pulseaudioFull # Sound server with extra features
              pulsemixer # CLI mixer for PulseAudio
              pasystray
              pv # Pipe Viewer for monitoring data transfer
              ripgrep # Fast recursive search tool
              slurp # Select a region for Wayland
              socat # Multipurpose relay for bidirectional data transfer
              sqlite # Embedded SQL database engine
              sshpass # Non-interactive ssh password authentication
              sshuttle # VPN over SSH
              steampipe # Query cloud infrastructure with SQL
              stress-ng # Stress test tool
              swaybg # Wallpaper tool for Wayland
              tealdeer # Fast tldr client in Rust
              tmux # Terminal multiplexer
              tree
              tree-sitter # Display directory tree structure
              tre-command
              ttyper # Terminal-based typing test
              typst
              typstfmt
              tinymist
              udevil # Mount without root
              unrar
              unzip
              zip
              uutils-coreutils-noprefix # Rust implementation of coreutils
              uv
              vcstool
              vim
              wev # Wayland event viewer
              wget # Non-interactive network downloader
              wl-clipboard # Clipboard utilities for Wayland
              clip
              yazi # Terminal file manager
              yq-go # YAML processor (Go implementation)
              zellij # Terminal workspace with multiplexer
              zsh # Z shell
              zstd # Fast compression algorithm

              ## Development & Nix-Specific Tools
              comma
              gcc # GNU Compiler Collection
              gdb # GNU Debugger
              gnumake # Build automation tool
              nh
              nil # Nix language server
              nix # Package manager
              nix-direnv
              nix-index # Files database for Nix packages
              nix-output-monitor # Improve nix-build output
              nix-prefetch-git # Prefetches git repositories for Nix
              nix-top # Top-like utility for Nix build processes
              nixd # Nix language server with rich diagnostics
              nixfmt-rfc-style # Nix code formatter (RFC style)
              nixos-generators # Generate NixOS images for various formats
              update-nix-fetchgit # Update nix-prefetch-git hashes
              vulnix # NixOS vulnerability scanner
              python313Full
            ];
            programs = {
              bat.enable = true;
              fish.enable = true;
              obs-studio.enable = true;
            };
          };
      };
  };
}
