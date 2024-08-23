{ pkgs, lib, config, home-manager, ... }:
with lib;
let
  cfg = config.modules.obs-studio;
in
{

  options = { modules.obs-studio.enable = mkEnableOption "obs-studio"; };
  config = mkIf cfg.enable {
    home-manager.users.davi.programs.obs-studio = {
      enable = true;
      plugins = [ pkgs.obs-studio-plugins.obs-vaapi ];
    };
  };
}
