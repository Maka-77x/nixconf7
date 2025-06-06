{
  unify.modules.base.nixos = {
    services.packagekit.enable = true;
    services.flatpak.enable = false;
    # Limit the systemd journal to 100 MB of disk or the
    # last 3 days of logs, whichever happens first.
    services.journald.extraConfig = ''
        SystemMaxUse=100M
        MaxFileSec=3day
      '';
    services.nscd.enableNsncd = false;
  };
}
