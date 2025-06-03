{ lib, ... }:
{
  unify.modules.base.nixos = {
    powerManagement.enable = true;
    powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  };
}
