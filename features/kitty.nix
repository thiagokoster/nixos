{ pkgs, config, ... }:

{
	programs.kitty.enable = true;
	programs.kitty.extraConfig = ''
	foreground #${config.colorScheme.palette.base04}
	background #${config.colorScheme.palette.base01}
	'';

}
