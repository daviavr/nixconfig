{ pkgs, lib, config, home-manager, ... }:
with lib;
let
  cfg = config.modules.neovim;
in
{
  options = { modules.neovim.enable = mkEnableOption "neovim"; };
  config = mkIf cfg.enable {
    home-manager.users.davi = {
      programs.neovim = {
        enable = true;
        vimAlias = true;
        viAlias = true;
        vimdiffAlias = true;
      };
      home.programs = with pkgs; [ wl-clipboard ];
    };
  };
}
