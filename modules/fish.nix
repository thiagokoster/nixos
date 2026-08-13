{
  config,
  lib,
  pkgs,
  ...
}:
let
  theme = import ./theme.nix;
in
{
  home.packages = with pkgs; [
    nix-your-shell
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      nix-your-shell fish | source
    '';
    shellAliases = {
      nixos-rebuild = "sudo nixos-rebuild switch --flake /home/koster/.nixos#razorback";
      nixos-test = "sudo nixos-rebuild test --flake /home/koster/.nixos#razorback";
    };
  };

  programs.starship = {
    enable = true;

    settings = {
      palette = "catppuccin_${theme.flavour}";

      palettes = {
        "catppuccin_${theme.flavour}" = builtins.removeAttrs theme [
          "flavour"
          "flavourTitle"
        ];
      };

      format = lib.concatStrings [
        "[](green)"
        "$os"
        "$username"
        "[@](fg:text bg:surface0)"
        "$hostname"
        "($nix_shell)"
        "[](fg:surface0 bg:overlay0)"
        "$directory"
        "$git_branch"
        "[](overlay0) "
      ];

      os = {
        disabled = false;
        style = "bold fg:text bg:surface0";
        symbols.NixOS = " 󱄅";
      };

      username = {
        format = "[ $user]($style)";
        show_always = true;
        style_user = "fg:text bg:surface0";
        style_root = "fg:red bg:surface0";
      };

      hostname = {
        disabled = false;
        ssh_only = false;
        format = "[$hostname](bold fg:text bg:surface0)";
      };

      nix_shell = {
        disabled = false;
        format = "[ \\(nix-shell\\)]($style)";
        style = "fg:blue bg:surface0";
      };

      directory = {
        format = "[ $path]($style)[$read_only]($read_only_style)";
        style = "bold fg:surface0 bg:overlay0";
      };

      git_branch = {
        format = "[ \\($branch(:$remote_branch)\\) ]($style)";
        style = "bold fg:surface0 bg:overlay0";
      };
    };
  };
}
