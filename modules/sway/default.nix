{ config, pkgs, lib, home-manager, ... }:
with lib;
let
  mod = "Mod4";
  drun = "pkill wofi || ${pkgs.wofi}/bin/wofi --show drun";
  cfg = config.modules.sway;
in
{
  imports = [ ./wofi ./waybar ];

  options.modules.sway.enable = mkEnableOption "sway";

  config = mkIf cfg.enable {
    modules = { wofi.enable = true; waybar.enable = true; };

    xdg.portal = {
      enable = true;
      config.sway.default = [
        "wlr"
        "gtk"
        #"gnome"
      ];
      wlr.enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gnome xdg-desktop-portal-gtk ];
    };

    users.users.davi.packages = with pkgs;
      [
        gammastep
        gnome.adwaita-icon-theme
        gnome-themes-extra
        playerctl
        swaynotificationcenter
        swayosd
        swaybg
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
            scale = "1.25";
            mode = "3440x1440@144Hz";
          };
          defaultWorkspace = "workspace number 1";
          startup = [
            { command = "${pkgs.swayosd}/bin/swayosd-server"; }
            { command = "${pkgs.gammastep}/bin/gammastep -l -22.5:-47.4 -b 1:0.8"; }
            { command = "${pkgs.flatpak}/bin/flatpak run com.github.wwmm.easyeffects --gapplication-service"; }
            { command = "${pkgs.ungoogled-chromium}/bin/chromium"; }
            { command = "${pkgs.flatpak}/bin/flatpak run dev.vencord.Vesktop"; }
            { command = "${pkgs.flatpak}/bin/flatpak run com.discordapp.Discord"; }
            { command = "${pkgs.flatpak}/bin/flatpak run md.obsidian.Obsidian"; }
            { command = "${pkgs.flatpak}/bin/flatpak run com.spotify.Client"; }
          ];
          floating.criteria = let ins = "^(?i)"; in
            [
              #{ app_id = ins + "vesktop"; }
              #{ class = ins + "Spotify"; }
              { app_id = ins + "org.gnome.Nautilus"; }
              { app_id = ins + "pavucontrol"; }
              #{ class = ins + "obsidian"; }
              #{ class = ins + "discord"; }
            ];
          bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];
          window = {
            commands = [
              { criteria.app_id = ".*"; command = "border pixel 8"; }
              { criteria.class = ".*"; command = "border pixel 8"; }
              { criteria.app_id = "dropdown"; command = "border pixel 3; move scratchpad"; }
              #{ criteria.app_id = "dropdown"; command = "move absolute position 0 0"; }
              #{ criteria.app_id = "dropdown"; command = "resize set 100ppt 40ppt"; }
            ];
            titlebar = false;
          };
          assigns = let ins = "^(?i)"; in
            {
              "1" = [{ class = ins + "Chromium-browser"; }];
              "2" = [
                { class = ins + "vscodium"; }
                { class = ins + "vscode"; }
              ];
              "3" = [{ class = ins + "obsidian"; }];
              "4" = [
                { app_id = ins + "vesktop"; }
                { class = ins + "Spotify"; }
                { class = ins + "discord"; }
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
            "--locked XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
            "--locked XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
            "--locked XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
          };
        };
      };
    };
  };
}
