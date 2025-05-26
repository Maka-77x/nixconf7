{
  unify.hosts.nixos = {
    user = "mimi";

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
      #       "messaging"
      "openssh"
      "shell"
      #       "sound"
      #       "virtualisation"
      "vpn"
      #       "work"
    ];

    fqdn = "nixos.netbird.cloud";
  };
}
