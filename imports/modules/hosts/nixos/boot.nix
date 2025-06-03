{
  lib,
  ...
}:
{
  unify.hosts.nixos.nixos.nixos = {

    # Use the GRUB 2 boot loader.
    boot.loader.grub.enable = true;
    # boot.loader.grub.efiSupport = true;
    # boot.loader.grub.efiInstallAsRemovable = true;
    # boot.loader.efi.efiSysMountPoint = "/boot/efi";
    # Define on which hard drive you want to install Grub.
    boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
    boot.kernel.sysctl = {
      "net.ipv4.conf.all.forwarding" = lib.mkForce true;
      "net.ipv6.conf.all.forwarding" = lib.mkForce true;
    };

    boot.initrd.availableKernelModules = [
      "xhci_pci"
      "ehci_pci"
      "ahci"
      "usbhid"
      "usb_storage"
      "sd_mod"
      "sr_mod"
    ];

    boot.kernelModules = [ "kvm-intel" ];
  };
}
