{ pkgs, lib, home-manager, config, ... }:
with lib;
let
  cfg = config.modules.leftwm;
in
{
  options.modules.leftwm.enable = mkEnableOption "leftwm";

  config = mkIf cfg.enable {

    xdg.portal = {
      enable = true;
      config.common.default = [
        "gtk"
      ];
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gnome xdg-desktop-portal-gtk ];
    };

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

      home.file = {
        ".config/leftwm/config.ron" = {
          enable = true;
          source = ./config.ron;
        };
        ".config/leftwm/up" = {
          enable = true;
          executable = true;
          source = ./up;
        };
        "catppuccin" = {
          enable = true;
          source = ./themes/catppuccin;
          target = ".config/leftwm/themes/current";
        };
      };

      home.packages = with pkgs; [
        redshift
        playerctl
        sxhkd
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
