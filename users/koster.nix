{ config, pkgs, inputs, ... }:
{
  home.stateVersion = "25.05";
  home.username = "koster";
  home.homeDirectory = "/home/koster";

  imports = [
    ../modules/mango
    ../modules/nvim
    ../modules/swaylock.nix
    ../modules/fish.nix
    ../modules/wpaperd.nix
  ];


  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "thiago";
        email = "thiagokoster@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };

  home.packages = with pkgs; [
    nixfmt
    firefox
    obsidian
    freecad
    (import inputs.nixpkgs-unstable { inherit (pkgs.stdenv.hostPlatform) system; config.allowUnfree = true; }).prusa-slicer
    spotify
    blender
    discord

    inputs.claude-code.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
