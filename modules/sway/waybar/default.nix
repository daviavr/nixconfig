{ pkgs, lib, config, home-manager, ... }:
{
  home-manager.users.davi = {
    programs.waybar = {
      enable = true;
      settings = { myBar = builtins.fromJSON "${builtins.readFile ./waybar.json}"; };
      style = "${builtins.readFile ./gruvbox.css}\n${builtins.readFile ./waybar.css}";
    };
  };
}
