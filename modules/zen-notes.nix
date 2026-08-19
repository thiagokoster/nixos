{ pkgs, inputs, ... }:

{
  home.packages = [
    inputs.zen-notes.packages.${pkgs.system}.default
  ];
}
