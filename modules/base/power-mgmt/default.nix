{
  flake.modules.nixos.base =
    { lib, ... }:
    {
      powerManagement.enable = true;
      powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
    };
}
