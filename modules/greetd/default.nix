{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.greetd;
in
{
  options.modules.greetd.enable = mkEnableOption "greetd";
  config = mkIf cfg.enable {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --xsessions ${config.services.displayManager.sessionData.desktops}/share/xsessions --time";
          user = "greeter";
        };
      };
    };

    environment.etc."greetd/environments".text = ''
      leftwm
      sway
      river
      zsh
      bash
      startxfce4
    '';
  };
}