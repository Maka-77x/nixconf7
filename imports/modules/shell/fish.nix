{
  unify.modules.shell.nixos = {
    programs.fish.enable = true;
  };

  unify.modules.shell.home =
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
