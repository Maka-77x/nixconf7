{
  flake.modules."hosts/nixos" = {
    networking = {
      interfaces.wlan0.useDHCP = true;
    };
  };
}
