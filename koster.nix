{pkgs, inputs, ...}:

{
  imports = [
    ./features/hypr.nix
    (import ./features/nvim {inherit pkgs inputs; })
    ./features/mako.nix
    ./features/godot.nix
  ];
  home.username = "koster";
  home.homeDirectory = "/home/koster";

  home.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;
  home.packages = [
    pkgs.fortune
    pkgs.firefox
	pkgs.spotify

	pkgs.jetbrains.idea-community
	pkgs.dbeaver-bin
  ];

  home.sessionPath = [
  	"$HOME/.cargo/bin/"
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
  programs.bash = {
    enable = true;
    initExtra = ''
      if [[ "$(tty)" == /dev/tty* ]]; then 
        quotes random
      fi
    '';
  };

  programs.home-manager.enable = true;

  xdg.desktopEntries."org.godotengine.Godot4" = {
	  name = "Godot Engine 4";
	  exec = "godot4 --single-window";
	  icon = "godot";
  };

  xdg.desktopEntries."com.jetbrains.IDEA" = {
	  name = "Intellij IDEA CE (Wayland)";
	  exec = "idea-community -Dawt.toolkit.name=WLToolkit";
	  icon = "idea-community";
  };
}
