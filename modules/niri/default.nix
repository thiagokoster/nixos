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
    brightnessctl
    inputs.awww.packages.${stdenv.hostPlatform.system}.awww
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  home.file.".local/share/wallpapers".source = ../../wallpapers;

}
