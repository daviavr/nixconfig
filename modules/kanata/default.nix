{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.kanata;
in
{

  options = { modules.kanata.enable = mkEnableOption "kanata"; };

  config = mkIf config.modules.kanata.enable {
    services.kanata = {
      enable = true;
      keyboards.mykeyboards.configFile = ./cfg-linux.kbd;
    };

    users.users.davi.extraGroups = [ "uinput" ]; # "adbusers" ];
  };
}
