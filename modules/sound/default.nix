{
  flake.modules.nixos.sound = {
    services = {
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = false;
        # extraConfig = {
        #   #     "99-input-denoising" = rnnoise_config;
        #   adjust-sample-rate."context.properties"."default.clock.rate" = 48000;
        #   adjust-sample-rate."context.properties"."default.allowed-rates" = [
        #     192000
        #     96000
        #     48000
        #     44100
        #   ];
        #     adjust-sample-rate."context.properties"."default.allowed-rates" = [ 192000 ];
        #     adjust-sample-rate."context.properties"."default.clock.quantum" = 32;
        #     adjust-sample-rate."context.properties"."default.clock.min-quantum" = 32;
        #     adjust-sample-rate."context.properties"."default.clock.max-quantum" = 32;
        # };
        # wireplumber.enable = true;
      };
    };
  };
}
