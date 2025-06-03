{
  unify.modules.base.nixos = { pkgs, ... }:
  {
    # See https://discourse.nixos.org/t/24-05-add-flake-to-nix-path/46310/9
    # See https://hachyderm.io/@leftpaddotpy/112539055867932912
    nix.channel.enable = false;
    nix.settings.nix-path = [ "nixpkgs=${pkgs.path}" ];
    # From https://jackson.dev/post/nix-reasonable-defaults/
    nix.extraOptions = ''
      connect-timeout = 5
      log-lines = 50
      min-free = 128000000
      max-free = 1000000000
      fallback = true
    '';
    nix.optimise.automatic = true;
    nix.settings.trusted-users = [
        "root"
      ];
    nix.settings.auto-optimise-store = true;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    nix.settings.warn-dirty = false;
  };
}
