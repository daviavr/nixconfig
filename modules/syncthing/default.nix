{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.syncthing;
in
{
  options = { modules.syncthing.enable = mkEnableOption "syncthing"; };
  config = mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [ 8384 22000 ];
    networking.firewall.allowedUDPPorts = [ 22000 21027 ];
    systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";
    services.syncthing = {
      enable = true;
      user = "davi";
      dataDir = "/home/davi/Documents";
      configDir = "/home/davi/.config/syncthing";
      overrideDevices = true;
      overrideFolders = true;
      settings = {
        options = { 
            globalAnnounceEnabled = false;
            localAnnounceEnabled = true;
            crashReportingEnabled = false;
          };
        devices."pixel8" = {
          id = "HGQADWC-2DVKWLG-SLYAV5J-BP5HG7J-3VZGZVD-BVXOUJI-IJSOVIZ-BJDYCQ5";
        };
        folders."documentos" = {
          id = "c3qdq-tyyre";
          path = "/home/davi/Documents";
          name = "${config.networking.hostName}";
          devices = [ "pixel8" ];
        };
      };
    };
  };
}
