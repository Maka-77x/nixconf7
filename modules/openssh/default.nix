{
  flake.modules = {
    nixos.openssh =
      {
        lib,
        pkgs,
        ...
      }:
      {
        services.openssh.enable = true;
        services.openssh.openFirewall = true;
        services.openssh.allowSFTP = false;
        services.openssh.settings.PasswordAuthentication = false;
        services.openssh.settings.X11Forwarding = true;

        programs.ssh.enableAskPassword = true;
        programs.ssh.askPassword = "${lib.getExe' pkgs.kdePackages.ksshaskpass "ksshaskpass"}";
        programs.ssh.hostKeyAlgorithms = [
          "ssh-ed25519"
          "ssh-rsa"
        ];
        programs.ssh.startAgent = false;
      };
  };
}
