{
  description = "My flake";
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Niri
    niri = {
        url = "github:sodiboo/niri-flake";
        inputs.nixpkgs.follows = "nixpkgs";
    };


    nvf = {
        url = "github:notashelf/nvf";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    opencode = {
        url = "github:anomalyco/opencode";
        inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    openspec = {
        url = "github:Fission-AI/OpenSpec";
        inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = inputs@{ self,
  nixpkgs,
  nixpkgs-unstable,
  nvf,
  niri,
  nix-colors,
  opencode,
  openspec,
  ... }:
    let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    in 
    {
      nixosConfigurations.razorback = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
            nvf.nixosModules.default
            niri.nixosModules.niri
            ./hosts/razorback/configuration.nix 
        ];
      };
    };
}
