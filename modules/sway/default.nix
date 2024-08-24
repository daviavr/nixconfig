{ config, pkgs, lib, home-manager, ... }:
with lib;
let
  mod = "Mod4";
  cursorTheme = "Bibata-Modern-Classic";
  cursorSize = 20;
  cursorPackage = pkgs.bibata-cursors;
  drun = "pkill wofi || wofi --show drun";
  currPath = ./.;
  cfg = config.modules.sway;
in
{
  options.modules.sway.enable = mkEnableOption "sway";

  config = mkIf cfg.enable {
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    networking.networkmanager.enable = true;

    security.polkit.enable = true;
    services.gnome.gnome-keyring.enable = true;
    systemd.user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
    };

    services.gvfs.enable = true;
    users.users.davi.packages = with pkgs;
      [
        swaybg
        texlive.combined.scheme-full
        gnome.nautilus
        gnome-text-editor
      ];

    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };

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

      programs.wofi = {
        enable = true;
        style = builtins.readFile ./wofi.conf;
      };

      wayland.windowManager.sway = {
        enable = true;
        xwayland = true;
        config = rec {
          modifier = "${mod}";
          terminal = "kitty";
          input."type:keyboard" = {
            xkb_layout = "br";
          };
          output."*" = {
            scale = "1";
            mode = "3440x1440@144Hz";
          };
          defaultWorkspace = "workspace number 1";
          startup = [{ command = "systemctl --user import-environment PATH && systemctl --user restart xdg-desktop-portal.service"; }];
          window = {
            commands = [
              { criteria.app_id = "dropdown"; command = "border pixel 2; move scratchpad"; }
              { criteria.app_id = "dropdown"; command = "move absolute position 0 0"; }
              { criteria.app_id = "dropdown"; command = "resize set 100ppt 40ppt"; }
            ];
          };
          #floating.criteria = [{ app_id = "dropdown"; }];
          keybindings = mkOptionDefault {
            "${mod}+u" = "workspace number 1";
            "${mod}+i" = "workspace number 2";
            "${mod}+o" = "workspace number 3";
            "${mod}+n" = "workspace number 4";
            "${mod}+p" = "scratchpad show";
            "${mod}+Shift+u" = "move container to workspace number 1";
            "${mod}+Shift+i" = "move container to workspace number 2";
            "${mod}+Shift+o" = "move container to workspace number 3";
            "${mod}+Shift+n" = "move container to workspace number 4";
            "${mod}+Shift+p" = "move scratchpad";
            "${mod}+m" = "exec ${./floating-terminal.sh}";
            "${mod}+Tab" = "workspace next";
            "${mod}+Escape" = "workspace prev";
            "${mod}+y" = "fullscreen toggle";
            "${mod}+Shift+space" = "floating toggle";
            "${mod}+space" = "focus mode_toggle";
            "${mod}+s" = "layout stacking";
            "${mod}+e" = "layout toggle split";
            "${mod}+q" = "kill";
            "${mod}+d" = "exec ${drun}";
          };
          seat."*" = {
            xcursor_theme = "${cursorTheme} ${builtins.toString cursorSize}";
          };
        };

      };
    };
  };
}
