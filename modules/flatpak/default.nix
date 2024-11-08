{ lib, config, pkgs, home-manager, ... }:
with lib;
let
  cfg = config.modules.flatpak;
in
{
  options = { modules.flatpak.enable = mkEnableOption "flatpak"; };

  config = mkIf cfg.enable {
    services.flatpak.enable = true;

    systemd.user.services.easyeffectsAutorun = {
      description = "...";
      script = ''
        ${pkgs.flatpak}/bin/flatpak run com.github.wwmm.easyeffects --gapplication-service
      '';
      wantedBy = [ "multi-user.target" ]; # starts after login
    };

    home-manager.users.davi = { inputs, ... }: with inputs;{
      imports = [ flatpaks.homeManagerModules.nix-flatpak ];
      services.flatpak = {
        enable = true;
        packages = [
          "io.beekeeperstudio.Studio"
          "io.github.zen_browser.zen"
          "in.cinny.Cinny"
          "org.signal.Signal"
          "md.obsidian.Obsidian"
          "dev.vencord.Vesktop"
          "com.discordapp.Discord"
          "com.spotify.Client"
          "com.github.wwmm.easyeffects"
        ];
      };
      home.file =
        let
          presetsDir = "~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/";
        in
        {
          ".local/scripts/copy.sh" = { enable = true; executable = true; text = "#!/usr/bin/env bash\n\nmkdir -p ${presetsDir}\ncp -rf ${./easyeffects}/* ${presetsDir}"; };
        };
    };
  };
}
