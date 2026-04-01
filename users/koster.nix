{ config, pkgs, ... }:
{
  home.username = "koster";
  home.homeDirectory = "/home/koster";

  home.stateVersion = "25.05";

  imports = [
    ../modules/niri
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
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
