{ pkgs, lib, config, home-manager, ... }:
with lib;
let cfg = config.modules.waybar;
in
{
  options.modules.waybar.enable = mkEnableOption "waybar";
  config = mkIf cfg.enable {
    home-manager.users.davi = {
      programs.waybar = {
        enable = true;
        settings = { myBar = builtins.fromJSON "${builtins.readFile ./waybar.json}"; };
        style = "${builtins.readFile ./gruvbox.css}\n${builtins.readFile ./waybar.css}";
      };
    };
  };
}
