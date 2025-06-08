{
  modulesPath,
  inputs,
  lib,
  ...
}:
{
  flake.modules.nixos."hosts/gouda" = {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
      { system.forbiddenDependenciesRegexes = lib.mkForce [ ]; }
      inputs.nixos-hardware.nixosModules.common-pc-ssd
    ];
  };
}
