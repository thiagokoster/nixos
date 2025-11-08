{pkgs, ...}:

{
  imports = [
  ./wofi.nix
  ./kitty.nix
  ./waybar.nix
  ];

  home.packages = with pkgs; [
    brightnessctl
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$menu" = "pkill wofi || wofi --allow-images --show drun";
      bind = [
        "$mod, F, exec, firefox"
        "$mod, Q, killactive"
        "$mod, D, exec, $menu"
        "$mod, RETURN, exec, kitty"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
	  in [
	    "$mod, code:1${toString i}, workspace, ${toString ws}"
	    "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
	  ]
        )
        9)
      );

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      bindel = [
      	# Adjust screen brightness
				", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
				", XF86MonBrightnessUp, exec, brightnessctl s +10%"

      	# Adjust volume
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      exec-once = [
        "waybar"
      ];

      animations = {
        enabled = true;
        animation = [
          "workspaces, 0"
        ];
      };
    };
  };
}
