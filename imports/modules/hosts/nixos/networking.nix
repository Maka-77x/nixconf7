{
  unify.hosts.nixos.nixos = {
    networking = {
      interfaces.wlan0.useDHCP = true;
    };
  };
}
