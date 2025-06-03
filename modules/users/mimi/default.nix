{
  config,
  ...
}:
{
  flake = {
    meta.users = {
      mimi = {
        email = "mimi99078878+Maka-77x@users.noreply.github.com";
        name = "Michael Parrett";
        username = "mimi";
        key = "0AAF2901E8040715";
        authorizedKeys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCkwFDi5HxDlr+L3KVhmUdhAu1VD0CmiuI+VhPHRjXjXQP/mltQhagFQBEpBeXJbeOw1e9GDQA+Ij0/zZReVpkA9vD/a7KEfSN026iFzI1qUyJNPbEnAD9fH/TA6dJCspHIykK9vDf3Zl1DQ1OvuDHjBmx+6XZgv8qAaHYOLfE8U/v2GmUhrLbNbzYhaohpcbPL50u/uDtJToIZI7raAm20iITY2l2pj66sTuvN8W1JZRaiSb27ZI5pm2nZPxR7KnVT9ssdLsijOyyuRqwkjfEI1HKLtpor02lzS6hc4wAaEWdWVv+U7ey+ih0Ff7Fn0b05UnYQpN1fwBuFONbzokB0x6l52A/9D+2bUqpXJokY0Ot84QOddLxTeP1GcvXswX/yRjI+ljkDmAfhO5cni0Zq/v9mxwgtUx9TQX70lYmjdMTOOJpsarnnwSebzH1hb1hyoKD7HwUM6mZKwCijEoVSFfq8VjW1zD0d3stTZJOMV2BR9tvaZ8T6cuQIMth51He4lYvd0tmtYowGqB8iVigg3CoEvoVCdG4//TtKST9vOJOSgIdtxRVazj0WnPrfsWXI1oWv1AdlBg/QjjcGnjM/5PCg43dkx0nc0sk3i+TZPl36utunJHVggRorj7xOSSPX8IOkkgsdsOQstOg8rBVcuMHLt7gbaY9RV90PKPHlKw=="
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA98KfahoWZCJKdNqNXGIHBbKE4c4WsUQr+UT2ZdO/nh"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAUzP2TgczfS2tvhMpWof7fzBvxDt+dh/wK3/WWdYPpF"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN2Ve36/FI5XPkC47dsQHilCsRLDn3hNn2zGXf1PYKKd"
        ];
      };
    };
  };

  unify.modules.base.nixos =
    { pkgs, ... }:
    {
      programs.fish.enable = true;

      users.users.mimi = {
        description = config.flake.meta.users.mimi.name;
        isNormalUser = true;
        createHome = true;
        extraGroups = [
          "audio"
          "input"
          "networkmanager"
          "sound"
          "tty"
          "wheel"
        ];
        shell = pkgs.fish;
        openssh.authorizedKeys.keys = config.flake.meta.users.mimi.authorizedKeys;
        initialPassword = "id";
      };

      nix.settings.trusted-users = [ config.flake.meta.users.mimi.username ];
    };
}
