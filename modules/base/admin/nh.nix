{
  inputs,
  ...
}:
{
  imports = [
    inputs.make-shell.flakeModules.default
  ];

  unify.modules.base.nixos = {
    programs.nh.enable = true;
    programs.nh.clean = {
      enable = true;
      extraArgs = "--keep 2";
    };
  };

  perSystem = { pkgs, ... }: {
    make-shells.default.packages = with pkgs; [ nh ];
  };
}
