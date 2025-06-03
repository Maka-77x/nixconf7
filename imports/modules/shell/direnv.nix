{
  unify.modules.shell.home = {
    programs.direnv.enable = true;
    programs.direnv.config.global.hide_env_diff = true;
    programs.direnv.nix-direnv.enable = true;
  };
}
