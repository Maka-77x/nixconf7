{
  flake.modules.nixos.vpn = {
    services.netbird.enable = true;
  };
  flake.modules.homeManager.vpn =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        netbird-ui
      ];
    };
}
