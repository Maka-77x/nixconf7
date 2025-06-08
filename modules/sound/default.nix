{
  flake.modules = {
    nixos.sound = {
      services.pipewire.enable = true;
      services.pipewire.alsa.enable = true;
      services.pipewire.alsa.support32Bit = true;
      services.pipewire.pulse.enable = true;

      users.users.mimi.extraGroups = [
        "sound"
        "audio"
      ];
    };
  };
}
