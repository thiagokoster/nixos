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
        modules-right = ["pulseaudio" "clock" "battery"];
        
        "clock" = {
          interval = 60;
          format = "{:%H:%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#FFEAD3'><b>{}</b></span>";
              days = "<span color='#ECC6D9'><b>{}</b></span>";
              weeks = "<span color='#99FFDD'><b>W{}</b></span>";
              weekdays = "<span color='#FFCC66'><b>{}</b></span>";
              today = "<span color='#FF6699'><b><u>{}</u></b></span>";
            };
          };
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
      background: #${config.colorScheme.palette.base00};
      color: #${config.colorScheme.palette.base04};
    }

    #workspaces { 
      background: #${config.colorScheme.palette.base01};
    }

    #workspaces button.active {
      background: #${config.colorScheme.palette.base0E};
	  border: none
    }

    #workspaces button.active {
      background: #${config.colorScheme.palette.base0E};
    }

    #workspaces button:hover {
      background: #${config.colorScheme.palette.base00};
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

