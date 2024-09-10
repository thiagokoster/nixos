{config, inputs, pkgs, ...}:
let
	inherit (inputs.nix-colors.lib-contrib {inherit pkgs;})
	gtkThemeFromScheme;
in
	{
	gtk = {
		enable = true;
		theme = {
			name = "${config.colorScheme.slug}";
			package = gtkThemeFromScheme {scheme = config.colorScheme;};
		};
	};

	# Add cursor
	home.pointerCursor = {
		gtk.enable = true;
		x11.enable = true;
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Classic";
		size = 24;
	};
}
