{
  inputs,
  ...
}:
{
  flake.modules.nixos."hosts/gouda" =
    {
      modulesPath,
      pkgs,
      ...
    }:
    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
        inputs.nixos-hardware.nixosModules.common-pc-ssd
      ];

      hardware = {
        gpgSmartcards.enable = true;
        sane.enable = true;
        graphics.enable = true;
        #   opengl.driSupport = true;
        graphics.extraPackages = with pkgs; [
          intel-compute-runtime
          intel-media-driver
          vaapiIntel
          vaapiVdpau
          libvdpau-va-gl
        ];
        graphics.extraPackages32 = with pkgs.pkgsi686Linux; [
          intel-media-driver
          vaapiVdpau
        ];
        ipu6.enable = true;
        ipu6.platform = "ipu6ep";
      };
    };
}
