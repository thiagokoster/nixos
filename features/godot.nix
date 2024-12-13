{ pkgs, config, ... }:
{
	home.packages = with pkgs; [
		godot_4
	];
	xdg.desktopEntries."org.godotengine.Godot4" = {
		name = "Godot Engine 4";
		exec = "godot4 --single-window";
		icon = "godot";
	};
}
