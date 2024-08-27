{ config, lib, pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd ${pkgs.sway}/bin/sway --remember --remember-session";
        user = "davi";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    sway
    zsh
    bash
    startxfce4
  '';
}
