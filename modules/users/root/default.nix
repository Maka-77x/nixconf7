{
  flake.modules = {
    nixos.root =
      { pkgs, ... }:
      {
        users.users.root.shell = pkgs.fish;
        users.users.root.initialPassword = "id";
      };
  };
}
