{ pkgs, lib, config, home-manager, ... }:
with lib;
let
  cfg = config.modules.vscode;
in
{

  options = { modules.vscode.enable = mkEnableOption "kitty"; };
  config = mkIf cfg.enable {
    home-manager.users.davi.programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        usernamehw.errorlens
        esbenp.prettier-vscode
        pkief.material-icon-theme
      ];
    };
  };
}
