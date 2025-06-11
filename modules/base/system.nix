{
  flake.modules.nixos.base =
    {
      lib,
      ...
    }:
    {
      services.userborn.enable = true;

      # See https://github.com/NixOS/nixpkgs/pull/308801
      system = {
        switch.enable = false;
        switch.enableNg = true;

        disableInstallerTools = lib.mkForce false;
        etc.overlay.enable = false;
        etc.overlay.mutable = true;
      };
    };
}
