{
  flake.modules = {
    nixos.base =
      {
        lib,
        ...
      }:
      {
        services.userborn.enable = true;

        # See https://github.com/NixOS/nixpkgs/pull/308801
        system.switch.enable = false;
        system.switch.enableNg = true;

        system.disableInstallerTools = lib.mkForce false;
        system.etc.overlay.enable = false;
        system.etc.overlay.mutable = true;
        system.extraDependencies = lib.mkForce [ ];
      };
  };
}
