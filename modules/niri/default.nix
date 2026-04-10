{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    ../kitty.nix
    ../waybar.nix
  ];

  home.packages = with pkgs; [
    kitty
    fuzzel
    xwayland-satellite
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;

}
