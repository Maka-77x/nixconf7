{
  config,
  ...
}:
{
  flake.modules.nixos."nixos.gouda".imports =
    with (config.flake.modules.nixos);
    [
      ai
      base
      #       bluetooth
      #       desktop
      dev
      #       email
      facter
      #       fwupd
      #       games
      #       guacamole
      mimi
      openssh
      root
      shell
      #       virtualisation
      vpn
      #       laptop
    ]
    ++ [
      {
        home-manager.users.mimi.imports = with config.flake.modules.homeManager; [
          # "ai"
          "base"
          #       "bluetooth"
          "desktop"
          "dev"
          #       "email"
          "facter"
          #       "fwupd"
          #       "games"
          #       "guacamole"
          #       "messaging"
          #       "openssh"
          "shell"
          #       "sound"
          #       "virtualisation"
          "vpn"
          #       "work"
          "laptop"
        ];
      }
    ];
}
