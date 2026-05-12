{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    #../kitty.nix
    ../ghostty.nix
    ../waybar.nix
  ];

  home.packages = with pkgs; [
    fuzzel
    xwayland-satellite
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;

}
