{ pkgs, lib, config, home-manager, ... }:
with lib;
let cfg = config.modules.wofi;
in
{
  options.modules.wofi = mkEnableOption "wofi";
  config = mkIf cfg.enable {
    home-manager.users.davi = {
      programs.wofi = {
        enable = true;
        style = builtins.readFile ./wofi.conf;
      };
    };
  };
}
