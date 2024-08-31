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
          size = 16;
        };
        theme = "Gruvbox Dark";
      };
      home.packages = with pkgs; [
        wmctrl
        tdrop
        kitty
        kitty-themes
      ];
      home.file.".local/scripts/dropdown-kitty.sh" = {
        enable = true;
        executable = true;
        text = "#!/bin/sh\nKITTY_DISABLE_WAYLAND=1 tdrop -mta kitty --class dropdown --name dropdown -T dropdown";
      };
    };
  };
}
