{
  flake.modules.nixos.openssh = {
    services.openssh.enable = true;
    services.openssh.openFirewall = true;
    services.openssh.allowSFTP = false;
    services.openssh.settings.PasswordAuthentication = false;
    services.openssh.settings.X11Forwarding = true;
  };
}
