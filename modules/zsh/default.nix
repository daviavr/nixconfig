{ pkgs, lib, config, home-manager, ... }:
with lib;
let
  cfg = config.modules.zsh;
in
{

  options = { modules.zsh.enable = mkEnableOption "zsh"; };
  config = mkIf cfg.enable {
    environment.sessionVariables = {
    };

    home-manager.users.davi = {
      home.packages = with pkgs; [ tmux ];
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;
        initExtra = "PATH=\$PATH:/home/davi/.cargo/bin";

        shellAliases = {
          update = "sudo nixos-rebuild switch --flake /home/davi/nixconfig";
          ptg = "polybar-msg cmd toggle";
        };

        oh-my-zsh = {
          enable = true;
          plugins = [ "git tmux" ];
          theme = "robbyrussell";
        };
      };
    };
  };
}
