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
      home.packages = with pkgs; [
        wl-clipboard
        lua51Packages.lua
        lua51Packages.luarocks
        nixpkgs-fmt
      ];
      home.file."nvim" = {
        enable = true;
        source = ./nvim;
        target = ".config/nvim";
      };
    };
  };
}
