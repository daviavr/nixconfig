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

      extraConfig = {
        init.defaultBranch = "main";
# adding nixconfig as safe dir
# https://github.com/NixOS/nix/issues/6443
# https://discourse.nixos.org/t/nixos-rebuild-switch-fails-under-flakes-and-doas-with-git-warning-about-dubious-ownership/46069/7
        safe = {
          directory = [ "$HOME/nixconfig/.git" ];
        };
      };

    };
  };
}
