{config, pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 26;
    
        modules-left = [ "hyprland/workspaces" ];
        modules-right = ["pulseaudio" "battery" "clock" ];
        
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
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };
        "pulseaudio" = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-icons = {
            car = "";
            default = [ "" "" "" ];
            headphones = "";
            phone = "";
            portable = "";
          };
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          on-click = "pavucontrol";
        };
      };
    };

    style = ''
    
    * {
      border: none;
      border-radius: 0;
      padding: 0 3px 0 0;
      margin: 0;
      font-size: 13px;
      font-family: JetBrainsMono Nerd Font Mono;
    }

    window#waybar {
      background: #272932;
      color: #FFFFFF;
    }

    #workspaces { 
      background: #272932;
    }
    #workspaces button {
      padding: 0 2px;
      color: #FDF6E3;
      
    }
    #workspaces button.active {
      background: #E455Ae;
    }
    #workspaces button:hover {
      background: #272932;
      border: #272932;
      padding: 0 3px;
    }
    
    #battery
    #pulseaudio
    #clock {
      padding: 0 3px;
      margin: 0 2px;
    }
  '';
  };
}

