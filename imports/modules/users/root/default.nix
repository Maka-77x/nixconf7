{
  unify.modules.base.nixos =
    { pkgs, ... }:
    {
      users.users.root.shell = pkgs.fish;
      users.users.root.initialPassword = "id";
    };

}
