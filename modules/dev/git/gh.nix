{
  flake.modules = {
    homeManager.dev =
      { pkgs, ... }:
      {
        programs.gh.enable = true;
        programs.gh.extensions = [
          pkgs.gh-copilot
        ];
      };

    nixpkgs.allowedUnfreePackages = [
      "gh-copilot"
    ];
  };
}
