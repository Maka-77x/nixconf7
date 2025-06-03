{
  inputs,
  modulesPath,
  lib,
  ...
}:
{
  imports = [ "${modulesPath}/profiles/perlless.nix" ];
  unify.hosts.nixos.gouda.nixos = {
    imports = [
      { system.forbiddenDependenciesRegexes = lib.mkForce [ ]; }
      inputs.nixos-hardware.nixosModules.common-pc-ssd
    ];
  };
}
