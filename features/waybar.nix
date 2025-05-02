{config, pkgs, ...}:
let
	icon-font = "3270 Nerd Font"; 
in
	{
	home.packages = with pkgs; [
		libnl # Network module
	];

	programs.waybar = {
		enable = true;
		settings = [{
			layer = "top";
			position = "top";
			mod = "dock";
			height = 26;
			modules-left = [ "hyprland/workspaces" ];
			modules-right = [ "clock" "pulseaudio" "network" "battery" ];

			network = {
				format-wifi = "󰖩";
				format-ethernet = "󰈀";
				format-linked = "󰈀";
				format-disconnected = "󰖪";
				tooltip-format = "{ifname}: {ipaddr}";
				tooltip-format-wifi = "{essid}: {ipaddr} ({signalStrength}%)";
				tooltip-format-disconnected = "Disconnected";
			};

			clock = {
				format = "󰥔 {:%H:%M}";
				tooltip-format = "󰃮 {:%Y-%m-%d}";
			};

			battery = {
				interval = 10;
				states = {
					good = 95;
					warning = 30;
					critical = 15;
				};
				format = "{icon} {capacity}%";
				format-charging = "󰂄 {capacity}%";
				format-plugged = "󰚥 {capacity}%";
				format-alt = "{icon} {time}";
				format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
			};

			pulseaudio = {
				format = "{icon} {volume}%";
				format-bluetooth = "󰂰 {volume}%";
				format-bluetooth-muted = "󰂲 {icon}";
				format-muted = "󰝟";
				format-icons = {
					headphone = "󰋋";
					hands-free = "󰥰";
					headset = "󰋎";
					phone = "󰏲";
					portable = "󰄝";
					car = "󰄋";
					default = ["󰕿" "󰖀" "󰕾"];
				};
				on-click = "pavucontrol";
				on-click-right = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
				on-scroll-up = "pactl set-sink-volume @DEFAULT_SINK@ +2%";
				on-scroll-down = "pactl set-sink-volume @DEFAULT_SINK@ -2%";
			};





		}];

		style = ''
/* Pastel TTY Colors */
@define-color background #212121;
@define-color background-light #3a3a3a;
@define-color foreground #e0e0e0;
@define-color black #5a5a5a;
@define-color red #ff9a9e;
@define-color green #b5e8a9;
@define-color yellow #ffe6a7;
@define-color blue #63a4ff;
@define-color magenta #dda0dd;
@define-color cyan #a3e8e8;
@define-color white #ffffff;
@define-color orange #ff8952;


/* Module-specific colors */
@define-color workspaces-color @foreground;
@define-color workspaces-focused-fg @green;
@define-color workspaces-urgent-bg @red;
@define-color workspaces-urgent-fg @black;

@define-color clock-color @foreground;

@define-color network-color @foreground;
@define-color network-disconnected-color @foreground;

@define-color pulseaudio-color @foreground;
@define-color pulseaudio-muted-color @foreground;

@define-color battery-charging-color @green;
@define-color battery-warning-color @yellow;
@define-color battery-critical-color @red;

* {
	border: none;
	border-radius: 0;
	font-size: 14px;
	font-family: "JetBrainsMono Nerd Font";
}

window#waybar {
    background-color: @background;
    color: @foreground;
}

/* Common module styling */
#network, #clock, #battery, #pulseaudio {
	padding: 0 10px;
	margin: 0 2px;
}

/* Workspaces styling */
#workspaces button {
    padding: 0 10px;
    background-color: transparent;
    color: @workspaces-color;
    margin: 0;
}

#workspaces button:hover {
    background: @background-light;
    box-shadow: inherit;
}

#workspaces button.active {
    box-shadow: inset 0 -2px @workspaces-focused-fg;
    color: @workspaces-focused-fg;
    font-weight: 900;
}

#workspaces button.urgent {
    background-color: @workspaces-urgent-bg;
    color: @workspaces-urgent-fg;
}

#clock {
    color: @clock-color;
    border-bottom-color: @clock-color;
}

#network {
    color: @network-color;
    border-bottom-color: @network-color;
}

#network.disconnected {
    color: @network-disconnected-color;
    border-bottom-color: @network-disconnected-color;
}

#battery {
    color: @battery-color;
    border-bottom-color: @battery-color;
}

#battery.charging, #battery.plugged {
    color: @battery-charging-color;
    border-bottom-color: @battery-charging-color;
}

#battery.warning:not(.charging) {
    color: @battery-warning-color;
    border-bottom-color: @battery-warning-color;
}

#battery.critical:not(.charging) {
    color: @battery-critical-color;
    border-bottom-color: @battery-critical-color;
}

#pulseaudio {
    color: @pulseaudio-color;
    border-bottom-color: @pulseaudio-color;
}

#pulseaudio.muted {
    color: @pulseaudio-muted-color;
    border-bottom-color: @pulseaudio-muted-color;
}
		'';
	};
}

