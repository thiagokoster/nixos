{ pkgs, config, ... }:

{
	programs.kitty = {
	  enable = true;
	  themeFile = "Catppuccin-Mocha";
	  font.package = pkgs.nerd-fonts.jetbrains-mono;
	  font.name = "JetBrainsMono Nerd Font Mono";
	  extraConfig = ''
	    window_padding_width 4
	  '';
	};

}
