{ pkgs, lib, config, home-manager, ... }:
let
  cursorTheme = "Bibata-Modern-Classic";
  cursorSize = 24;
  cursorPackage = pkgs.bibata-cursors;
in
{
  home-manager.users.davi = {
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
    gtk = {
      enable = true;
      gtk3 = {
        extraConfig.gtk-application-prefer-dark-theme = true;
      };
      gtk4 = {
        extraConfig.gtk-application-prefer-dark-theme = true;
      };
    };

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
}
