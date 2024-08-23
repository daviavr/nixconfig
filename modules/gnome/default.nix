{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.modules.gnome;
in
{

  options = {
    enable = mkEnableOption;
  };

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
      home.packages = with pkgs.gnomeExtensions;
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
      dconf = {
        enable = true;
        settings = import ./dconf.nix lib.hm.gvariant;
      };
    };
  };
}
