{ lib, ... }:{
  unify.modules.base.nixos = {
    # See https://github.com/NixOS/nixpkgs/issues/180175
    systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
    systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false;
    systemd.network.wait-online.enable = false;
    systemd.network.enable = lib.mkForce false;
  };
}
