{ lib, ... }:
let
  theme = import ./theme.nix;
  # fuzzel wants RRGGBBAA without the leading #
  toFuzzelColor = hex: alpha: (lib.removePrefix "#" hex) + alpha;
in
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=12";
        terminal = "ghostty";
        layer = "overlay";
        width = 45;
        lines = 12;
        horizontal-pad = 20;
        vertical-pad = 12;
        inner-pad = 8;
      };
      colors = {
        background = toFuzzelColor theme.base "f2";
        text = toFuzzelColor theme.text "ff";
        prompt = toFuzzelColor theme.subtext0 "ff";
        placeholder = toFuzzelColor theme.overlay0 "ff";
        input = toFuzzelColor theme.text "ff";
        match = toFuzzelColor theme.blue "ff";
        selection = toFuzzelColor theme.surface1 "ff";
        selection-text = toFuzzelColor theme.text "ff";
        selection-match = toFuzzelColor theme.blue "ff";
        counter = toFuzzelColor theme.overlay1 "ff";
        border = toFuzzelColor theme.surface1 "ff";
      };
      border = {
        width = 2;
        radius = 8;
      };
    };
  };
}
