{ pkgs, lib, config, home-manager, ... }:
with lib;
let
  cfg = config.modules.git;
in
{

  options = { modules.git.enable = mkEnableOption "git"; };
  config = mkIf cfg.enable {
    home-manager.users.davi.programs.git =
      let
        name = "Davi Reis";
        email = "daviavr@gmail.com";

        saferepo = {
          branch = "main";
          dir = "/home/davi/nixconfig";
          git.dir = "/home/davi/nixconfig/.git";
        };
      in
      {
        enable = true;
        userName = name;
        userEmail = email;

        extraConfig = {
          init.defaultBranch = saferepo.branch;
          # adding nixconfig as safe dir
          # https://github.com/NixOS/nix/issues/6443
          # https://discourse.nixos.org/t/nixos-rebuild-switch-fails-under-flakes-and-doas-with-git-warning-about-dubious-ownership/46069/7
          safe = {
            directory = [ saferepo.dir saferepo.git.dir ];
          };
        };

      };
  };
}
