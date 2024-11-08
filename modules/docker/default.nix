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
      daemon.settings = let HOME = builtins.getEnv "HOME"; in { data-root = "${HOME}/.docker/data"; };
    };
    networking.firewall = {
      enable = true;
      extraCommands = ''
        iptables -I INPUT 1 -s 172.16.0.0/12 -p tcp -d 172.17.0.1 -j ACCEPT
        iptables -I INPUT 2 -s 172.16.0.0/12 -p udp -d 172.17.0.1 -j ACCEPT
      '';
    };
    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };
}
