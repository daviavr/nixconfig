{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.pipewire;
in
{
  options = { modules.pipewire.enable = mkEnableOption "pipewire"; };
  config = mkIf cfg.enable {
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      wireplumber.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = false;
    };

    environment.systemPackages = with pkgs; [ pulseaudio ];
  };
}
