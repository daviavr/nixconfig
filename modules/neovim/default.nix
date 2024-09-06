{ pkgs, lib, config, home-manager, ... }:
with lib;
let
  cfg = config.modules.neovim;
in
{
  options = { modules.neovim.enable = mkEnableOption "neovim"; };
  config = mkIf cfg.enable {
    home-manager.users.davi = { lib, ... }: {
      programs.neovim = {
        enable = true;
        vimAlias = true;
        viAlias = true;
        vimdiffAlias = true;
      };
      home.packages = with pkgs; [
        wl-clipboard
        luajit
        luajitPackages.luarocks
        nixpkgs-fmt
      ];
      home.activation = {
        removeNvimCfg = lib.hm.dag.entryAfter [ "writeBoundary" ] "run --quiet rm -rf $HOME/.config/nvim";
        copyNvimCfg = lib.hm.dag.entryAfter [ "removeNvimCfg" ] "run --quiet ln -s $HOME/nixconfig/modules/neovim/nvim $HOME/.config/nvim";
      };
    };
  };
}
