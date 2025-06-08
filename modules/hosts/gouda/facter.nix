{
  flake.modules = {
    nixos."hosts/gouda" = {
      facter.reportPath = ./facter.json;
    };
  };
}
