{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.cosmic;
in
{
  options = { modules.cosmic.enable = mkEnableOption "cosmic"; };

  config = mkIf cfg.enable {
    services.desktopManager.cosmic.enable = true;
    services.displayManager.cosmic-greeter.enable = true;
    systemd.user.services.easyeffectsAutorun = {
      description = "...";
      serviceConfig.PassEnvironment = "DISPLAY";
      script = ''
        ${pkgs.flatpak}/bin/flatpak run com.github.wwmm.easyeffects --gapplication-service
      '';
      wantedBy = [ "multi-user.target" ]; # starts after login
    };
  };
}
