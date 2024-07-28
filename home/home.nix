{ config, pkgs, ... }:
{
  home.username = "davi";
  home.homeDirectory = "/home/davi";

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
