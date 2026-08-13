{ pkgs, config, ... }:

{
  programs.kitty = {
    enable = true;
    # Keep in sync with modules/theme.nix (flavour = "latte")
    themeFile = "Catppuccin-Latte";
    font.package = pkgs.nerd-fonts.jetbrains-mono;
    font.name = "JetBrainsMono Nerd Font Mono";
    extraConfig = ''
      window_padding_width 4
    '';
  };
}
