{
  config,
  ...
}:
{
  unify.hosts.nixos.nixos = {
    users = {
      mimi = { };
    };

    modules = with config.unify.modules; [
      ai
      base
      #       bluetooth
      #       desktop
      #       dev
      #       email
      facter
      #       fwupd
      #       games
      #       guacamole
      openssh
      shell
      #       virtualisation
      vpn
      #       laptop
    ];
    tags = [
      "ai"
      "base"
      #       "bluetooth"
      #       "desktop"
      #       "dev"
      #       "email"
      "facter"
      #       "fwupd"
      #       "games"
      #       "guacamole"
      #       "messaging"
      "openssh"
      "shell"
      #       "sound"
      #       "virtualisation"
      "vpn"
      #       "work"
      #       "laptop"
    ];

    fqdn = "nixos.netbird.cloud";
  };
}
