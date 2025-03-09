{config, pkgs, ...}:
{
	home.packages = [pkgs.rofi-wayland];

	home.file.".config/rofi/config.rasi" = {
	text = ''
/************************************************
 * ROFI Color theme
 * User: leofa
 * Copyright: 2017 leofa
 ***********************************************/

* {
    normal-foreground:           @foreground;
	selected-normal-foreground:  #F9F9F9;
	foreground:                  #C4CBD4;
	alternate-normal-background: #40455296;
	red:                         #DC322F;
	selected-urgent-foreground:  #F9F9F9;
	blue:                        #268BD2;
	urgent-foreground:           #CC6666;
	alternate-urgent-background: #4B5160;
	active-foreground:           #65ACFF;
	lightbg:                     #EEE8D5;
	selected-active-foreground:  #F9F9F9;
	alternate-active-background: #4B5160;
	background:                  #2D303B;
	alternate-normal-foreground: @foreground;
	normal-background:           @background;
	lightfg:                     #586875;
	selected-normal-background:  #4084D6;
	border-color:                #7C8389;
	spacing:                     2;
	separatorcolor:              #1D1F21;
	urgent-background:           #1D1F21;
	selected-urgent-background:  #A54242;
	alternate-urgent-foreground: @urgent-foreground;
	background-color:            #00000000;
	alternate-active-foreground: @active-foreground;
	active-background:           #1D1F2130;
	selected-active-background:  #4491ED;
 
}
#window {
    background-color: @background;
    border:         1;
    padding:        5;
	border-radius: 	8px;
	height: 		300px;
}
#mainbox {
    border:  0;
    padding: 0;
}
#message {
    border:       2px 0px 0px ;
    border-color: @separatorcolor;
    padding:      1px ;
}
#textbox {
    text-color: @foreground;
}
#listview {
    fixed-height: 0;
    border:       2px 0px 0px ;
    border-color: @separatorcolor;
    spacing:      2px ;
    scrollbar:    true;
    padding:      2px 0px 0px ;
}
#element {
    border:  0;
    padding: 1px ;
}
#element.normal.normal {
    background-color: @normal-background;
    text-color:       @normal-foreground;
}
#element.normal.urgent {
    background-color: @urgent-background;
    text-color:       @urgent-foreground;
}
#element.normal.active {
    background-color: @active-background;
    text-color:       @active-foreground;
}
#element.selected.normal {
    background-color: @selected-normal-background;
    text-color:       @selected-normal-foreground;
}
#element.selected.urgent {
    background-color: @selected-urgent-background;
    text-color:       @selected-urgent-foreground;
}
#element.selected.active {
    background-color: @selected-active-background;
    text-color:       @selected-active-foreground;
}
#element.alternate.normal {
    background-color: @alternate-normal-background;
    text-color:       @alternate-normal-foreground;
}
#element.alternate.urgent {
    background-color: @alternate-urgent-background;
    text-color:       @alternate-urgent-foreground;
}
#element.alternate.active {
    background-color: @alternate-active-background;
    text-color:       @alternate-active-foreground;
}
#scrollbar {
    width:        4px ;
    border:       0;
    handle-color: @normal-foreground;
    handle-width: 8px ;
    padding:      0;
}
#sidebar {
    border:       2px 0px 0px ;
    border-color: @separatorcolor;
}
#button {
    spacing:    0;
    text-color: @normal-foreground;
}
#button.selected {
    background-color: @selected-normal-background;
    text-color:       @selected-normal-foreground;
}
#inputbar {
    spacing:    0;
    text-color: @normal-foreground;
    padding:    1px ;
}
#case-indicator {
    spacing:    0;
    text-color: @normal-foreground;
}
#entry {
    spacing:    0;
    text-color: @normal-foreground;
}
#prompt {
    spacing:    0;
    text-color: @normal-foreground;
}
#inputbar {
    children:   [ prompt,textbox-prompt-colon,entry,case-indicator ];
}
#textbox-prompt-colon {
    expand:     false;
    str:        ":";
    margin:     0px 0.3em 0em 0em ;
    text-color: @normal-foreground;
}
  '';
	};
}
