{
  inputs,
  config,
  ...
}:
{
  unify.hosts.nixos.gouda.nixos =
    {
      lib,
      pkgs,
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
