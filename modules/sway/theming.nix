{ pkgs, lib, config, home-manager, ... }:
let
  cursorTheme = "Bibata-Modern-Classic";
  cursorSize = 20;
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
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome.gnome-themes-extra;
      };
      gtk3 = {
        extraConfig.gtk-application-prefer-dark-theme = true;
      };
      gtk4 = {
        extraConfig.gtk-application-prefer-dark-theme = true;
      };
    };
    qt = {
      enable = true;
      platformTheme.name = "adwaita";
      style.name = "adwaita-dark";
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
