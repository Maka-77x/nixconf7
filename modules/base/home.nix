{
  flake.modules.homeManager.base = {
    programs.home-manager.enable = true;
    # See https://ohai.social/@rycee/112502545466617762
    # See https://github.com/nix-community/home-manager/issues/5452
    systemd.user.startServices = "sd-switch";

    services = {
      home-manager.autoExpire = {
        enable = true;
        frequency = "weekly";
        store.cleanup = true;
      };
      gpg-agent = {
        enable = true;
        enableSshSupport = true;
        sshKeys = [ "ABD1DA446DB82D241AFC4AB7D98338CC986BA77E" ];
      };
      syncthing.enable = true;
      #   services.syncthing.tray.enable = true;
    };
  };
}
