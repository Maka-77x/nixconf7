{
  flake.modules.nixos."hosts/gouda" =
    { pkgs, lib, ... }:
    {
      boot.extraModulePackages = [ ];
      boot.extraModprobeConfig = ''
        options v4l2loopback exclusive_caps=1 card_label="Camera 1"
      '';
      boot.loader.systemd-boot.enable = true;
      boot.loader.systemd-boot.configurationLimit = 15;
      boot.loader.systemd-boot.consoleMode = lib.mkDefault "max";
      boot.loader.systemd-boot.editor = true;
      boot.loader.systemd-boot.memtest86.enable = true;

      boot.loader.timeout = lib.mkDefault 1;
      boot.loader.generationsDir.copyKernels = true;

      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.efi.efiSysMountPoint = "/boot/efi";

      boot.plymouth.enable = true;

      boot.supportedFilesystems = [
        "ext4"
        "btrfs"
        "f2fs"
        "ntfs"
        "vfat"
        "xfs"
      ];

      boot.binfmt.registrations.appimage.wrapInterpreterInShell = false;
      boot.binfmt.registrations.appimage.interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      boot.binfmt.registrations.appimage.recognitionType = "magic";
      boot.binfmt.registrations.appimage.offset = 0;
      boot.binfmt.registrations.appimage.mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
      boot.binfmt.registrations.appimage.magicOrExtension = ''\x7fELF....AI\x02'';

      boot.enableContainers = lib.mkDefault false;

      boot.initrd.availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "vmd"
        "nvme"
        "usb_storage"
        "usbhid"
        "sd_mod"
        "kvm-intel"
        "br_netfilter"
        "v4l2loopback"
      ];

      boot.initrd.kernelModules = [
        "i915"
        "kvm-intel"
      ];
      boot.initrd.verbose = false;
      boot.initrd.systemd.strip = true;
      boot.initrd.enable = true;
      boot.initrd.systemd.enable = true;

      boot.kernel.sysctl = {
        "net.ipv4.ip_forward" = true;
        "net.ipv4.tcp_fin_timeout" = 5;
        ### PERFORMANCE
        "kernel.sched_cfs_bandwidth_slice_us" = 3000;
        # increasing is good for gaming USE MAX_INT
        "vm.max_map_count" = 2147483642;
        "fs.file-max" = 2097152;
        # Proactive compaction for (Transparent) Hugepage allocation reduces the average but not
        # necessarily the maximum allocation stalls. Disable proactive compaction because it introduces
        # jitter according to kernel documentation (inner workings):
        "vm.compaction_proactiveness" = 0;
        # If you have enough free RAM increase the number of minimum free Kilobytes to avoid stalls on memory allocations: [5][6]. Do not set this below 1024 KB or above 5% of your systems memory. Reserving 1GB:
        "vm.min_free_kbytes" = 1048576;
        # Disable zone reclaim (locking and moving memory pages that introduces latency spikes)
        "vm.zone_reclaim_mode" = 0;
        # Reduce the maximum page lock acquisition latency while retaining adequate throughput [13][14][15]:
        "vm.page_lock_unfairness" = 1;
        # In some cases, split lock mitigate can slow down performance in some applications and games.
        "kernel.split_lock_mitigate" = 0;
        # TCP hardening
        # Prevent bogus ICMP errors from filling up logs.
        "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
        # Reverse path filtering causes the kernel to do source validation of
        # packets received from all interfaces. This can mitigate IP spoofing.
        "net.ipv4.conf.default.rp_filter" = 1;
        "net.ipv4.conf.all.rp_filter" = 1;
        # Do not accept IP source route packets (we're not a router)
        "net.ipv4.conf.all.accept_source_route" = 0;
        "net.ipv6.conf.all.accept_source_route" = 0;
        # Don't send ICMP redirects (again, we're on a router)
        "net.ipv4.conf.all.send_redirects" = 0;
        "net.ipv4.conf.default.send_redirects" = 0;
        # Refuse ICMP redirects (MITM mitigations)
        "net.ipv4.conf.all.accept_redirects" = 0;
        "net.ipv4.conf.default.accept_redirects" = 0;
        "net.ipv4.conf.all.secure_redirects" = 0;
        "net.ipv4.conf.default.secure_redirects" = 0;
        "net.ipv6.conf.all.accept_redirects" = 0;
        "net.ipv6.conf.default.accept_redirects" = 0;
        # Protects against SYN flood attacks
        "net.ipv4.tcp_syncookies" = 1;
        # Incomplete protection again TIME-WAIT assassination
        "net.ipv4.tcp_rfc1337" = 1;
        # And other stuff
        "net.ipv4.conf.all.log_martians" = true;
        "net.ipv4.conf.default.log_martians" = true;
        "net.ipv4.icmp_echo_ignore_broadcasts" = true;
        "net.ipv6.conf.default.accept_ra" = 0;
        "net.ipv6.conf.all.accept_ra" = 0;
        "net.ipv4.tcp_timestamps" = 0;
        # TCP optimization
        # Enable TCP Fast Open
        # TCP Fast Open is an extension to the transmission control protocol (TCP) that helps reduce network latency
        # by enabling data to be exchanged during the sender’s initial TCP SYN [3].
        # Using the value 3 instead of the default 1 allows TCP Fast Open for both incoming and outgoing connections:
        "net.ipv4.tcp_fastopen" = 3;
        # TCP Enable ECN Negotiation for both outgoing and incoming connections
        "net.ipv4.tcp_ecn" = 1;
        # Bufferbloat mitigations + slight improvement in throughput & latency
        "net.ipv4.tcp_congestion_control" = "bbr";
        "net.core.default_qdisc" = "cake";
        # Increase netdev receive queue
        # May help prevent losing packets
        "net.core.netdev_max_backlog" = 16384;
        # Other stuff that I am too lazy to document
        "net.core.optmem_max" = 65536;
        "net.core.rmem_default" = 1048576;
        "net.core.rmem_max" = 16777216;
        "net.core.somaxconn" = 8192;
        "net.core.wmem_default" = 1048576;
        "net.core.wmem_max" = 16777216;
        "net.ipv4.ip_local_port_range" = "16384 65535";
        "net.ipv4.tcp_max_syn_backlog" = 8192;
        "net.ipv4.tcp_max_tw_buckets" = 2000000;
        "net.ipv4.tcp_mtu_probing" = 1;
        "net.ipv4.tcp_rmem" = "4096 1048576 2097152";
        "net.ipv4.tcp_slow_start_after_idle" = 0;
        "net.ipv4.tcp_tw_reuse" = 1;
        "net.ipv4.tcp_wmem" = "4096 65536 16777216";
        "net.ipv4.udp_rmem_min" = 8192;
        "net.ipv4.udp_wmem_min" = 8192;
        #     "net.ipv6.conf.all.forwarding" = 1; # IPv6 forwarding
        "net.ipv4.conf.all.forwarding" = lib.mkForce true;
        "net.ipv6.conf.all.forwarding" = lib.mkForce true;
      };

      boot.kernelParams = [
        "quiet"
        "splash"
      ];
    };
}
