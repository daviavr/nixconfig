{ pkgs, lib, config, home-manager, nixpkgs, ... }:
with lib;
let
  cfg = config.modules.vscode;
in
{

  options = { modules.vscode.enable = mkEnableOption "kitty"; };
  config = mkIf cfg.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "vscode"
    ];

    home-manager.users.davi.programs.vscode = {
      enable = true;
      package = pkgs.vscode;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        usernamehw.errorlens
        esbenp.prettier-vscode
        pkief.material-icon-theme
      ];
    };
  };
}
