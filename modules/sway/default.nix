{ config, pkgs, lib, home-manager, ... }:
with lib;
let
  mod = "Mod4";
  drun = "pkill wofi || ${pkgs.wofi}/bin/wofi --show drun";
  cfg = config.modules.sway;
in
{
  imports = [ ./theming.nix ./wofi ./waybar ];

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
        swaynotificationcenter
        swayosd
        swaybg
        texlive.combined.scheme-full
        gnome.nautilus
        gnome-text-editor
        networkmanagerapplet
      ];

    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };

    home-manager.users.davi = {
      wayland.windowManager.sway = {
        enable = true;
        extraConfigEarly = "exec systemctl --user import-environment PATH && systemctl --user restart xdg-desktop-portal.service\n";
        extraConfig = ''
          default_border pixel 5
          default_floating_border pixel 5
        '';
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
          startup = [
            { command = "${pkgs.swayosd}/bin/swayosd-server"; }
            { command = "${pkgs.flatpak}/bin/flatpak com.github.wwmm.easyeffects --gapplication-service"; }
            { command = "${pkgs.ungoogled-chromium}/bin/chromium"; }
            #{ command = "${pkgs.flatpak}/bin/flatpak run dev.vencord.Vesktop"; }
            #{ command = "${pkgs.flatpak}/bin/flatpak run md.obsidian.Obsidian"; }
            { command = "${pkgs.flatpak}/bin/flatpak run com.spotify.Client"; }
          ];
          bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];
          window = {
            commands = [
              { criteria.app_id = ".*"; command = "border pixel 5"; }
              { criteria.class = ".*"; command = "border pixel 5"; }
              { criteria.app_id = "dropdown"; command = "border pixel 3; move scratchpad"; }
              { criteria.app_id = "dropdown"; command = "move absolute position 0 0"; }
              #{ criteria.app_id = "dropdown"; command = "resize set 100ppt 40ppt"; }
            ];
            titlebar = false;
          };
          floating.criteria = let ins = "^(?i)"; in
            [
              { app_id = ins + "vesktop"; }
              { class = ins + "Spotify"; }
              { app_id = ins + "org.gnome.Nautilus"; }
            ];
          assigns = let ins = "^(?i)"; in
            {
              "1" = [{ class = ins + "Chromium-browser"; }];
              "4" = [
                { app_id = ins + "vesktop"; }
                { class = ins + "Spotify"; }
              ];
            };
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
            "${mod}+w" = "split toggle";
            "${mod}+Shift+w" = "layout toggle split";
            "${mod}+q" = "kill";
            "${mod}+d" = "exec ${drun}";
            "XF86AudioRaiseVolume" = "exec ${pkgs.swayosd}/bin/swayosd-client --output-volume 5";
            "XF86AudioLowerVolume" = "exec ${pkgs.swayosd}/bin/swayosd-client --output-volume -5";
            "XF86AudioMute" = "exec ${pkgs.swayosd}/bin/swayosd-client --output-volume mute-toggle";
            "--release Caps_Lock" = "exec ${pkgs.swayosd}/bin/swayosd-client --caps-lock";
            "${mod}+Shift+m" = "exec ${pkgs.swayosd}/bin/swayosd-client --input-volume mute-toggle";
          };
        };
      };
    };
  };
}
