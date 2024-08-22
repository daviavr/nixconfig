{ config, pkgs, inputs, lib, ... }:
{
  imports = [ 
  inputs.flatpaks.homeManagerModules.nix-flatpak 
  ];

  home.username = "davi";
  home.homeDirectory = "/home/davi";

  home.packages = with pkgs; [ 
    wl-clipboard 
    pop-launcher
  ];

  services.flatpak = { 
    enable = true;
    packages = [
    "io.dbeaver.DBeaverCommunity"
    "in.cinny.Cinny"
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
    extraConfig = ''
      hide_window_decorations yes
      enable_audio_bell no
    '';
    font = {
      name = "DejaVuSansMono";
      size = 18;
    };
    theme = "Gruvbox Dark";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font.normal.family = "DejaVuSansMono";
      font.size = 18;
    };
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

  programs.neovim = {
    enable = true;

    vimAlias = true;
    viAlias = true;
    vimdiffAlias = true;
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

  programs.direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
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
