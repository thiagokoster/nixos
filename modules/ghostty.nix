{ pkgs, config, ... }:
let
  theme = import ./theme.nix;
in
{
  programs.ghostty = {
    enable = true;
    settings = {
      window-padding-x = 8;
      window-padding-y = 8;
      window-padding-color = "extend";
      working-directory = "home";
      theme = "Catppuccin ${theme.flavourTitle}";
    };
  };
}
