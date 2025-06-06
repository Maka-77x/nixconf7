{ lib, ... }:
{
  options.flake.meta = lib.mkOption {
    type = with lib.types; lazyAttrsOf anything;
  };
  config.flake.meta.uri = "github:Maka-77x/nixconf7";
 }
