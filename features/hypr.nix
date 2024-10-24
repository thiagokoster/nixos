{pkgs, ...}:

{
# Hyprland
	wayland.windowManager.hyprland = {
		# Whether to enable Hyprland wayland compositor
		enable = true;
		# The hyprland package to use
		package = pkgs.hyprland;
		# Whether to enable XWayland
		xwayland.enable = true;

		# Optional
		# Whether to enable hyprland-session.target on hyprland startup
		systemd.enable = true;


		settings = {
			"$mod" = "SUPER";
			"$terminal" = "kitty";
			"$menu" = "pkill wofi || wofi --allow-images --show drun";

			exec-once = [
				"swww init ; sleep 1 && swww img ~/.wallpapers/wallpaper1.png"
				"waybar"
			];

			env = [
				"XCURSOR_SIZE,17" #TODO: This should be set in the theme.nix file as well.
				"XCURSOR_THEME,graphite-dark-nord"
			];

			misc = {
				disable_hyprland_logo = true;
	 		};

			xwayland = {
				force_zero_scaling = true;
			};

			general = {
				gaps_in = 6;
				gaps_out = 6;
				resize_on_border = true;
			};

			#	cursor = {
			#	cur	enable_hyprcursor = true;
			#	cur};

			animations = {
				enabled = true;
				animation = [
					"workspaces, 0"
				];
			};

			bindm = [
				"$mod, mouse:272, movewindow"
			];

			binde = [
				"$mod SHIFT, l, resizeactive, 30 0" 
				"$mod SHIFT, h, resizeactive, -30 0" 
				"$mod SHIFT, k, resizeactive, 0 -30" 
				"$mod SHIFT, j, resizeactive, 0 30" 
			];

			bind = [
				# General
				"$mod, return, exec, $terminal"
				"$mod, D, exec, $menu"
				"$mod, C, killactive"
				"$mod, M, exit"

				# Screen focus
            	"$mod, v, togglefloating"
				"$mod, f, fullscreen"

				# Switch workspaces with mainMod + [0-9]
				"$mod, 1, workspace, 1"
				"$mod, 2, workspace, 2"
				"$mod, 3, workspace, 3"
				"$mod, 4, workspace, 4"
				"$mod, 5, workspace, 5"
				"$mod, 6, workspace, 6"
				"$mod, 7, workspace, 7"
				"$mod, 8, workspace, 8"
				"$mod, 9, workspace, 9"
				"$mod, 0, workspace, 10"

				# Move to workspaces
				"$mod SHIFT, 1, movetoworkspace,1"
				"$mod SHIFT, 2, movetoworkspace,2"
				"$mod SHIFT, 3, movetoworkspace,3"
				"$mod SHIFT, 4, movetoworkspace,4"
				"$mod SHIFT, 5, movetoworkspace,5"
				"$mod SHIFT, 6, movetoworkspace,6"
				"$mod SHIFT, 7, movetoworkspace,7"
				"$mod SHIFT, 8, movetoworkspace,8"
				"$mod SHIFT, 9, movetoworkspace,9"
				"$mod SHIFT, 0, movetoworkspace,10"

				# Navigation
				"$mod, h, movefocus, l"
				"$mod, l, movefocus, r"
				"$mod, k, movefocus, u"
				"$mod, j, movefocus, d"

				# Move active window
				"$mod SHIFT $CONTROL, H, movewindow, l"
				"$mod SHIFT $CONTROL, L, movewindow, r"
				"$mod SHIFT $CONTROL, J, movewindow, d"
				"$mod SHIFT $CONTROL, K, movewindow, u"


			];
		};
	};
}
