{
  flake.modules = {
    nixos.base =
      { pkgs, ... }:
      {
        nix.channel.enable = false;
        # See https://discourse.nixos.org/t/24-05-add-flake-to-nix-path/46310/9 # See https://hachyderm.io/@leftpaddotpy/112539055867932912

        nix.extraOptions = ''
          connect-timeout = 5
          log-lines = 50
          min-free = 128000000
          max-free = 1000000000
          fallback = true
        '';
        # From https://jackson.dev/post/nix-reasonable-defaults/

        nix.gc.automatic = false; # because i am using nh.clean

        nix.optimise.automatic = true;
        nix.optimise.dates = [ "04:00" ];

        nix.package = pkgs.nixVersions.latest;

        nix.settings.accept-flake-config = false;
        nix.settings.auto-optimise-store = true;
        nix.settings.connect-timeout = 5;
        nix.settings.cores = 6;
        nix.settings.experimental-features = [
          # Use auto-generated uids instead of users in the nixbld group
          "auto-allocate-uids"
          # Can allow saving space in the store by content-addressing instead of input-addressing derivations
          "ca-derivations"
          # Build inside cgroups
          "cgroups"
          # Duh
          "flakes"
          # Nix3 CLI
          "nix-command"
          # Disallow URL Literals as they are deprecated
          "no-url-literals"
          # Allow Nix to call itself
          "recursive-nix"
        ];
        nix.settings.http-connections = 50;
        nix.settings.log-lines = 50;
        nix.settings.max-jobs = 12;
        nix.settings.nix-path = [ "nixpkgs=${pkgs.path}" ];

        nix.settings.builders-use-substitutes = true;
        nix.settings.keep-going = true;
        nix.settings.keep-derivations = true; # for direnv garbage-collection roots
        nix.settings.keep-outputs = true;

        nix.settings.fallback = true; # Use cgroups for building
        nix.settings.use-cgroups = true;
        nix.settings.use-registries = true; # Allow use of the registry
        nix.settings.use-xdg-base-directories = true; # XDG base dirs to avoid cluttering $HOME
        nix.settings.warn-dirty = false;

        nix.settings.allowed-users = [
          "@wheel"
          "@users"
        ];
        nix.settings.trusted-users = [
          "root"
          "@wheel"
        ];
        # Write an empty flake registry
        nix.settings.flake-registry = pkgs.writers.writeJSON "registry-empty.json" {
          flakes = [ ];
          version = 2;
        };
        # No pre-defined nixbld users
        nix.settings.auto-allocate-uids = true;
        nix.settings.sandbox = true;
        nix.settings.substituters = [
          "https://cache.nixos.org?priority=10"
          "https://nyx.chaotic.cx"
          "https://chaotic-nyx.cachix.org"
          "https://hyprland.cachix.org"
          "https://cosmic.cachix.org"
          "https://nix-community.cachix.org"
          "https://nix-gaming.cachix.org"
          "https://anyrun.cachix.org"
          "https://yazi.cachix.org"
          "https://simonoscr.cachix.org"
        ];
        nix.settings.trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
          "nyx.cachix.org-1:xH6G0MO9PrpeGe7mHBtj1WbNzmnXr7jId2mCiq6hipE="
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
          "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
          "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
          "simonoscr.cachix.org-1:pTFtYU3a9SXL+Fw6S3sZ8uk+Vd33Yoothd771oGNJBE="
        ];

        nix.settings.system-features = [
          "kvm"
          "big-parallel"
          "nixos-test"
          "recursive-nix"
        ];
        nix.settings.allowed-uris = [
          "github:"
          "gitlab:"
          "git+https:"
          "git+ssh:"
        ];
        #
        #   registry.nixpkgs.flake = inputs.nixpkgs;
        # Legacy option for NixOS, new option is `nix.settings.nix-path`
        nix.nixPath = [
          "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixpkgs:nixos-config=$HOME/v00-0101-nixfiles-kig/configuration.nix:/nix/var/nix/profiles/per-user/root/channels"
          #     "/nix/var/nix/profiles/per-user/root/channels"
          #     "nixpkgs=/etc/nixos/nixpkgs-channels:nixos-config=/home/mimi/v00-0101-nixfiles-kig/configuration.nix"
        ];
      };
  };
}
