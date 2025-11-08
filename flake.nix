{
  description = "My flake";
  inputs = {
# Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-25.05";

# Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim-custom.url = "github:thiagokoster/nixvim";
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-stable, nixvim-custom, ... }:
    let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    in 
    {
      nixosConfigurations.razorback = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/razorback/configuration.nix 
        ];
      };
    };
}
