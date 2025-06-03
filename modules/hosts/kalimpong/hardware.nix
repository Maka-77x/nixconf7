{ inputs, ... }:
{
  unify.hosts.nixos.kalimpong.nixos = {
    imports = with inputs.nixos-hardware.nixosModules; [
      common-pc-ssd
    ];
  };
}
