{ config, pkgs, inputs, home-manager, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules
    ];

  config =
    {
      modules = {
        workstation.enable = true;
        gnome.enable = true;
        #firefox.enable = true;
        kanata.enable = true;
        tlp.enable = true;
        docker.enable = true;
        pipewire.enable = true;
        flatpak.enable = true;
        kitty.enable = true;
        git.enable = true;
        obs-studio.enable = true;
        direnv.enable = true;
        vscode.enable = true;
        neovim.enable = true;
        syncthing.enable = true;
      };

      networking.firewall.allowedTCPPorts = [ 25565 53317 ];
      networking.firewall.allowedUDPPorts = [ 25565 53317 ];

      users.users.cloudflared = {
        group = "cloudflared";
        isSystemUser = true;
      };
      users.groups.cloudflared = { };

      systemd.services.my_tunnel = {
        wantedBy = [ "multi-user.target" ];
        after = [ "network-online.target" "systemd-resolved.service" ];
        serviceConfig = {
          ExecStart = "${pkgs.cloudflared}/bin/cloudflared tunnel --no-autoupdate run --token eyJhIjoiZDUxN2M1OTViMWUyYzQ3MDVhMDRkNzEzZjMzNzUzZmIiLCJ0IjoiMmM1ZjdjODEtMzMwNi00YmM4LTkxNTktMGM4OTUzNDg0N2M1IiwicyI6IlpqQmlNak00TUdNdE9XSTBPUzAwTUROa0xUazJZV0V0TlRZeU5XRTBOVFZpWVRrMyJ9";
          Restart = "always";
          User = "cloudflared";
          Group = "cloudflared";
        };
      };

      environment.systemPackages = [ pkgs.cloudflared pkgs.wget ];

      home-manager.users.davi.home.packages = with pkgs; [
        texlive.combined.scheme-full
        gparted
        pavucontrol
      ];
    };
}
