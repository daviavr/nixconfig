{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules
    ];
  config.modules = {
      workstation.enable = true;
      gnome.enable = true;
      firefox.enable = true;
      kanata.enable = true;
      tlp.enable = true;
      docker.enable = true;
      pipewire.enable = true;
      flatpak.enable = true;
      kitty.enable = true;
      git.enable = true;
      obs-studio.enable = true;
      zsh.enable = true;
      direnv.enable = true;
      vscode.enable = true;
    };
}
