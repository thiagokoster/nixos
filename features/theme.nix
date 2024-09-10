{config, inputs, pkgs, ...}:
let
	inherit (inputs.nix-colors.lib-contrib {inherit pkgs;})
	gtkThemeFromScheme;
in
	{
	# /home/thiagokoster/.nix-profile/share/icons/graphite-dark-nord

	gtk = {
		enable = true;
		theme = {
			name = "${config.colorScheme.slug}";
			package = gtkThemeFromScheme {scheme = config.colorScheme;};
		};

		iconTheme = {
			name = "Zafiro-icons-Dark";
			package = pkgs.zafiro-icons;
		};

		cursorTheme = {
			name = "graphite-dark-nord";
			package = pkgs.graphite-cursors;
			size = 17;
		};
	};
}
