{
  flake.modules.nixos."hosts/gouda" =
    { pkgs, lib, ... }:
    {
      # virtualisation.containers.containersConf.settings.engine.cgroup_manager = "cgroupfs";
      virtualisation.containers.storage.settings.storage = {
        driver = "overlay";
        graphroot = "/home/mimi/.podman/var/lib/containers/storage";
        runroot = "/home/mimi/.podman/run/containers/storage";
      };
      virtualisation.libvirtd.enable = true;
      virtualisation.libvirtd.qemu.ovmf.enable = true;
      virtualisation.libvirtd.qemu.ovmf.packages = [ pkgs.OVMFFull.fd ];
      virtualisation.libvirtd.qemu.swtpm.enable = true;
      virtualisation.libvirtd.qemu.runAsRoot = lib.mkDefault false;
      virtualisation.libvirtd.qemu.package = lib.mkDefault pkgs.qemu_kvm;

      #       virtualisation.lxd.enable = true;
      #       virtualisation.lxc.lxcfs.enable = true;
      virtualisation.incus.enable = true; # Enables the Incus daemon
      #       virtualisation.incus.preseed.enable = true; # Configure Incus on first start
      #       virtualisation.incus.preseed.configFile = ./incus-preseed.yaml; # Optional: preseed configuration
      # virtualisation.incus.packageOptions.withMicrovm = true; # Include microvm support
      #   virtualisation.incus.packageOptions.withTools = true; # Include tools package
      #   system.custom.mainUser.extraGroups = [ "lxd" ];

      #       virtualisation.spiceUSBRedirection.enable = true;

    };
}
