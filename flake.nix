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

    nvf.url = "github:notashelf/nvf";
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = inputs@{ self,
  nixpkgs,
  nixpkgs-stable,
  nvf,
  nix-colors, ... }:
    let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    in 
    {
      nixosConfigurations.razorback = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          nvf.nixosModules.default
          ./hosts/razorback/configuration.nix 
        ];
      };
    };
}
