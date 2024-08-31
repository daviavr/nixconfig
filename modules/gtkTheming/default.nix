{ pkgs, lib, config, home-manager, ... }:
let
  cursorTheme = "Bibata-Modern-Classic";
  cursorSize = 24;
  cursorPackage = pkgs.bibata-cursors;
  cfg = config.modules.gtkTheming;
in
with lib;
{
  options.modules.gtkTheming.enable = mkEnableOption "prefer dark theme on gtk apps";
  config = mkIf cfg.enable {
    home-manager.users.davi = {
      gtk = {
        enable = true;
        gtk3 = {
          extraConfig.gtk-application-prefer-dark-theme = true;
        };
        gtk4 = {
          extraConfig.gtk-application-prefer-dark-theme = true;
        };
      };

      xresources.properties = { "*dpi" = "120"; "Xft.dpi" = 120; };
      home.pointerCursor = {
        name = cursorTheme;
        package = cursorPackage;
        size = cursorSize;
        x11 = {
          enable = true;
          defaultCursor = cursorTheme;
        };
        gtk.enable = true;
      };

      wayland.windowManager.sway.config.seat."*" = {
        xcursor_theme = "${cursorTheme} ${builtins.toString cursorSize}";
      };

    };
  };
}
