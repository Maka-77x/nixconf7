{ lib, ... }:
{
  flake.modules = {
    nixos.base = {
      powerManagement.enable = true;
      powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
    };
  };
}
