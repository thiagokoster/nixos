{config, pkgs, ...}:
let
	icon-font = "3270 Nerd Font"; 
in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 26;
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [ "pulseaudio" "clock" "battery"];
        
        "clock" = {
          interval = 60;
          format = "{:%H:%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };
    
        "battery" = {
          states = {
            b95 = 95;
            b90 = 90;
            b80 = 80;
            b70 = 70;
            b60 = 60;
            b50 = 50;
            b40 = 40;
            b30 = 30;
            b20 = 20;
            warning = 10;
            critical = 5;
          };
          format = "{icon}";
          format-icons = [ 
						"󰂎"
						"󰁺"
						"󰁻"
						"󰁼"
						"󰁽"
						"󰁾"
						"󰁿"
						"󰂀"
						"󰂁"
						"󰂂"
						"󰁹"
					];
		  format-full = "󰁹";
	};
        
	"pulseaudio" = {
          format = "<span font='${icon-font}'>{icon}</span> {volume}%";
          format-bluetooth = "<span font='${icon-font}'>{icon}󰂯</span> {volume}%";
          format-bluetooth-muted = "<span font='${icon-font}'>󰍭 {icon}󰂯</span>";
          format-icons = {
            default = [ "" "" "" ];
            headphones = "󰋋 ";
          };
          format-muted = "<span font='${icon-font}'>󰖁</span>";
	 	  #format-source = "{volume}% <span font='${icon-font}'></span>";
		  format-source = "";
          format-source-muted = "<span font='${icon-font}'>󰍭</span>";
          on-click = "pavucontrol";
        };


      };
    };

    style = ''
* {
	border: none;
	border-radius: 0;
	font-size: 13px;
	font-family: "JetBrainsMono Nerd Font";
}

window#waybar {
	background: #2E3440;
	color: #D8DEE9;
}

#workspaces { 
	background: #3B4252;
}

#workspaces button.active {
	background: #A3BE8C;
	border: none
}

#workspaces button.active {
	background: #A3BE8C;
}

#workspaces button:hover {
	background: #2E3440;
}


.modules-right {
	margin:0 10px;
}
#pulseaudio,
#clock {
	margin: 0 5px 0 0;	
}
'';
};
}

