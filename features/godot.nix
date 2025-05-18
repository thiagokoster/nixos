{ pkgs, config, ... }:
{
	home.packages = with pkgs; [
		godot_4-mono
		dotnet-sdk
		csharp-ls
	];

	xdg.desktopEntries."org.godotengine.Godot4" = {
		name = "Godot Engine 4 (Single window)";
		exec = "godot --single-window";
		icon = "godot";
	};
}
