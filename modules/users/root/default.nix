{
  flake.modules.nixos.base =
    { pkgs, ... }:
    {
      users.users.root.shell = pkgs.fish;
      users.users.root.initialPassword = "id";
    };

}
