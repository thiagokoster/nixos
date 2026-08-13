{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.mangowm.hmModules.mango
    ../ghostty.nix
    ../waybar.nix
  ];

  home.packages = with pkgs; [
    fuzzel
    brightnessctl
  ];

  wayland.windowManager.mango = {
    enable = true;
    autostart_sh = ''
      waybar &
    '';
    settings = {
      animations = 1;
      layer_animations = 1;
      animation_type_open = "slide";
      animation_type_close = "slide";
      animation_fade_in = 1;
      animation_fade_out = 1;
      tag_animation_direction = 0;
      zoom_initial_ratio = 0.3;
      zoom_end_ratio = 0.8;
      fadein_begin_opacity = 0.5;
      fadeout_begin_opacity = 0.8;
      animation_duration_move = 500;
      animation_duration_open = 400;
      animation_duration_tag = 350;
      animation_duration_close = 800;
      animation_duration_focus = 0;
      animation_curve_open = "0.46,1.0,0.29,1";
      animation_curve_move = "0.46,1.0,0.29,1";
      animation_curve_tag = "0.46,1.0,0.29,1";
      animation_curve_close = "0.08,0.92,0,1";
      animation_curve_focus = "0.46,1.0,0.29,1";
      bordercolor = "0x595959aa";
      tagrule = [
      "id:1,layout_name:scroller"
      "id:2,layout_name:scroller"
      "id:3,layout_name:scroller"
      ];
      scroller_structs = 0;
      scroller_proportion_preset = "0.33,0.5,0.66,1.0";
      scroller_default_proportion = 0.5;
      scroller_ignore_proportion_single = 0;
      bind = [
        "SUPER,r,reload_config"
        "SUPER,space,spawn,fuzzel"
        "SUPER,Return,spawn,ghostty"
        "SUPER,q,killclient,"
        "SUPER,f,togglefullscreen"
        "SUPER,n,switch_layout"

        "SUPER,h,focusdir,left"
        "SUPER,j,focusdir,down"
        "SUPER,k,focusdir,Up"
        "SUPER,l,focusdir,right"

        "SUPER+SHIFT,h,exchange_client,left"
        "SUPER+SHIFT,j,exchange_client,down"
        "SUPER+SHIFT,k,exchange_client,up"
        "SUPER+SHIFT,l,exchange_client,right"

        "SUPER,1,view,1"
        "SUPER,2,view,2"
        "SUPER,3,view,3"
        "SUPER,4,view,4"
        "SUPER,5,view,5"
        "SUPER,6,view,6"
        "SUPER,7,view,7"
        "SUPER,8,view,8"
        "SUPER,9,view,9"

        "SUPER+SHIFT,1,tag,1"
        "SUPER+SHIFT,2,tag,2"
        "SUPER+SHIFT,3,tag,3"
        "SUPER+SHIFT,4,tag,4"
        "SUPER+SHIFT,5,tag,5"
        "SUPER+SHIFT,6,tag,6"
        "SUPER+SHIFT,7,tag,7"
        "SUPER+SHIFT,8,tag,8"
        "SUPER+SHIFT,9,tag,9"

        # scroller
        "SUPER,Comma,switch_proportion_preset"

        # brightness
        "none,XF86MonBrightnessUp,spawn,brightnessctl --class=backlight set +10%"
        "none,XF86MonBrightnessDown,spawn,brightnessctl --class=backlight set 10%-"
      ];
    };
  };
}
