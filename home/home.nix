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
    gnomeExtensions.caffeine
  ];

  services.flatpak = { 
    enable = true;
    packages = [
    "org.torproject.torbrowser-launcher"
    "org.signal.Signal"
    "md.obsidian.Obsidian"
    "dev.vencord.Vesktop"
    "com.discordapp.Discord"
    "com.spotify.Client"
    "com.github.wwmm.easyeffects"
    ];
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    extraConfig = ''hide_window_decorations yes'';
  };

  programs.git = {
    enable = true;
    userName = "Davi Reis";
    userEmail = "daviavr@gmail.com";
  };

  programs.obs-studio = {
    enable = true;
    plugins = [ pkgs.obs-studio-plugins.obs-vaapi ];
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

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      usernamehw.errorlens
      esbenp.prettier-vscode
      pkief.material-icon-theme
    ];
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
