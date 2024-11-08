{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.cosmic;
in
{
  options = { modules.cosmic.enable = mkEnableOption "cosmic"; };

  config = mkIf cfg.enable {
    services.desktopManager.cosmic.enable = true;
    #services.displayManager.cosmic-greeter.enable = true;
  };
}
