{config, inputs, ...}: 

{
    imports = [
        ./kitty.nix
        ./waybar.nix
    ];

  nixpkgs.overlays = [
    inputs.niri.overlays.niri
  ];

    programs.niri = {
        settings = {
            layout = {
                gaps = 16;
                default-column-width = { proportion = 1. / 2.; };
                preset-column-widths = [
                    { proportion = 1. / 3.; }
                    { proportion = 1. / 2.; }
                    { proportion = 2. / 3.; }
                ];
            };
            spawn-at-startup = [
                { command = ["waybar"]; }
            ];
            binds = with config.lib.niri.actions; {
                "Mod+Shift+Slash".action = show-hotkey-overlay;
                "Mod+T".action = spawn "kitty";
                "Mod+D".action = spawn "fuzzel";

                # Open/close the Overview: a zoomed-out view of workspaces and windows.
                # You can also move the mouse into the top-left hot corner,
                # or do a four-finger swipe up on a touchpad.
                "Mod+O" = { 
                    repeat = false;
                    action = toggle-overview; 
                };
                "Mod+Q" = { 
                    repeat = false;
                    action = close-window; 
                };

                "Mod+R".action = switch-preset-column-width;


                # Focus
                "Mod+H".action = focus-column-or-monitor-left;
                "Mod+L".action = focus-column-or-monitor-right;
                "Mod+J".action = focus-window-or-workspace-down;
                "Mod+K".action = focus-window-or-workspace-up;

                "Mod+1".action = focus-workspace 1;
                "Mod+2".action = focus-workspace 2;
                "Mod+3".action = focus-workspace 3;
                "Mod+4".action = focus-workspace 4;
                "Mod+5".action = focus-workspace 5;
                "Mod+6".action = focus-workspace 6;
                "Mod+7".action = focus-workspace 7;
                "Mod+8".action = focus-workspace 8;
                "Mod+9".action = focus-workspace 9;

                # Move
                "Mod+Shift+H".action = move-column-left-or-to-monitor-left;
                "Mod+Shift+L".action =  move-column-right-or-to-monitor-right;
                "Mod+Shift+J".action =  move-window-down-or-to-workspace-down;
                "Mod+Shift+K".action =  move-window-up-or-to-workspace-up;

                "Mod+F".action = maximize-column;
                "Mod+Shift+F".action = fullscreen-window;

                # Windows
                "Mod+BracketLeft".action = consume-or-expel-window-left;
                "Mod+BracketRight".action = consume-or-expel-window-right;

                # Fn keys
                    "XF86MonBrightnessUp".action = spawn "brightnessctl s +10%";
    "XF86MonBrightnessDown".action = spawn "brightnessctl s -10%";

                "Mod+Shift+E".action = quit;
            };
        };
    };
}
