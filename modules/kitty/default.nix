{ pkgs, lib, config, home-manager, ... }:
with lib;
let
  cfg = config.modules.kitty;
in
{

  options = { modules.kitty.enable = mkEnableOption "kitty"; };
  config = mkIf cfg.enable {
    home-manager.users.davi = {
      programs.kitty = {
        enable = true;
        shellIntegration.enableZshIntegration = true;
        extraConfig = ''
          hide_window_decorations yes
          enable_audio_bell no
        '';
        font = {
          name = "DejaVuSansMono";
          size = 18;
        };
        theme = "Gruvbox Dark";
      };
      home.packages = with pkgs; [
        kitty
        kitty-themes
      ];
    };
  };
}
