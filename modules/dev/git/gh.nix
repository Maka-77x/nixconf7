{
  unify.modules.dev.home = { pkgs, ... }: {
    programs.gh.enable = true;
    programs.gh.extensions = [
      pkgs.gh-copilot
    ];
  };

  nixpkgs.allowedUnfreePackages = [
    "gh-copilot"
  ];
}
