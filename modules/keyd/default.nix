{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.keyd;
in
{

  options = { modules.keyd.enable = mkEnableOption "keyd"; };
  config = mkIf cfg.enable {
    systemd.services.keyd = {
      description = "key remapping daemon";
      enable = true;
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.keyd}/bin/keyd";
      };
      wantedBy = [ "sysinit.target" ];
      requires = [ "local-fs.target" ];
      after = [ "local-fs.target" ];
    };
    environment.etc."keyd/default.conf".text = builtins.readFile ./keymaps.conf;
  };
}
