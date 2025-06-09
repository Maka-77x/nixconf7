{
  flake.modules = {
    homeManager.shell = {
      programs.starship.enable = true;

      programs.starship.enableTransience = true;

      programs.starship.settings.add_newline = false;

      programs.starship.settings.custom.jj1 = {
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

      programs.starship.settings.custom.jj2 = {
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

      programs.starship.settings.git_state = {
        disabled = true;
      };

      programs.starship.settings.git_status = {
        disabled = true;
      };

      programs.starship.settings.git_commit = {
        disabled = true;
      };

      programs.starship.settings.git_metrics = {
        disabled = true;
      };

      programs.starship.git_branch = {
        disabled = true;
      };
    };
  };
}
