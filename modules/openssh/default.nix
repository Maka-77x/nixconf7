{
  flake.modules.nixos.openssh = {
    services = {
      openssh = {
        enable = true;
        openFirewall = true;
        allowSFTP = false;
        settings.PasswordAuthentication = false;
        settings.X11Forwarding = true;
      };
    };
  };
}
