{
  flake.modules = {
    homeManager.shell =
      { pkgs, ... }:
      {
        programs = {
          bat = {
            enable = true;
            extraPackages = with pkgs.bat-extras; [
              batdiff
              batgrep
              batman
              batwatch
            ];
          };
        };
      };
  };
}
