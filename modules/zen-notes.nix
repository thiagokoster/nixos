{ pkgs, inputs, ... }:

{
  home.packages = [
    inputs.zen-notes.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
