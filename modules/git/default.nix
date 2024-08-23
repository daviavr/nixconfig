{ pkgs, lib, config, home-manager, ... }:
with lib;
let
  cfg = config.modules.git;
in
{

  options = { modules.git.enable = mkEnableOption "git"; };
  config = mkIf cfg.enable {
    home-manager.users.davi.programs.git = {
      enable = true;
      userName = "Davi Reis";
      userEmail = "daviavr@gmail.com";
    };
  };
}
