{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];  

  networking.hostName = "callmekexo"; # Define your hostname.
  networking.networkmanager.enable = true;

  networking.firewall = {
    allowedTCPPorts = [ 8384 22000 ];
    allowedUDPPorts = [ 22000 21027 ];
  };

  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.flatpak.enable = true;

  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";
  services.syncthing = {
    enable = true;
    user = "davi";
    dataDir = "/home/davi/Documents";
    configDir = "/home/davi/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices."pixel8" = {id = "HGQADWC-2DVKWLG-SLYAV5J-BP5HG7J-3VZGZVD-BVXOUJI-IJSOVIZ-BJDYCQ5";};
      folders."documentos" = {
        id = "c3qdq-tyyre";
        path = "/home/davi/Documents";
        name = "callmekexo";
	devices = [ "pixel8" ];
      };
    };
  };

  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  console.keyMap = "br-abnt2";

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = false;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users.davi = {
    isNormalUser = true;
    description = "Davi Reis";
    extraGroups = [ "networkmanager" "wheel" "uinput" "adbusers"];
    shell = pkgs.zsh;
  };

  programs.firefox = { 
    enable = true;
    policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value= true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "newtab"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"
    };
  };

  programs.adb.enable = true;

  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.optimise.automatic = true;
  nix.extraOptions = ''
    min-free = ${toString (100 * 1024 * 1024)}
    max-free = ${toString (1024 * 1024 * 1024)}
  '';
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 15d";
  };

  environment.systemPackages = with pkgs; [
    neovim
    chromium
    git
    tor-browser
    ffmpeg
    direnv
    keyd
    tmux
    texlive.combined.scheme-full
    gnome.dconf-editor
    gparted
    kitty
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
