{
  inputs,
  ...
}:
{
  imports = [
    inputs.make-shell.flakeModules.default
  ];

  flake.modules.nixos.base = {
    programs.nh.enable = true;
    programs.nh.clean.enable = true;
    programs.nh.clean.extraArgs = "--keep 2";

  };

  perSystem =
    { pkgs, ... }:
    {
      make-shells.default.packages = with pkgs; [ nh ];
    };
}
