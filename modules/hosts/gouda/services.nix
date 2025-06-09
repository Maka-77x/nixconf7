{
  flake.modules = {
    nixos."hosts/gouda" =
      { pkgs, lib, ... }:
      {
        services.xserver.xkb.layout = "gb";

        services.thermald.enable = true;
        services.deluge.enable = true;
        services.deluge.web.enable = true;

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

        services.kdeconnect.enable = true;
        services.kdeconnect.package = pkgs.kdePackages.kdeconnect-kde;

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
      };
  };
}
