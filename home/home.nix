{ config, pkgs, ... }:
{
  home.username = "davi";
  home.homeDirectory = "/home/davi";
  programs.git = {
    enable = true;
    userName = "Davi Reis";
    userEmail = "daviavr@gmail.com";
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake /home/davi/nixconfig#callmekexo"
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git tmux" ];
      theme = "robbyrussel";
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
