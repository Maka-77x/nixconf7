{
  unify.modules.openssh.nixos = {
    services.openssh.enable = true;
    services.openssh.openFirewall = true;
    services.openssh.settings.X11Forwarding = true;
  };
}
