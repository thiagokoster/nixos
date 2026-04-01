{config, inputs, pkgs, ...}: 

{
    imports = [
        ../kitty.nix
        ../waybar.nix
    ];

    xdg.configFile."niri/config.kdl".source = ./config.kdl;

}
