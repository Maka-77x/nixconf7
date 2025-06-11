{
  flake.modules.nixos.openssh =
    {
      lib,
      pkgs,
      ...
    }:
    {
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
