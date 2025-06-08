{
  flake.modules = {
    nixos.shell = {
      programs.fish.enable = true;
    };

    homeManager.shell =
      {
        pkgs,
        ...
      }:
      {
        home.shell.enableFishIntegration = true;

        programs.fish.enable = true;
        programs.fish.plugins = [
          {
            name = "autopair";
            src = pkgs.fishPlugins.autopair;
          }
        ];
        programs.fish.shellAliases = {
          ".." = "cd ..";
          "..." = "cd ../..";
          cat = "bat";
          ls = "eza";
          grep = "rg";
        };
        programs.fish.functions = {
          fish_greeting = "";
        };
      };
  };
}
