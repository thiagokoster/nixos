{ config, pkgs, inputs, ... }:
{
  home.stateVersion = "25.05";
  home.username = "koster";
  home.homeDirectory = "/home/koster";

  imports = [
    ../modules/niri
    ../modules/mango
    ../modules/nvim
    ../modules/swaylock.nix
    ../modules/fish.nix
    ../modules/zen-notes.nix
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
    prusa-slicer
    spotify
    blender

    inputs.claude-code.packages.${pkgs.system}.default
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
