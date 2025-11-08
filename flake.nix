{
  description = "My flake";
  inputs = {
    # Nixpkgs
    nixpkgs.url = "nixpkgs/nixos-25.05";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim-custom.url = "github:thiagokoster/nixvim";
  };

  outputs = { self, nixpkgs, nixvim-custom, ... }@inputs:
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
