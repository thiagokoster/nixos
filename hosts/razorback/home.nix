{ config, pkgs, inputs, ... }:
{
  imports =
    [
      ../../modules/home-manager/git.nix
      ../../modules/home-manager/fish.nix
      ../../modules/home-manager/hyprland.nix
      ../../modules/home-manager/hyprpaper.nix
      inputs.nix-colors.homeManagerModules.default
    ];

  colorScheme = inputs.nix-colors.colorSchemes.dracula;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "koster";
  home.homeDirectory = "/home/koster";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    ripgrep
    inputs.nixvim-custom.packages."x86_64-linux".default

    zellij
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 22;
   };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
