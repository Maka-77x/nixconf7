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

  unify.modules.base.nixos = { pkgs, lib, ... }: {
    console.earlySetup = true;
    console.font = "Lat2-Terminus16";
    #console.keyMap = "de";
    console.colors = [
      "171717"
      "d81765"
      "97d01a"
      "ffa800"
      "16b1fb"
      "ff2491"
      "0fdcb6"
      "ebebeb"
      "38252c"
      "ff0000"
      "76b639"
      "e1a126"
      "289cd5"
      "ff2491"
      "0a9b81"
      "f8f8f8"
    ];

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
        "audio"
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
        "podman"
        "qemu-libvirtd"
        "sound"
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

    hardware.gpgSmartcards.enable = true;
    hardware.sane.enable = true;

    environment.variables = rec {
      #XCURSOR_SIZE = config.me.cursorSize;
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
      XDG_BIN_HOME = "$HOME/.local/bin";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_RUNTIME_DIR = "/run/user/$UID";
      XIDLEHOOK_SOCK = "${XDG_RUNTIME_DIR}/xidlehook.sock";
      #------------------------------------------------------------------------#
      #     NIX_PATH = lib.mkForce "nixpkgs=/etc/nixos/nixpkgs-channels:nixos-config=/home/mimi/v00-0101-nixfiles-kig/configuration.nix";
      #     NIXOS_CONFIG = "$HOME/.config/nixos/configuration.nix";
      #     NIXOS_CONFIG_DIR = "$HOME/.config/nixos/";
      #------------------------------------------------------------------------#
      PATH = [ "${XDG_BIN_HOME}" ];
      EDITOR = "nvim";
      VISUAL = "nvim";
      PAGER = "less -R";
      SYSTEMD_LESS = "RM";
      MANPAGER = "nvim +Man!";
      BROWSER = "firefox";
      TERM = "alacritty";
      TERMINAL = "alacritty";
      #------------------------------------------------------------------------#
      __GL_SHADER_DISK_CACHE_SKIP_CLEANUP = "1";
      _Z_DATA = "${XDG_DATA_HOME}/z";
      ANDROID_USER_HOME = "${XDG_DATA_HOME}/android";
      ANDROID_HOME = "${XDG_DATA_HOME}/android/sdk";
      ANKI_WAYLAND = "1";
      #     ANSIBLE_HOME = "${XDG_DATA_HOME}/ansible"; # #
      #     CABAL_CONFIG = "${XDG_CONFIG_HOME}/cabal/config"; # #
      #     CABAL_DIR = "${XDG_DATA_HOME}/cabel"; # #
      CARGO_HOME = "${XDG_DATA_HOME}/cargo";
      CLUTTER_BACKEND = "wayland";
      CUDA_CACHE_PATH = "${XDG_CACHE_HOME}/nv";
      DIRENV_LOG_FORMAT = "";
      DISABLE_QT5_COMPAT = "0";
      ERRFILE = "${XDG_CACHE_HOME}/X11/xsession-errors";
      #     FLAKE = "$HOME/.config/nix"; # #
      #     FLAKE_DIR = "$HOME/.config/nix"; # #
      FORCE_HYPERLINK = 1; # forces rust to make links hyperlinks
      GDK_BACKEND = "wayland,x11";
      GHCUP_USE_XDG_DIRS = "true";
      GIT_EDITOR = lib.mkForce "nvim +startinsert +0";
      # GNUPGHOME = "${XDG_DATA_HOME}/gnupg";
      GRADLE_USER_HOME = "${XDG_DATA_HOME}/gradle";
      GTK_RC_FILES = "$HOME/.local/share/gtk-1.0/gtkrc";
      GTK2_RC_FILES = "$HOME/.local/share/gtk-2.0/gtkrc";
      GTK_CSD = "0";
      HISTFILE = "${XDG_STATE_HOME}/bash/history";
      MOZ_ENABLE_WAYLAND = "1";
      MYSQL_HISTFILE = "${XDG_DATA_HOME}/mysql_history";
      NIMBLE_DIR = "${XDG_DATA_HOME}/nimble";
      NPM_CONFIG_LOGLEVEL = "http";
      NPM_CONFIG_USERCONFIG = "${XDG_CONFIG_HOME}/npm/npmrc";
      PASSWORD_STORE_DIR = "$HOME/.local/share/password-store";
      PGPASSFILE = "${XDG_CONFIG_HOME}/pg/pgpass";
      PSQL_HISTORY = "${XDG_DATA_HOME}/psql_history";
      PYTHONSTARTUP = "${XDG_CONFIG_HOME}/python/pythonrc";
      RUSTUP_HOME = "${XDG_DATA_HOME}/rustup";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER = "wayland";
      SNAP_NAME = "firefox";
      #     SSH_AUTH_SOCK = "$HOME/.1password/agent.sock"; # #
      #     STACK_ROOT = "${XDG_DATA_HOME}/stack"; # #
      STACK_XDG = "1";
      #     TEXMFVAR = "${XDG_CACHE_HOME}/texlive/texmf-var"; # #
      TLDR_CACHE_DIR = "${XDG_CACHE_HOME}/tldr";
      WINEPREFIX = "${XDG_DATA_HOME}/wine";
      WORDCHARS = "";
      XCOMPOSECACHE = "${XDG_CACHE_HOME}/X11/xcompose-cache";
      ZDOTDIR = "${XDG_CONFIG_HOME}/zsh";
      ZK_NOTEBOOK_DIR = "$HOME/stuff/notes/";
      #------------------------------------------------------------------------#
      LS_COLORS =
        "rs=0"
        # Reset
        + ":di=01;34"
        # Directories (blue)
        + ":ln=01;36"
        # Symbolic links (cyan)
        + ":mh=00"
        # Multi-hard links
        + ":pi=40;33"
        # FIFOs (yellow background)
        + ":so=01;35"
        # Sockets (magenta)
        + ":do=01;35"
        # Devices (magenta)
        + ":bd=40;33;01"
        # Block devices (yellow background, bold)
        + ":cd=40;33;01"
        # Character devices (yellow background, bold)
        + ":or=40;31;01"
        # Orphaned symbolic links (red background, bold)
        + ":mi=00"
        # Missing symbolic links
        + ":su=37;41"
        # Setuid files (white on red)
        + ":sg=30;43"
        # Setgid files (black on yellow)
        + ":ca=00"
        # Capabilities
        + ":tw=30;42"
        # Sticky writable directories (black on green)
        + ":ow=34;42"
        # Other writable directories (blue on green)
        + ":st=37;44"
        # Sticky directories (white on blue)
        + ":ex=01;32"
        # Executable files (green, bold)
        +
          # Archives (red)
          ":*.7z=01;31:*.ace=01;31:*.alz=01;31:*.apk=01;31:*.arc=01;31:*.arj=01;31:*.bz=01;31:*.bz2=01;31:*.cab=01;31:*.cpio=01;31:*.crate=01;31:*.deb=01;31:*.drpm=01;31:*.dwm=01;31:*.dz=01;31:*.ear=01;31:*.egg=01;31:*.esd=01;31:*.gz=01;31:*.jar=01;31:*.lha=01;31:*.lrz=01;31:*.lz=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.lzo=01;31:*.pyz=01;31:*.rar=01;31:*.rpm=01;31:*.rz=01;31:*.sar=01;31:*.swm=01;31:*.t7z=01;31:*.tar=01;31:*.taz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tgz=01;31:*.tlz=01;31:*.txz=01;31:*.tz=01;31:*.tzo=01;31:*.tzst=01;31:*.udeb=01;31:*.war=01;31:*.whl=01;31:*.wim=01;31:*.xz=01;31:*.z=01;31:*.zip=01;31:*.zoo=01;31:*.zst=01;31"
        +
          # Images (magenta)
          ":*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01"
        +
          # Videos (magenta)
          ":*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01"
        +
          # Audio (cyan)
          ":*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36"
        +
          # Backup/Temporary files (gray)
          ":*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:";
    };
    hardware.graphics.enable = true;
    #   hardware.opengl.driSupport = true;
    hardware.graphics.extraPackages = with pkgs; [
      intel-compute-runtime
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
    hardware.graphics.extraPackages32 = with pkgs.pkgsi686Linux; [
      # intel-compute-runtime # FIXME does not build due to unsupported system
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
    hardware.ipu6.enable = true;
    hardware.ipu6.platform = "ipu6ep";
    nix.daemonCPUSchedPolicy = "idle";
    nixpkgs.config.allowBroken = false;
    nixpkgs.config.allowUnsupportedSystem = true;
    nixpkgs.config.permittedInsecurePackages = [ ];
    nixpkgs.config.allowAliases = true;
    nixpkgs.config.enableParallelBuildingByDefault = false;
    nixpkgs.config.showDerivationWarnings = [ ];
    nixpkgs.config.packageOverrides = pkgs: {
      vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
    };

    services.avahi.enable = true;
    services.avahi.publish.enable = true;
    services.avahi.publish.domain = true;
    services.avahi.publish.userServices = true;
    services.avahi.publish.workstation = true;
    services.avahi.publish.addresses = true;
    services.avahi.nssmdns4 = true;
    services.avahi.reflector = true;
    services.avahi.extraServiceFiles.ssh = "${pkgs.avahi}/etc/avahi/services/ssh.service";
    services.avahi.extraServiceFiles.sftp-ssh = "${pkgs.avahi}/etc/avahi/services/sftp-ssh.service";
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

    services.pipewire.enable = true;
      services.pipewire.alsa.enable = true;
      services.pipewire.alsa.support32Bit = true;
      services.pipewire.pulse.enable = true;
      services.pipewire.jack.enable = true;
      services.pipewire.extraConfig = {
        #     pipewire."99-input-denoising" = rnnoise_config;
        pipewire.adjust-sample-rate."context.properties"."default.clock.rate" = 48000;
        pipewire.adjust-sample-rate."context.properties"."default.allowed-rates" = [
          192000
          96000
          48000
          44100
        ];
        #     pipewire.adjust-sample-rate."context.properties"."default.allowed-rates" = [ 192000 ];
        #     pipewire.adjust-sample-rate."context.properties"."default.clock.quantum" = 32;
        #     pipewire.adjust-sample-rate."context.properties"."default.clock.min-quantum" = 32;
        #     pipewire.adjust-sample-rate."context.properties"."default.clock.max-quantum" = 32;
      };
    services.pipewire.wireplumber.enable = true;
    services.ratbagd.enable = true;
    # 	 enable systemd DNS resolver daemon
    services.resolved.enable = true;
    services.resolved.dnssec = "allow-downgrade";
    services.resolved.dnsovertls = "opportunistic";
    # ideally our fallbackDns should be something more widely available
    # but I do not want my last resort to sell my data to every company available
    # NOTE: DNS fallback is not a recovery DNS
    # See <https://github.com/systemd/systemd/issues/5771#issuecomment-296673115>
    services.resolved.fallbackDns = [
      "9.9.9.9"
      "9.9.9.10"
      "9.9.9.11"
      "2620:fe::9"
      "2620:fe::10"
      "2620:fe::11"
    ];
    services.resolved.extraConfig = ''
      		MulticastDNS=no # This is handled by Avahi.
       	'';
    services.syncthing.enable = true;
    #
    #   services.syncthing.tray.enable = true;
    services.userborn.enable = true;
    services.xrdp.defaultWindowManager = "${pkgs.kdePackages.plasma-workspace}/bin/startplasma-x11";
    services.xrdp.enable = false;
    services.xrdp.openFirewall = true;

    services.zerotierone.enable = true;
    # services.zerotierone.joinNetworks = secrets.zerotierone.networks;
    system.disableInstallerTools = lib.mkForce false;
    system.etc.overlay.enable = false;
    system.etc.overlay.mutable = true;
    system.extraDependencies = lib.mkForce [ ];

    hardware.wooting.enable = true;


    programs.adb.enable = true;
    programs.bat.enable = true;
    programs.bat.extraPackages = with pkgs.bat-extras; [
      batdiff
      batgrep
      batman
      batwatch
    ];
    programs.droidcam.enable = true;
    programs.kdeconnect.enable = true;
    programs.kdeconnect.package = lib.mkForce pkgs.kdePackages.kdeconnect-kde;
    programs.kde-pim.enable = true;
    programs.less.lessopen = lib.mkDefault null;
    programs.localsend.enable = true;
    programs.mosh.enable = true;
    programs.nh.enable = true;
    programs.nm-applet.enable = true;

    programs.obs-studio.enable = true;
    programs.obs-studio.plugins = with pkgs.obs-studio-plugins; [
      obs-vkcapture
      input-overlay
      obs-pipewire-audio-capture
      wlrobs
      droidcam-obs
      #inputs.obs-image-reaction.packages.${pkgs.system}.default
    ];

    programs.partition-manager.enable = true;
    programs.ssh.enableAskPassword = true;
    programs.ssh.askPassword = "${lib.getExe' pkgs.kdePackages.ksshaskpass "ksshaskpass"}";
    programs.ssh.hostKeyAlgorithms = [
      "ssh-ed25519"
      "ssh-rsa"
    ];
    programs.ssh.startAgent = false;
    programs.starship.enable = true;
    programs.starship.settings.add_newline = false;

    programs.wireshark.enable = true;
    programs.wireshark.package = pkgs.wireshark;

    programs.virt-manager.enable = true;
    programs.xwayland.enable = true;



  #
  #
  #
  };
  unify.modules.base.home = { config, pkgs, ... }: {
    programs.nh.enable = true;
    programs.obs-studio.enable = true;

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

    services.blueman.enable = true;
    services.deluge = {
        enable = true;
        web.enable = true;
      };
    services.kdeconnect.enable = true;
    services.kdeconnect.package = pkgs.kdePackages.kdeconnect-kde;
    services.mpris-proxy.enable = true;
    services.network-manager-applet.enable = true;
    services.playerctld.enable = true;
    services.polybar.package = pkgs.polybar.override {
      mpdSupport = true;
      pulseSupport = true;
    };
  };
}
