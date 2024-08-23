{ pkgs, lib, config, inputs, ... }:
let
  cfg = config.modules.workstation;
in
{
  options = {
    modules.workstation.enable = lib.mkEnableOption "workstation";
  };

  config = lib.mkIf cfg.enable {

    services.xserver.xkb = {
      layout = "br";
      variant = "";
    };

    console.keyMap = "br-abnt2";

    #services.printing.enable = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];


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

    networking.hostName = "callmekexo"; # Define your hostname.

    users.users.davi = {
      isNormalUser = true;
      description = "Davi Reis";
      extraGroups = [ "networkmanager" "wheel" ]; #"uinput" "adbusers" ];
      shell = pkgs.zsh;
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
      wmctrl
      tdrop
      ripgrep
      gcc
      lua51Packages.lua
      lua51Packages.luarocks
      ungoogled-chromium
      zed-editor
      tor-browser
      git
      nixpkgs-fmt
      nil
      unzip
      ffmpeg
      keyd
      tmux
      texlive.combined.scheme-full
      gnome.dconf-editor
      gparted
      kitty
      kitty-themes
      alacritty
      alacritty-theme
      (
        let base = pkgs.appimageTools.defaultFhsEnvArgs; in
        pkgs.buildFHSUserEnv (base // {
          name = "fhs";
          targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [ pkgs.pkg-config ];
          profile = "export FHS=1";
          runScript = "zsh";
          extraOutputsToInstall = [ "dev" ];
        })
      )
    ];

    fonts.packages = with pkgs; [ nerdfonts ];

    system.stateVersion = "24.05"; # Did you read the comment?
  };
}
