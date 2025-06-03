{
  unify.modules.base.nixos =
    { lib, ... }:
    {
      powerManagement.enable = true;
      powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
    };
}
