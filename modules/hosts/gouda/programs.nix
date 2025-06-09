{
  flake.modules = {
    nixos."hosts/gouda" =
      { pkgs, ... }:
      {
        programs.noisetorch.enable = true;
        programs.obs-studio.enable = true;
        programs.obs-studio.plugins = with pkgs.obs-studio-plugins; [
          obs-vkcapture
          input-overlay
          obs-pipewire-audio-capture
          wlrobs
          droidcam-obs
          #inputs.obs-image-reaction.packages.${pkgs.system}.default
        ];
        programs.projecteur.enable = true;
      };
  };
}
