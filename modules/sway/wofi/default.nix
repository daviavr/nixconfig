{ pkgs, lib, config, home-manager, ... }:
{
  home-manager.users.davi = {
    programs.wofi = {
      enable = true;
      style = builtins.readFile ./wofi.conf;
    };
  };
}
