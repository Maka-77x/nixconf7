{
  flake.modules.nixos.base = {
    security.sudo-rs.enable = true;
    security.sudo-rs.wheelNeedsPassword = false;

    security.sudo.extraConfig = ''
      Defaults:root,%wheel env_keep+=LOCALE_ARCHIVE
      Defaults:root,%wheel env_keep+=NIX_PATH
      Defaults:root,%wheel env_keep+=TERMINFO_DIRS
      Defaults env_keep+=SSH_AUTH_SOCK
      Defaults lecture = never
      root   ALL=(ALL) SETENV: ALL
      %wheel ALL=(ALL) NOPASSWD: ALL, SETENV: ALL
    '';

    users.users.mimi.extraGroups = [
      "wheel"
    ];
  };
}
