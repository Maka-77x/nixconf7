{
  flake.modules.nixos."hosts/gouda" = {
    programs =
      { pkgs, ... }:
      {
        noisetorch.enable = true;
        obs-studio = {
          enable = true;
          plugins = with pkgs.obs-studio-plugins; [
            obs-vkcapture
            input-overlay
            obs-pipewire-audio-capture
            wlrobs
            droidcam-obs
            #inputs.obs-image-reaction.packages.${pkgs.system}.default
          ];
        };
        projecteur.enable = true;
      };
  };
}
