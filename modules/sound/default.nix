{
  flake.modules = {
    nixos.sound = {
      services.pipewire.enable = true;
      services.pipewire.alsa.enable = true;
      services.pipewire.alsa.support32Bit = true;
      services.pipewire.pulse.enable = true;

      services.pipewire.jack.enable = false;
      services.pipewire.extraConfig = {
        #     pipewire."99-input-denoising" = rnnoise_config;
        pipewire.adjust-sample-rate."context.properties"."default.clock.rate" = 48000;
        pipewire.adjust-sample-rate."context.properties"."default.allowed-rates" = [
          192000
          96000
          48000
          44100
        ];
        #     pipewire.adjust-sample-rate."context.properties"."default.allowed-rates" = [ 192000 ];
        #     pipewire.adjust-sample-rate."context.properties"."default.clock.quantum" = 32;
        #     pipewire.adjust-sample-rate."context.properties"."default.clock.min-quantum" = 32;
        #     pipewire.adjust-sample-rate."context.properties"."default.clock.max-quantum" = 32;
      };
      services.pipewire.wireplumber.enable = true;

      users.users.mimi.extraGroups = [
        "sound"
        "audio"
      ];
    };
  };
}
