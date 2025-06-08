{
  config,
  ...
}:
{
  flake.modules.nixos."hosts/gouda".imports =
    with (config.flake.modules.nixos);
    [
      ai
      base
      bluetooth
      desktop
      dev
      #       email
      facter
      fwupd
      # games
      #       guacamole
      # messaging # only home modules exist for messaging, currently
      mimi
      openssh
      root
      shell
      sound
      virtualisation
      vpn
      #       work
    ]
    ++ [
      {
        home-manager.users.mimi.imports = with config.flake.modules.homeManager; [
          # "ai" # already defined in nixos base
          "base" # already defined in nixos base
          # "bluetooth"
          "desktop"
          "dev"
          #       "email"
          "facter" # already defined in nixos base
          # "fwupd"
          "games"
          #       "guacamole"
          "messaging"
          # "openssh" # only system/nixos module exists???
          "shell" # already defined in nixos base
          # "sound"
          # "virtualisation"
          "vpn" # already defined in nixos base
          #       "work"
          "laptop"
        ];
      }
    ];
}
