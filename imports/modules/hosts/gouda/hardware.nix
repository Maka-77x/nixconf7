{
  inputs,
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  unify.hosts.nixos.gouda.nixos = {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
      { system.forbiddenDependenciesRegexes = lib.mkForce [ ]; }
      inputs.nixos-hardware.nixosModules.common-pc-ssd
    ];
  };
}
