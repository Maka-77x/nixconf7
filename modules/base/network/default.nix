{
  unify.modules.base.nixos = { hostConfig, ... }:
    {
      networkin.hostName = hostConfig.name;
      networkin.networkmanager.enable = true;
      networkin.useDHCP = false;

      users.users.mimi = {
        extraGroups = [
          "networkmanager"
        ];
      };
    };
}
