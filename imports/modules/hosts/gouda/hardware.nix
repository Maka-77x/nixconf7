{
  unify.hosts.nixos.gouda.nixos =
    {
      inputs,
      lib,
      ...
    }:
    {
      imports = [
        { system.forbiddenDependenciesRegexes = lib.mkForce [ ]; }
        inputs.nixos-hardware.nixosModules.common-pc-ssd
      ];
    };
}
