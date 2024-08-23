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

  outputs = { self, nixpkgs, home-manager, flatpaks, ... }@inputs:
    let
      globalNixModules = [ home-manager.nixosModules.home-manager ];
      defaultConfig = hostModulesDefinition: nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = globalNixModules ++ hostModulesDefinition;
      };
    in
    {
      nixosConfigurations = {
        iamkexo = defaultConfig [ ./hosts/iamkexo/configuration.nix ];
        callmekexo = defaultConfig [ ./hosts/callmekexo/configuration.nix ];
      };
    };
}
