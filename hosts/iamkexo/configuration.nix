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
      #tlp.enable = true;
      #gnome.enable = true;
      sway.enable = true;
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
    };

    home-manager.users.davi.home.packages = with pkgs; [
      tor-browser
      texlive.combined.scheme-full
      gparted
      pavucontrol
    ];
  };
}
