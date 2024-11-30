{ pkgs, config, ... }:

{
	programs.kitty.enable = true;
	programs.kitty.font.package = pkgs.nerd-fonts.jetbrains-mono;
	programs.kitty.font.name = "JetBrainsMono Nerd Font Mono";
	programs.kitty.extraConfig = ''
	'';

}
