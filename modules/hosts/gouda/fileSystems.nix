{
  flake.modules = {
    nixos."hosts/gouda" =
      { config, lib, ... }:
      {
        fileSystems."/" = {
          device = "/dev/disk/by-uuid/279093a1-315d-4896-bd15-dac40458bc15";
          fsType = "btrfs";
          options = [
            "rw"
            "relatime"
            "compress=zstd:3"
            "ssd"
            "discard=async"
            "space_cache=v2"
            "subvol=/@"
          ];
        };

        fileSystems."/.snapshots" = {
          device = "/dev/disk/by-uuid/279093a1-315d-4896-bd15-dac40458bc15";
          fsType = "btrfs";
          options = [
            "rw"
            "relatime"
            "compress=zstd:3"
            "ssd"
            "discard=async"
            "space_cache=v2"
            "subvol=/@.snapshots"
          ];
        };

        fileSystems."/nix" = {
          device = "/dev/disk/by-uuid/279093a1-315d-4896-bd15-dac40458bc15";
          fsType = "btrfs";
          options = [
            "rw"
            "relatime"
            "compress=zstd:3"
            "ssd"
            "discard=async"
            "space_cache=v2"
            "subvol=/@nix"
          ];
        };

        fileSystems."/home" = {
          device = "/dev/disk/by-uuid/279093a1-315d-4896-bd15-dac40458bc15";
          fsType = "btrfs";
          options = [
            "rw"
            "relatime"
            "compress=zstd:3"
            "ssd"
            "discard=async"
            "space_cache=v2"
            "subvol=/@home"
          ];
        };

        fileSystems."/var/log" = {
          device = "/dev/disk/by-uuid/279093a1-315d-4896-bd15-dac40458bc15";
          fsType = "btrfs";
          options = [
            "rw"
            "relatime"
            "compress=zstd:3"
            "ssd"
            "discard=async"
            "space_cache=v2"
            "subvol=/@log"
          ];
        };

        fileSystems."/boot" = {
          device = "/dev/disk/by-uuid/4EB7-2C5E";
          fsType = "vfat";
          options = [
            "rw"
            "relatime"
            "fmask=0022"
            "dmask=0022"
            "codepage=437"
            "iocharset=ascii"
            "shortname=mixed"
            "utf8"
            "errors=remount-ro"
          ];
        };

        fileSystems."/swap" = {
          device = "/dev/disk/by-uuid/279093a1-315d-4896-bd15-dac40458bc15";
          fsType = "btrfs";
          options = [ "subvol=/@swap" ];
        };

        swapDevices = [ { device = "/swap/swapfile"; } ];

        hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      };
  };
}
