{config, pkgs, ...}:

{
  imports = [
    ./features/hypr.nix
  ];
  home.username = "koster";
  home.homeDirectory = "/home/koster";

  home.stateVersion = "24.05";

  home.packages = [
    pkgs.fortune
    pkgs.firefox
  ];

  programs.kitty.enable = true;
  programs.git = {
    enable = true;
    userName = "koster";
    userEmail = "thiagokoster@gmail.com";
    extraConfig = ''
[safe]
directory = /etc/nixos
'';

  };

  programs.home-manager.enable = true;
}
