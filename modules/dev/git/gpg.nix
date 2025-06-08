{
  flake.modules = {
    homeManager.dev = {
      programs.gpg.enable = true;
      programs.gpg.settings = {
        default-key = "0AAF2901E8040715";
      };
    };
  };
}
