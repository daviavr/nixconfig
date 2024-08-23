{ config, pkgs, inputs, lib, ... }:
{

  home.username = "davi";
  home.homeDirectory = "/home/davi";

  home.packages = with pkgs; [
    wl-clipboard
    pop-launcher
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
