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
    programs.dconf.enable = true;

    system.fsPackages = [ pkgs.bindfs ];
    fileSystems =
      let
        mkRoSymBind = path: {
          device = path;
          fsType = "fuse.bindfs";
          options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
        };
        aggregated = pkgs.buildEnv {
          name = "system-fonts-and-icons";
          paths = with pkgs;[
            cursorPackage
          ];
          pathsToLink = [ "/share/icons" ];
        };
      in
      {
        # Create an FHS mount to support flatpak host icons/fonts
        "/usr/share/icons" = mkRoSymBind "${aggregated}/share/icons";
      };

    home-manager.users.davi = {
      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
      };

      qt = {
        enable = true;
        style.name = "adwaita-dark";
      };

      gtk = {
        enable = true;
        gtk3 = {
          extraConfig.gtk-application-prefer-dark-theme = true;
        };
        gtk4 = {
          extraConfig.gtk-application-prefer-dark-theme = true;
        };
        cursorTheme = {
          name = cursorTheme;
          package = cursorPackage;
          size = cursorSize;
        };
      };

      #xresources.properties = { "*dpi" = "120"; "Xft.dpi" = 120; };
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

      #wayland.windowManager.sway.config.seat."*" = {
      #  xcursor_theme = "${cursorTheme} ${builtins.toString cursorSize}";
      #};

      home.packages = with pkgs; [
        gtk4
        gtk3
      ];
    };
  };
}
