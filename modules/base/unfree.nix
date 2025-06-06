{
  lib,
  config,
  ...
}:
{
  flake.modules.homeManager.base =
    let
      predicate = pkg: builtins.elem (lib.getName pkg) config.nixpkgs.allowedUnfreePackages ++ [
        "steam"
        "steam-original"
        "steam-runtime"
        "minecraft-launcher"
        "discord"
        "corefonts"
        "cnijfilter"
        "cnijfilter2"
        "teams"
        "zoom"
      ];
    in
    {
      nixos = {
        nixpkgs.config.allowUnfreePredicate = predicate;
      };

      home = {
        nixpkgs.config.allowUnfreePredicate = predicate;
      };
    };
}
