{
  ...
}:
{
  unify.hosts.kalimpong = {
    user = "mimi";
    tags = [
      "ai" # already defined in nixos base
      "base" # already defined in nixos base
      "bluetooth"
      "dev"
      "desktop"
      "email"
      "facter" # already defined in nixos base
      "fwupd"
      "games"
      "messaging"
      "openssh" # already defined in nixos base
      "shell" # already defined in nixos base
      "sound"
      "virtualisation"
      "vpn" # already defined in nixos base
      "work"
    ];

    fqdn = "kalimpong.netbird.cloud";
  };
}
