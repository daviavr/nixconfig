{ pkgs, lib, config, home-manager, ... }:
with lib;
let
  cfg = config.modules.alacritty;
in
{
  options = { modules.alacritty.enable = mkEnableOption "alacritty"; };
  config = mkIf cfg.enable {
    home-manager.users.davi = {
      programs.alacritty = {
        enable = true;
        settings = {
          font.normal.family = "DejaVuSansMono";
          font.size = 18;
        };
        home.packages = with pkgs; [
          alacritty
          alacritty-theme
        ];
      };
    };
  };
}
