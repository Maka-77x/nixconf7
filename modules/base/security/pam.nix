{
  flake.modules.nixos.base = {
    security.pam.services.login.kwallet.enable = true;
    security.pam.services.kde.allowNullPassword = true;
    security.pam.services.kde.kwallet.enable = true;
  };
}
