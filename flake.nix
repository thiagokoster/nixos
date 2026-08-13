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

    awww.url = "git+https://codeberg.org/LGFae/awww";
    mangowm.url = "github:mangowm/mango";
    waybar.url = "github:Alexays/Waybar";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      claude-code,
      neovim-nightly,
      awww,
      mangowm,
      waybar,
      ...
    }@inputs:
    {
      nixosConfigurations.razorback = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          mangowm.nixosModules.mango
          ./hosts/razorback/configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };
}
