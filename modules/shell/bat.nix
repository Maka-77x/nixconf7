{
  flake.modules = {
    homeManager.shell =
      { pkgs, ... }:
      {
        programs.bat.enable = true;
        programs.bat.extraPackages = with pkgs.bat-extras; [
          batdiff
          batgrep
          batman
          batwatch
        ];
      };
  };
}
