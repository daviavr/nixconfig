{ config, pkgs, lib, ... }:

{
  imports = [ ../../modules ];

  config.modules = {
    gnome.enable = true;
  };

}
