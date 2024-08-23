{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.gnome;
in
{
  options = { modules.gnome.enable = mkEnableOption "gnome"; };

  config = mkIf cfg.enable {
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    environment.gnome.excludePackages = (with pkgs; [
      gnome-tour
      gnome-connections
    ]) ++ (with pkgs.gnome; [
      gnome-contacts
      evince # document viewer
    ]);

    home-manager.users.davi = { lib, ... }: {
      dconf = {
        enable = true;
        settings = import ./dconf.nix lib.hm.gvariant;
      };
      home.packages =
        let
          gnomeExtensions = with pkgs.gnomeExtensions;
            [
              pop-shell
              appindicator
              ddterm
              another-window-session-manager
              no-overview
              window-is-ready-remover
              grand-theft-focus
              caffeine
            ];
          gnomePackages = with pkgs; [
            pop-launcher
            gnome.dconf-editor
            wmctrl
            tdrop
          ];
        in
        gnomeExtensions ++ gnomePackages;
    };
  };

}
