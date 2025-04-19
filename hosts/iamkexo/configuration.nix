{ config, pkgs, inputs, outputs, home-manager, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules
    ];

  config = {
    modules = {
      workstation.enable = true;
      #greetd.enable = true;
      #leftwm.enable = true;
      syncthing.enable = true;
      #tlp.enable = true;
      gnome.enable = true;
      cosmic.enable = true;
      #sway.enable = true;
      firefox.enable = true;
      kanata.enable = true;
      docker.enable = true;
      pipewire.enable = true;
      flatpak.enable = true;
      kitty.enable = true;
      git.enable = true;
      obs-studio.enable = true;
      direnv.enable = true;
      vscode.enable = true;
      neovim.enable = true;
      gtkTheming.enable = true;
      #standaloneSecurity.enable = true;
    };

    networking.networkmanager.enable = true;
    hardware.bluetooth.enable = true; # enables support for Bluetooth
    hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

    networking.firewall.allowedTCPPorts = [ 3000 8080 8443 53317];
    #networking.firewall.allowedUDPPorts = [ 22000 21027 ];

    hardware.i2c.enable = true;
    services.printing.enable = true;
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    environment.shellInit = ''
      export SSH_AUTH_SOCK=$(${pkgs.gnupg}/bin/gpgconf --list-dirs agent-ssh-socket)
    '';

    programs.seahorse.enable = true;

    environment.systemPackages = with pkgs; [
      clinfo
    ];

    fonts.packages = with pkgs; [ outputs.packages.feather-font ];

    home-manager.users.davi.home.packages = with pkgs; [
      gnomeExtensions.brightness-control-using-ddcutil
      evince
      ddcutil
      texlive.combined.scheme-full
      gparted
      pavucontrol
      alsa-utils
      gnome-text-editor
    ];
  };
}
