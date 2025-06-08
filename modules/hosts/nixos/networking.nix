{
  flake.modules = {
    nixos."hosts/nixos" = {
      networking = {
        interfaces.wlan0.useDHCP = true;
      };
    };
  };
}
