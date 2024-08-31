{ config, pkgs, inputs, home-manager, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules
    ];

  config = {
    modules = {
      workstation.enable = true;
      #greetd.enable = true;
      leftwm.enable = true;
      #tlp.enable = true;
      #gnome.enable = true;
      #sway.enable = true;
      firefox.enable = true;
      kanata.enable = true;
      docker.enable = true;
      pipewire.enable = true;
      flatpak.enable = true;
      kitty.enable = true;
      git.enable = true;
      obs-studio.enable = true;
      direnv.enable = true;
      vscode.enable = true;
      neovim.enable = true;
      gtkTheming.enable = true;
      standaloneSecurity.enable = true;
    };

    networking.networkmanager.enable = true;
    hardware.bluetooth.enable = true; # enables support for Bluetooth
    hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boo

    services.xserver.enable = true;

    xdg.portal = {
      enable = true;
      config.common.default = [
            "wlr"
            "gtk"
            "gnome"
          ];
      wlr.enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gnome xdg-desktop-portal-gtk ];
    };

    services.gvfs.enable = true;
    environment.systemPackages = with pkgs; [
      xdg-desktop-portal-wlr xdg-desktop-portal-gnome xdg-desktop-portal-gtk
    ];

    home-manager.users.davi.home.packages = with pkgs; [
      tor-browser
      texlive.combined.scheme-full
      gparted
      pavucontrol
      android-studio
    ];
  };
}
