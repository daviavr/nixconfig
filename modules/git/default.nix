{ pkgs, lib, config, home-manager, ... }:
with lib;
let
  cfg = config.modules.git;
in
{

  options = { modules.git.enable = mkEnableOption "git"; };
  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      config = {
        safe = {
          "directory" = [ "/home/davi/nixconfig" ];
        };
      };
    };
    home-manager.users.davi.programs.git = {
      enable = true;
      userName = "Davi Reis";
      userEmail = "daviavr@gmail.com";
      extraConfig.init.defaultBranch = "main";
    };
  };
}
