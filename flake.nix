{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    claude-code.url = "github:sadjow/claude-code-nix";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    # NV (Neovim)
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nvf,
      claude-code,
      neovim-nightly,
      ...
    }@inputs:
    {
      nixosConfigurations.razorback = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/razorback/configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };
}
