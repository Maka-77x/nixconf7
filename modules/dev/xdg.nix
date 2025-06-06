{
  flake.modules.homeManager.base =
    { config, ... }:
    {
      xdg.userDirs.extraConfig.XDG_CODE_DIR = "${config.home.homeDirectory}/Code";
    };
}
