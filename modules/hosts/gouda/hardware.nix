{
  inputs,
  ...
}:
{
  flake.modules = {
    nixos."hosts/gouda" =
      {
        modulesPath,
        ...
      }:
      {
        imports = [
          (modulesPath + "/installer/scan/not-detected.nix")
          inputs.nixos-hardware.nixosModules.common-pc-ssd
        ];
      };
  };
}
