{
  inputs,
  lib,
  ...
}:
{
  unify.hosts."nixos.gouda".nixos =
    {
      modulesPath,
      ...
    }:
    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
        { system.forbiddenDependenciesRegexes = lib.mkForce [ ]; }
        inputs.nixos-hardware.nixosModules.common-pc-ssd
      ];
    };
}
