{ pkgs, lib, config, home-manager, ... }:
{
  home-manager.users.davi = {
    programs.wofi = {
      enable = enable;
      style = builtins.readFile ./wofi.conf;
    };
  };
}
