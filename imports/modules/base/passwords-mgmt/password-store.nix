{
  unify.modules.base.home = { config, ... }:
  {
    programs.password-store.enable = true;
    programs.password-store.settings = {
      PASSWORD_STORE_DIR = "${config.xdg.configHome}/.password-store";
    };
  };
}
