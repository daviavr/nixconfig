{ pkgs, lib, config, home-manager, ... }:
with lib;
let
  cfg = config.modules.direnv;
in
{

  options = { modules.direnv.enable = mkEnableOption "direnv"; };
  config = mkIf cfg.enable {
    home-manager.users.davi.programs.direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

  };
}
