{ config, pkgs, flake-inputs, ... }:
{
  imports = [ flake-inputs.flatpaks.homeManagerModules.nix-flatpak ];
  home.username = "davi";
  home.homeDirectory = "/home/davi";

  home.packages = with pkgs; [ 
    wl-clipboard 
    gnomeExtensions.pop-shell
    pop-launcher
    gnomeExtensions.ddterm
    gnomeExtensions.another-window-session-manager
    gnomeExtensions.no-overview
    gnomeExtensions.window-is-ready-remover
    gnomeExtensions.grand-theft-focus
  ];

  services.flatpak.enable = true;

  services.flatpak.packages = [
    "com.obsproject.Studio"
    "md.obsidian.Obsidian"
    "dev.vencord.Vesktop"
    "com.spotify.Client"
    "com.github.wwmm.easyeffects"
  ];

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
    initExtra = "PATH=\$PATH:/home/davi/.cargo/bin";
    
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake /home/davi/nixconfig#callmekexo";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git tmux" ];
      theme = "robbyrussell";
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
