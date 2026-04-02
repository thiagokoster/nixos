{ config, pkgs, ... }:
{
  home.stateVersion = "25.05";
  home.username = "koster";
  home.homeDirectory = "/home/koster";

  imports = [
    ../modules/niri
    ../modules/nvf.nix
    ../modules/swaylock.nix
    ../modules/fish.nix
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
    firefox
    obsidian
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
