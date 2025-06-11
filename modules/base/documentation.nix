{
  flake.modules = {
    nixos.base = {
      # https://mastodon.online/@nomeata/109915786344697931
      documentation.enable = true;
      documentation.info.enable = false;
      documentation.dev.enable = false;
      documentation.nixos.enable = false;
      documentation.man.enable = true;
      documentation.man.generateCaches = true;
      documentation.man.man-db.enable = true;
      documentation.man.mandoc.enable = false;
    };
  };
}
