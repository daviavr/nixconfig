{ lib, config, pkgs, ... }:
with lib;
let cfg = config.modules.docker;
in
{
  options = { modules.docker.enable = mkEnableOption "docker"; };
  config = mkIf cfg.enable {
    virtualisation.docker = {
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
      daemon.settings = let HOME = builtins.getEnv "HOME"; in { data-root = "${HOME}.docker/data"; };
    };
    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };
}
