{ pkgs, lib, home-manager, ... }:
with lib;
let
  cfg = config.modules.leftwm;
in
{
  options.modules.leftwm.enable = mkEnableOption "leftwm";
  config = {
    services.xserver.windowManager.leftwm.enable = true;
    services.xserver.displayManager.startx.enable = true;

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
