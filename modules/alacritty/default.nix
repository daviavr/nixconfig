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
        theme = "gruvbox_dark";
        settings = {
          font = {
            normal.family = "DejaVuSansMono";
            size = 16;
          };

          window.decorations = "None";
        };
      };
      home.packages = with pkgs; [
        alacritty
      ];
    };
  };
}
