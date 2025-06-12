{
  flake.modules.nixos.bluetooth = {
    hardware = {
      bluetooth.enable = true;
      bluetooth.powerOnBoot = false;
      bluetooth.settings.General.Experimental = true;
    };
  };
}
