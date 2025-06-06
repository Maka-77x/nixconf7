{
  flake.modules.nixos."nixos/gouda" = {
    programs = {
      noisetorch = {
        enable = true;
      };
      projecteur = {
        enable = true;
      };
    };
  };
}
