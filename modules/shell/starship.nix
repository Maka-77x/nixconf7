{
  flake.modules = {
    homeManager.shell = {
      services =
        { pkgs, ... }:
        {
          commafeed.enable = true;
          libinput.enable = true;
          pcscd.enable = true;
          ratbagd.enable = true;
          # xrdp.defaultWindowManager = "${pkgs.kdePackages.plasma-workspace}/bin/startplasma-x11";
          # xrdp.enable = false;
          # xrdp.openFirewall = true;
          #
          deluge = {
            enable = true;
            web.enable = true;
          };
          polybar.package = pkgs.polybar.override {
            mpdSupport = true;
            pulseSupport = true;
          };
        };
      programs =
        { lib, pkgs, ... }:
        {
          adb.enable = true;
          bat.enable = true;
          less.lessopen = lib.mkDefault null;
          partition-manager.enable = true;
          virt-manager.enable = true;
          xwayland.enable = true;
          fish.enable = true;
          obs-studio = {
            enable = true;
            plugins = with pkgs.obs-studio-plugins; [
              obs-vkcapture
              input-overlay
              obs-pipewire-audio-capture
              wlrobs
              droidcam-obs
              #inputs.obs-image-reaction.packages.${pkgs.system}.default
            ];
          };
          starship = {
            enable = true;
            enableTransience = true;
            settings = {
              custom.jj1 = {
                when = "jj root --ignore-working-copy";
                detect_folders = [ ".jj" ];
                ignore_timeout = true;
                format = "$output ";
                command = ''
                  jj log --revisions @ --no-graph --ignore-working-copy --color always --limit 1 --template '
                    surround("[", "",
                      separate(" ",
                        change_id.shortest(),
                        commit_id.shortest(),
                        bookmarks,
                        "|",
                        concat(
                          if(conflict, "💥"),
                          if(divergent, "🚧"),
                          if(hidden, "👻"),
                          if(immutable, "🔒"),
                        ),
                        raw_escape_sequence("\x1b[1;32m") ++ if(empty, "(empty)"),
                        raw_escape_sequence("\x1b[1;32m") ++ coalesce(
                          truncate_end(29, description.first_line(), "..."),
                          "(no description)",
                        ) ++ raw_escape_sequence("\x1b[0m"),
                      )
                    )
                  '
                '';
              };

              custom.jj2 = {
                when = "jj root --ignore-working-copy";
                detect_folders = [ ".jj" ];
                ignore_timeout = true;
                format = "$output ";
                command = ''
                  jj log --revisions "streams()" --no-graph --ignore-working-copy --color always --template '
                    surround("", "]",
                      bookmarks
                    )
                  '
                '';
              };

              git_state = {
                disabled = true;
              };

              git_status = {
                disabled = true;
              };

              git_commit = {
                disabled = true;
              };

              git_metrics = {
                disabled = true;
              };

              git_branch = {
                disabled = true;
              };
            };
          };
        };
    };
  };
}
