{pkgs, ...}:

{
	imports = [
		./waybar.nix
		./kitty.nix
		./rofi.nix
	];

	home.packages = with pkgs; [
		jq
		grim
		slurp
		wl-clipboard 
		brightnessctl
	];

	gtk = {
		enable = true;
		cursorTheme = {
			name = "Bibata-Modern-Ice";
			package = pkgs.bibata-cursors;
			size = 16;
		}; 
	};


	services.hyprpaper = {
		enable = true;
		settings = {
			ipc = "on";
			preload = [
				"~/.wallpapers/wallpaper-2.png"
				"~/.wallpapers/saturn.png"
			];
			wallpaper = [
				"eDP-1,~/.wallpapers/wallpaper-2.png"
				"DP-1,~/.wallpapers/saturn.png"
			];
		};

	};

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
			"$menu" = "pkill rofi || rofi -show-icons -show drun";

			monitor = [
				"eDP-1, 1920x1200, 0x0, 1"
				"DP-1,3440x1440@59.97Hz, 1920x0, 1"
				", preferred, auto, 1"
			];

			exec-once = [
				"waybar"
			];

			env = [
				"XCURSOR_SIZE,16" #TODO: This should be set in the theme.nix file as well.
				"XCURSOR_THEME,Bibata-Modern-Ice"
			];

			windowrulev2 = [
				"float, class:org.pulseaudio.pavucontrol"
				"decorate, class:org.pulseaudio.pavucontrol"
				"center, class:org.pulseaudio.pavucontrol"
			];

			windowrule = [
				"opacity 0.9 0.9, ^(kitty)$"
			];

			misc = {
				disable_hyprland_logo = true;
			};

			xwayland = {
				force_zero_scaling = true;
			};

			general = {
				gaps_in = 2;
				gaps_out = 4;
				resize_on_border = true;

				"col.active_border" = "rgb(B5E8A9)";

			};

			decoration = {
				active_opacity = 1.0;
				fullscreen_opacity = 1.0;
				blur = {
					enabled = true;
					size = 8;
					passes = 3;
					new_optimizations = true;
					ignore_opacity = true;
					xray = true;
					popups = true;
					blurls = ["waybar" "rofi"];
				};
			};

			layerrule = [
				"ignorezero, rofi"
			];


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

				# Change keyboard backlight
				", code:237, exec, brightnessctl -d smc::kbd_backlight s 10-"

				# Adjust screen brightness
				",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
				",XF86MonBrightnessUp, exec, brightnessctl s +10%"

				# Screenshot of the focused monitor
				", Print,  exec, grim -c -o \"$(hyprctl activeworkspace -j | jq -r '.monitor')\" && notify-send -e -t 1000 \"screenshot taken\""
				# Screenshot of region
				"$mod SHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy && wl-paste > ~/Pictures/Screenshot-$(date +%F_%T).png && notify-send -e -t 1000 \"screenshot taken\""
			];
		};
	};

	xdg = {
		portal = {
			enable = true;
			xdgOpenUsePortal = true;
			config = {
				common.default = ["gtk"];
				hyprland.default = ["gtk" "hyprland"];
			};
			extraPortals = [
				pkgs.xdg-desktop-portal-gtk
				pkgs.xdg-desktop-portal-hyprland
			];
		};
	};
}
