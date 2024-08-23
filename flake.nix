{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flatpaks.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
  };

  outputs = { self, nixpkgs, home-manager, config, ... }@inputs:
    let
      mkSystem = system: hostname:
        nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = { inherit inputs; };
          modules = [
            ./modules/workstation
            ./hosts/${hostname}/configuration.nix
            (./. + "/hosts/${hostname}/hardware-configuration.nix")
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                extraSpecialArgs = { inherit inputs; };
                users.davi = (./. + "/hosts/${hostname}/home.nix");
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        iamkexo = mkSystem "x86_64-linux" "iamkexo";
        callmekexo = mkSystem "x86_64-linux" "callmekexo";
      };
    };
}
# "x86_64-linux"
