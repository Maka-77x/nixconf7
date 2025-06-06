{
  unify.modules.shell.nixos = {
    programs.fish.enable = true;
  };

  flake.module.homeManager.shell =
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
}
