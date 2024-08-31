{ pkgs, lib, home-manager, ... }:
with lib;
let
  cfg = config.modules.leftwm;
in
{
  options.modules.leftwm.enable = mkEnableOption "leftwm";

  config = {
    services = {
      xserver = {
        enable = true;
        displayManager = {
          gdm.enable = true;
          startx.enable = true;
        };
        windowManager.leftwm.enable = true;
        desktopManager = {
          xterm.enable = false;
        };
      };
      displayManager = {
        defaultSession = "none+leftwm";
      };
    };

    services.xserver.dpi = 120;

    home-manager.users.davi = {
      services.dunst.enable = true;
      home.packages = with pkgs; [
        leftwm
        picom
        dmenu
        feh
        rofi
        polybar
        numlockx
        blueberry
      ];
    };
  };
}
