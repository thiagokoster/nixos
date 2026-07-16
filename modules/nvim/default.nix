{  config, inputs, pkgs, ... }:

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

}
