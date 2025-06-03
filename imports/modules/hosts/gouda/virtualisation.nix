{
  unify.hosts.nixos.gouda.nixos =
    { pkgs, lib, ... }:
    {

      # systemd does not work for system user
      # virtualisation.containers.containersConf.settings.engine.cgroup_manager = "cgroupfs";
      virtualisation.lxd.enable = true;
      virtualisation.lxc.lxcfs.enable = true;
      virtualisation.incus.enable = true; # Enables the Incus daemon
      virtualisation.incus.preseed.enable = true; # Configure Incus on first start
      #   virtualisation.incus.preseed.configFile = ./incus-preseed.yaml; # Optional: preseed configuration
      #   virtualisation.incus.packageOptions.withMicrovm = true; # Include microvm support
      #   virtualisation.incus.packageOptions.withTools = true; # Include tools package
      #   system.custom.mainUser.extraGroups = [ "lxd" ];
      virtualisation.containers.registries.search = [ "docker.io" ];
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
      virtualisation.oci-containers.backend = "podman";
      virtualisation.podman.enable = true;
      virtualisation.podman.autoPrune.enable = true;
      virtualisation.podman.autoPrune.flags = [ "--all" ];
      virtualisation.podman.autoPrune.dates = "weekly";
      virtualisation.podman.defaultNetwork.settings.ipv6_enabled = true;
      virtualisation.podman.defaultNetwork.settings.dns_enabled = true;
      virtualisation.podman.dockerCompat = true;
      virtualisation.podman.dockerSocket.enable = true;
      virtualisation.spiceUSBRedirection.enable = true;

    };
}
