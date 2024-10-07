{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flatpaks.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      mkSystem = system: hostname:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/${hostname}/configuration.nix
            { networking.hostName = hostname; }
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                extraSpecialArgs = { inherit inputs; };
                users.davi = {
                  home.username = "davi";
                  home.homeDirectory = "/home/davi";
                  programs.home-manager.enable = true;
                  home.stateVersion = "24.05";
                };
              };
            }
          ];
        };
    in
    rec {
      packages = import ./pkgs nixpkgs.legacyPackages.x86_64-linux;
      nixosConfigurations = {
        iamkexo = mkSystem "x86_64-linux" "iamkexo";
        callmekexo = mkSystem "x86_64-linux" "callmekexo";
      };
    };
}
