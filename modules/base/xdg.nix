{
  flake.modules = {
    homeManager.base = {

      xdg.icons.enable = true;
      xdg.enable = true;
      xdg.mime.enable = true;
      xdg.userDirs.enable = true;
      xdg.userDirs.createDirectories = true;
      xdg.userDirs.templates = null;
      xdg.userDirs.music = null;
      xdg.userDirs.videos = null;
      xdg.userDirs.publicShare = null;
    };
  };
}
