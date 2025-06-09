{
  config,
  ...
}:
{
  flake.meta.users.mimi = {
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
  modules.nixos.mimi =
    { pkgs, lib, ... }:
    {
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
        vscodium
        obsidian
        fuse
        comma
        commafeed
        fuse
        kdePackages.khelpcenter
        kdePackages.discover
        kdePackages.krdp
        adwaita-icon-theme # GNOME's default icon theme
        alacritty # GPU-accelerated terminal emulator
        alacritty-theme
        appimage-run # Run AppImage applications
        arandr # XRandR GUI for screen layout
        aria2 # Multi-protocol & multi-source download utility
        at-spi2-core # Accessibility toolkit
        avahi # mDNS/DNS-SD service discovery
        axel # Light download accelerator
        backblaze-b2 # Command-line tool for Backblaze B2 cloud storage
        bandwhich # Terminal bandwidth utilization tool
        bash-completion # Command completion for bash
        bashmount # Tool to mount/unmount removable media
        bat # Modern replacement for 'cat'
        bfg-repo-cleaner # Git repository cleaner for removing sensitive data
        bind # DNS utilities including dig
        bluez # Bluetooth protocol stack
        bluez-tools # Command-line tools for BlueZ
        btop # Resource monitor with advanced visualization
        buildah # Container build tool
        bulky # Bulk file renamer
        cacert # Certificate Authority certificates
        ccze # Log colorizer for better readability
        cdrkit # CD/DVD writing tools, includes genisoimage
        cpufetch # CPU architecture fetching tool
        cpufrequtils # CPU frequency scaling utilities
        curl # Command-line tool for transferring data with URLs
        czkawka # Multi-functional app to find duplicates, similar images, etc.
        dconf # Low-level configuration system for GNOME
        distrobox # Use any Linux distribution inside your terminal
        dmidecode # DMI table decoder for hardware information
        dnsutils # DNS utilities
        dogdns # Modern DNS client alternative to dig
        dos2unix # Text file format converter1
        ed # Line-oriented text editor
        eternal-terminal # Remote terminal that reconnects after disconnections
        exfat # ExFAT filesystem tools
        exiftool # Read, write and edit metadata
        eza # Modern replacement for 'ls'
        fd # Simple, fast alternative to 'find'
        ffmpeg # Complete solution for recording/converting audio/video
        ffmpegthumbnailer # Video thumbnailing library
        file # Determine file type
        file-roller # Archive manager for GNOME
        fio # Flexible I/O tester
        fwupd-efi # EFI firmware updater
        #     fwupdse # System firmware updater
        fx # Terminal JSON viewer and processor
        fzf # Command-line fuzzy finder
        gawk # GNU awk for text processing
        gcc # GNU Compiler Collection
        gdb # GNU Debugger
        gh # GitHub CLI
        git # Distributed version control system
        git-filter-repo # Tool for rewriting git repository history
        git-lfs # Git extension for versioning large files
        glab # GitLab CLI client
        glib # Core library for GNOME
        glow # Markdown renderer for terminal
        glxinfo # Display info about OpenGL and GLX
        gnome-disk-utility # Disk management tool
        gnumake # Build automation tool
        gnupg # GNU Privacy Guard for encryption
        gnused # GNU stream editor
        gnutar # GNU tar archiver
        gparted # Partition editor (system-wide installation needed)
        grim # Screenshot utility for Wayland
        helix # Modal text editor
        htop # Interactive process viewer
        hwinfo # Hardware information tool
        hypridle # Idle daemon for Hyprland
        hyprlock # Screen locker for Hyprland
        iftop # Network bandwidth monitor
        imagemagick # Image manipulation tools
        inetutils # Basic networking utilities
        intel-gpu-tools # Tools for Intel GPU debugging
        iotop # I/O monitoring tool
        ipcalc # IP address calculator
        iperf3 # Network performance measurement tool
        iw # Wireless configuration tool
        iwd # iNet wireless daemon
        jhead # JPEG header manipulation tool
        jq # Lightweight JSON processor
        jujutsu # VCS with feature branches in a stack
        just # Command runner (makefile alternative)
        jupyter
        kdePackages.breeze # KDE Breeze theme
        kdePackages.kcalc
        kdePackages.kdenlive
        kdePackages.krohnkite # Dynamic tiling extension for KWin
        kdePackages.kup
        kdePackages.libksysguard # KDE system monitor library
        kdePackages.plasma-thunderbolt
        kdePackages.qtwayland # Qt Wayland integration
        kdePackages.qtwebsockets # Qt Network WebSockets module
        kdePackages.skanlite
        kdePackages.sddm-kcm # KDE Config Module for SDDM
        kdePackages.xwaylandvideobridge
        kdePackages.kdeconnect-kde
        keepassxc # Password manager
        killall # Kill processes by name
        ladspaPlugins
        lazygit # Terminal UI for git
        lazyjj # Terminal UI for jujutsu
        ldns # DNS programming library and tools
        libGL # OpenGL library
        libarchive # Multi-format archive library, provides bsdtar
        libguestfs-with-appliance # Tools for accessing VM disk images
        libnotify # Desktop notification library
        libudev-zero # Drop-in replacement for libudev
        libva-utils # Video Acceleration API tools
        lm_sensors # Hardware monitoring tools
        lshw # Hardware lister
        lsof # List open files
        ltrace # Library call tracer
        luarocks # Lua package manager
        lxqt.lxqt-policykit # PolicyKit agent for GVFS
        man-pages # Linux manual pages
        man-pages-posix # POSIX manual pages
        memtest86plus # Memory testing utility
        mesa # OpenGL implementation
        micro # Modern terminal-based text editor
        microcodeIntel # Intel CPU microcode updates
        minicom # Serial communications program
        mitmproxy # HTTPS proxy for debugging
        mpv
        mtr # Network diagnostic tool
        mutagen # Fast file synchronization
        mutagen-compose # Docker Compose with Mutagen integration
        nats-server # Cloud-native messaging system
        natscli # CLI for NATS messaging system
        nemo-with-extensions # File manager for Cinnamon
        neofetch # System information tool
        neovim # Vim-fork focused on extensibility
        nethogs # Net top tool grouping by process
        networkmanager # Network connection manager
        networkmanagerapplet # NetworkManager GUI applet
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
        nmap # Network exploration and security auditing
        nomacs # Image viewer
        nushell # Modern shell
        nvd # Diff tool for comparing Nix packages
        nvtopPackages.full # GPU process monitoring tool
        oils-for-unix # Shell replacement (formerly Oil shell)
        openssl # Cryptography and SSL/TLS toolkit
        ouch # Compression/decompression tool
        p7zip # File archiver with high compression ratio
        papirus-folders # Papirus icon theme folder customization
        passt # User-mode networking for containers (required by buildah)
        pciutils # PCI utilities
        podman-compose # Docker Compose for Podman
        podman-desktop # GUI for Podman containers
        powershell # Microsoft PowerShell
        powertop # Power consumption analyzer
        pstree # Display process tree
        pulseaudioFull # Sound server with extra features
        pulsemixer # CLI mixer for PulseAudio
        pasystray
        pv # Pipe Viewer for monitoring data transfer
        python313
        (python312.withPackages (ps: [
          ps.ipykernel
          ps.notebook
          ps.ipython
        ])) # Python programming language
        qt6ct # Qt6 configuration tool
        ripgrep # Fast recursive search tool
        ryzenadj # Adjust power management for Ryzen CPUs
        sbctl # Secure Boot key manager
        sddm-chili-theme # Theme for SDDM login manager
        #     signald
        #     (signald.override {
        #       jre = openjdk17;
        #     })
        signal-desktop
        slurp # Select a region for Wayland
        socat # Multipurpose relay for bidirectional data transfer
        spice # Remote display protocol
        spice-gtk # GTK client for SPICE
        spice-protocol # SPICE protocol definitions
        sqlite # Embedded SQL database engine
        sshpass # Non-interactive ssh password authentication
        sshuttle # VPN over SSH
        steam
        steam-run # Run unpatched Linux programs
        steampipe # Query cloud infrastructure with SQL
        strace # System call tracer
        stress-ng # Stress test tool
        swaybg # Wallpaper tool for Wayland
        sysstat # System performance tools
        tealdeer # Fast tldr client in Rust
        thunderbird
        tmux # Terminal multiplexer
        tree # Display directory tree structure
        tree-sitter
        tre-command
        ttyper # Terminal-based typing test
        typst
        typstfmt
        tinymist
        udev # Device manager for Linux
        udevil # Mount without root
        udisks # Storage device daemon
        ufetch # Tiny system info for Unix-like OSes
        unrar # Extract RAR archives
        unrar # Extract RAR archives (duplicate entry)
        unzip # Extract ZIP archives
        update-nix-fetchgit # Update nix-prefetch-git hashes
        usbutils # USB utilities
        utillinux # Basic Linux utilities
        uutils-coreutils-noprefix # Rust implementation of coreutils
        uv
        vcstool
        vim # Text editor
        virt-manager # Desktop UI for managing virtual machines
        virt-viewer # Graphical console viewer for VMs
        virtio-win # VirtIO drivers for Windows guests
        virtiofsd # Shared filesystem daemon for VMs
        vulnix # NixOS vulnerability scanner
        waycheck # Check Wayland compatibility
        wev # Wayland event viewer
        wget # Non-interactive network downloader
        win-spice # SPICE for Windows VMs
        wireguard-tools # VPN tools
        wirelesstools # Linux wireless networking tools
        wireshark # Network protocol analyzer
        wl-clipboard # Clipboard utilities for Wayland
        clip
        xorg.xhost
        xorg.libX11
        x11docker
        xdg-utils # Desktop integration utilities
        xfce.mousepad # Simple text editor
        xorriso # ISO 9660 filesystem creation tool
        xz # Data compression utility
        yazi # Terminal file manager
        yq-go # YAML processor (Go implementation)
        zathura # Document viewer
        zed-editor
        zellij # Terminal workspace with multiplexer
        zip # ZIP archive tool
        zsh # Z shell
        zstd # Fast compression algorithm
        obs-studio-plugins.droidcam-obs
      ];
      programs.fish.enable = true;

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
      nix.settings.trusted-users = [ config.flake.meta.users.mimi.username ];
      nix.daemonCPUSchedPolicy = "idle";
      services.commafeed.enable = true;
      services.dbus.implementation = "broker";
      services.dbus.enable = true;
      services.dbus.packages = with pkgs; [
        dconf
        gcr
        udisks2
      ];
      services.libinput.enable = true;
      services.pcscd.enable = true;
      services.ratbagd.enable = true;
      # services.xrdp.defaultWindowManager = "${pkgs.kdePackages.plasma-workspace}/bin/startplasma-x11";
      # services.xrdp.enable = false;
      # services.xrdp.openFirewall = true;
      hardware.wooting.enable = true;
      programs.adb.enable = true;
      programs.bat.enable = true;
      programs.less.lessopen = lib.mkDefault null;
      programs.partition-manager.enable = true;
      programs.virt-manager.enable = true;
      programs.xwayland.enable = true;
    };
  home-manager.users.mimi =
    { pkgs, ... }:
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
        kdePackages.accounts-qt
        nh
      ];

      services.deluge = {
        enable = true;
        web.enable = true;
      };

      services.polybar.package = pkgs.polybar.override {
        mpdSupport = true;
        pulseSupport = true;
      };
    };
}
