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
      gnome-contacts
      epiphany
    ]);

    home-manager.users.davi = { lib, ... }: {
      dconf = {
        enable = true;
        settings = import ./root.nix lib.hm.gvariant;
      };
      home.packages = (with pkgs.gnomeExtensions; [
        pop-shell
        appindicator
        ddterm
        another-window-session-manager
        no-overview
        window-is-ready-remover
        grand-theft-focus
        caffeine
      ]) ++ (with pkgs; [
        pop-launcher
        dconf-editor
        gnome-tweaks
      ]);
      home.file."config.json" = {
        enable = true;
        source = ./floating-window-exception.json;
        target = ".config/pop-shell/config.json";
      };
    };
  };

}
