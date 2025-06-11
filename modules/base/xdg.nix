{
  flake.modules.homeManager.base = {
    xdg = {
      icons.enable = true;
      enable = true;
      mime.enable = true;
      userDirs = {
        enable = true;
        createDirectories = true;
        templates = null;
        music = null;
        videos = null;
        publicShare = null;
      };
    };
  };
}
