{ pkgs, lib, ... }:
{
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

  environment.systemPackages = with pkgs.gnomeExtensions; [
    pop-shell
    appindicator
    ddterm
    another-window-session-manager
    no-overview
    window-is-ready-remover
    grand-theft-focus
    caffeine
  ];

  home-manager.users.davi = import ./dconf.nix;   
}
