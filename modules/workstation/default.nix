{ pkgs, lib, config, inputs, ... }:
let
  cfg = config.modules.workstation;
in
{
  options = {
    modules.workstation.enable = lib.mkEnableOption "workstation";
  };

  config = lib.mkIf cfg.enable {

    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    #security.doas.enable = true;
    #security.sudo.enable = false;
    #security.doas.extraRules = [{
    #  users = [ "davi" ];
    #  # Optional, retains environment variables while running commands 
    #  # e.g. retains your NIX_PATH when applying your config
    #  keepEnv = true;
    #  persist = true; # Optional, don't ask for the password for some time, after a successfully authentication
    #}];

    services.xserver.xkb = {
      layout = "br";
      variant = "";
    };

    console.keyMap = "br-abnt2";
    #services.printing.enable = true;

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

    users.users.davi = {
      isNormalUser = true;
      description = "Davi Reis";
      extraGroups = [ "networkmanager" "wheel" ]; #"uinput" "adbusers" ];
      shell = pkgs.zsh;
    };

    programs.adb.enable = true;

    programs.zsh.enable = true;
    modules.zsh.enable = true;

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

    services.gvfs.enable = true;

    environment.systemPackages = with pkgs; [
      bind
      ungoogled-chromium
      unzip
      git
      gcc
      ripgrep
      ffmpeg
      (
        let base = pkgs.appimageTools.defaultFhsEnvArgs; in
        pkgs.buildFHSEnv (base // {
          name = "fhs";
          targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [ pkgs.pkg-config pkgs.doas];
          profile = "export FHS=1";
          runScript = "zsh";
          extraOutputsToInstall = [ "dev" ];
        })
      )
    ];

    environment.sessionVariables = rec {
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    };

    fonts.packages = with pkgs; [ nerd-fonts.caskaydia-mono nerd-fonts.fira-code nerd-fonts.fira-mono ];

    system.stateVersion = "24.05"; # Did you read the comment?
  };
}
