{
  description = "My Nix infrastructure at home";

  inputs = {
    nixpkgs.url = "github:/nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixpkgs-unstable.url = "github:/nixos/nixpkgs/nixpkgs-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    deploy-rs.url = "github:serokell/deploy-rs";
    deploy-rs.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager.url = "github:nix-community/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";

    systems.url = "github:nix-systems/default";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    git-hooks.url = "github:cachix/git-hooks.nix";
    git-hooks.inputs.nixpkgs.follows = "nixpkgs";

    nix-oracle-db.url = "github:drupol/nix-oracle-db";

    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-generators.inputs.nixpkgs.follows = "nixpkgs";

    pkgs-by-name-for-flake-parts.url = "github:drupol/pkgs-by-name-for-flake-parts";

    nix-webapps.url = "github:TLATER/nix-webapps";

    import-tree.url = "github:vic/import-tree";

    nixos-facter-modules.url = "github:numtide/nixos-facter-modules";

    treefmt-nix.url = "github:numtide/treefmt-nix";

    make-shell.url = "github:nicknovitski/make-shell";

    # unify.url = "git+https://codeberg.org/quasigod/unify";
    # unify.inputs.nixpkgs.follows = "nixpkgs";
    # unify.inputs.home-manager.follows = "home-manager";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    # Generate configs
    nixago.url = "github:nix-community/nixago";
    nixago.inputs.nixpkgs.follows = "nixpkgs";

    # Niri compositor
    # Provides a binary cache, so do not follow inputs
    niri.url = "github:sodiboo/niri-flake";

    # Only used for GRUB theme
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    stylix.inputs.home-manager.follows = "home-manager";
    stylix.inputs.nur.follows = "nur";
    stylix.inputs.flake-parts.follows = "flake-parts";

    ttf-to-tty.url = "github:Sigmanificient/ttf_to_tty";
    ttf-to-tty.inputs.nixpkgs.follows = "nixpkgs";

    # Catppuccin Theming
    # Provides a binary cache, so do not follow inputs
    catppuccin.url = "github:catppuccin/nix";

    # Extra Catppuccin themes
    catppuccin-ohmyrepl.url = "github:catppuccin/ohmyrepl";
    catppuccin-ohmyrepl.flake = false;

    # Change to official repo when catppuccin/prismlauncher#6 is merged
    catppuccin-prismlauncher.url = "github:Anomalocaridid/prismlauncher/whiskers";
    catppuccin-prismlauncher.flake = false;

    nixcord.url = "github:KaylorBen/nixcord";
    nixcord.inputs.nixpkgs.follows = "nixpkgs";

    ignis.url = "github:linkfrg/ignis";
    ignis.inputs.nixpkgs.follows = "nixpkgs";

    nix-yazi-plugins.url = "github:lordkekz/nix-yazi-plugins";
    nix-yazi-plugins.inputs.nixpkgs.follows = "nixpkgs";

    "yatline.yazi".url = "github:imsi32/yatline.yazi";
    "yatline.yazi".flake = false;

    "yatline-githead.yazi".url = "github:imsi32/yatline-githead.yazi";
    "yatline-githead.yazi".flake = false;

    "yatline-catppuccin.yazi".url = "github:imsi32/yatline-catppuccin.yazi";
    "yatline-catppuccin.yazi".flake = false;

    ghostty-shaders.url = "github:hackr-sh/ghostty-shaders";
    ghostty-shaders.flake = false;
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
