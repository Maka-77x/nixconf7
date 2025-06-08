{
  flake.modules.nixos.bluetooth =
    { pkgs, ... }:
    {
      hardware.bluetooth.enable = true;
      hardware.bluetooth.package = pkgs.bluez-experimental;
      hardware.bluetooth.powerOnBoot = false;
      hardware.bluetooth.settings.General.Experimental = true;
    };
}
