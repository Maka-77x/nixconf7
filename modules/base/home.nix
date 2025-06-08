{
  flake.modules.homeManager.base =
    { config, ... }:
    {
      programs.home-manager.enable = true;
      # See https://ohai.social/@rycee/112502545466617762
      # See https://github.com/nix-community/home-manager/issues/5452
      systemd.user.startServices = "sd-switch";

      home.file.".face" = {
        source = ../../files/home/mimi/.face;
        recursive = true;
      };
      home.file.".face.icon" = {
        source = ../../files/home/mimi/.face;
        recursive = true;
      };
      home.file."${config.xdg.configHome}/.password-store/.keep" = {
        text = "";
        recursive = true;
      };
      # Credits to https://store.kde.org/p/1272202
      home.file."Pictures/Backgrounds/" = {
        source = ../../files/home/mimi/Pictures/Backgrounds;
        recursive = true;
      };

      services.home-manager.autoExpire.enable = true;
      services.home-manager.autoExpire.frequency = "weekly";
      services.home-manager.autoExpire.store.cleanup = true;

      services.gpg-agent.enable = true;
      services.gpg-agent.enableSshSupport = true;
      services.gpg-agent.ssshKeys = [ "ABD1DA446DB82D241AFC4AB7D98338CC986BA77E" ];
    };

}
