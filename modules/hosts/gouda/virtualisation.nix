{
  flake.modules.nixos."hosts/gouda" =
    { pkgs, lib, ... }:
    {
      virtualisation = {
        incus.enable = true; # Enables the Incus daemon

        libvirtd = {
          enable = true;
          qemu = {
            ovmf.enable = true;
            ovmf.packages = [ pkgs.OVMFFull.fd ];
            swtpm.enable = true;
            runAsRoot = lib.mkDefault false;
            package = lib.mkDefault pkgs.qemu_kvm;
          };
        };
        containers = {
          containersConf.settings.engine.cgroup_manager = "cgroupfs";
          storage = {
            settings = {
              storage = {
                driver = "overlay";
                graphroot = "/home/mimi/.podman/var/lib/containers/storage";
                runroot = "/home/mimi/.podman/run/containers/storage";
              };
            };
          };
        };
      };
    };
}
