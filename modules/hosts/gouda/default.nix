{
  config,
  ...
}:
{
  unify.hosts.nixos.gouda = {
    users = {
      mimi = { };
    };
    modules = with config.unify.modules; [
      ai
      base
      bluetooth
      desktop
      dev
      #       email
      facter
      fwupd
      games
      #       guacamole
      messaging
      openssh
      shell
      sound
      virtualisation
      vpn
      #       work
    ];
    tags = [
      #       "ai" # already defined in nixos base
      #       "base" # already defined in nixos base
      #       "bluetooth"
      "desktop"
      #       "dev"
      #       "email"
      #       "facter" # already defined in nixos base
      #       "fwupd"
      #       "games"
      #       "guacamole"
      #       "messaging"
      #       "openssh" # already defined in nixos base
      #       "shell" # already defined in nixos base
      #       "sound"
      #       "virtualisation"
      #       "vpn" # already defined in nixos base
      #       "work"
      "laptop"
    ];

    fqdn = "gouda.netbird.cloud";
  };
}
