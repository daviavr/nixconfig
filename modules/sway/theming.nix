{ pkgs, lib, config, home-manager, ... }:
let
  cursorTheme = "Bibata-Modern-Classic";
  cursorSize = 24;
  cursorPackage = pkgs.bibata-cursors;
in
{
  #environment.sessionVariables = lib.mkDefault config.home-manager.users.davi.home.sessionVariables;
  home-manager.users.davi = {
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
    #home.file.".config/gtk-4.0/gtk-dark.css".text = "@import url(\"${pkgs.gnome.gnome-themes-extra}/share/themes/Adwaita-dark/gtk-4.0/gtk.css\");";
    gtk = {
      enable = true;
      #theme = {
      #  name = "Adwaita-dark";
      #  package = pkgs.gnome.gnome-themes-extra;
      #};
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
