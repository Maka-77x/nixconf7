{
  flake.modules = {
    nixos.base =
      { lib, ... }:
      {
        programs.nano.enable = lib.mkForce false;
      };

    homeManager.base = {
      programs.nano.enable = false;
    };
  };
}
