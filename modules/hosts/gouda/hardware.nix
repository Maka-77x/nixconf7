{
  inputs,
  ...
}:
{
  flake.modules = {
    nixos."hosts/gouda" =
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
        hardware.gpgSmartcards.enable = true;
        hardware.sane.enable = true;
        hardware.graphics.enable = true;
        #   hardware.opengl.driSupport = true;
        hardware.graphics.extraPackages = with pkgs; [
          intel-compute-runtime
          intel-media-driver
          vaapiIntel
          vaapiVdpau
          libvdpau-va-gl
        ];
        hardware.graphics.extraPackages32 = with pkgs.pkgsi686Linux; [
          # intel-compute-runtime # FIXME does not build due to unsupported system
          intel-media-driver
          vaapiIntel
          vaapiVdpau
          libvdpau-va-gl
        ];
        hardware.ipu6.enable = true;
        hardware.ipu6.platform = "ipu6ep";
      };
  };
}
