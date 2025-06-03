{ inputs, modulesPath, lib, ... }:
{
  unify.hosts.nixos.gouda.nixos = {
    imports = [
      {system.forbiddenDependenciesRegexes = lib.mkForce [ ];}
      "${modulesPath}/profiles/perlless.nix"
      inputs.nixos-hardware.nixosModules.common-pc-ssd
    ];
  };
}
