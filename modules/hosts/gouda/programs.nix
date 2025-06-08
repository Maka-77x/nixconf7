{
  flake.modules = {
    nixos."hosts/gouda" = {
      programs = {
        noisetorch = {
          enable = true;
        };
        projecteur = {
          enable = true;
        };
      };
    };
  };
}
