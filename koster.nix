{config, pkgs, ...}:

{
  imports = [
    ./features/hypr.nix
    ./features/nvim
    ./features/mako.nix
    ./features/godot.nix
  ];
  home.username = "koster";
  home.homeDirectory = "/home/koster";

  home.stateVersion = "24.05";

  home.packages = [
    pkgs.fortune
    pkgs.firefox
  ];

  home.file = {
    ".wallpapers".source = ./features/wallpapers;
  };

  programs.kitty.enable = true;
  programs.git = {
    enable = true;
    userName = "koster";
    userEmail = "thiagokoster@gmail.com";
    extraConfig = {
        safe.directory = "/etc/nixos";
	core.editor = "vim";
    };
  };

  programs.home-manager.enable = true;
}
