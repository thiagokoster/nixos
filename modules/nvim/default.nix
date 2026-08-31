{  config, inputs, pkgs, ... }:
let
  theme = import ../theme.nix;
in
{
  home.packages = with pkgs; [
      inputs.neovim-nightly.packages.${pkgs.system}.default
      ripgrep
      fd
      gnumake
      gcc

      lua-language-server
  ];
  # Out-of-store symlink: points to your live repo, edits are instant
    xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink"${config.home.homeDirectory}/.nixos/modules/nvim";

  # Generated next to (not inside) the symlinked config, so lua/theme.lua can
  # follow modules/theme.nix without Nix writing into the live repo.
  xdg.configFile."nvim-theme/flavour.lua".text = ''
    return "${theme.flavour}"
  '';
}
