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

      networking.firewall = {
        allowedTCPPorts = [ 25565 53317 ];
        allowedUDPPorts = [ 25565 53317 ];
        logReversePathDrops = true;
        # wireguard trips rpfilter up
        extraCommands = ''
          ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN
          ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN
        '';
        extraStopCommands = ''
          ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN || true
          ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN || true
        '';
      };
      environment.systemPackages = with pkgs;[ 
        jdk17_headless
        nodejs
      ];

      home-manager.users.davi.home.packages = with pkgs; [
        #        texlive.combined.scheme-full
        gparted
        pavucontrol
        ventoy
      ];
    };
}
