{
  flake.modules.homeManager.base = {
    programs.micro.enable = true;
    programs.micro.settings = {
      diffgutter = true;
      keymenu = true;
      mkparents = true;
      tabsize = 2;
      tabstospaces = true;
    };

    home.sessionVariables = {
      EDITOR = "micro";
      VISUAL = "micro";
    };
  };
}
