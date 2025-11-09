{  config, lib, pkgs, ...}:
{
  home.packages = with pkgs; [
    nix-your-shell
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      nix-your-shell fish | source
    '';
  };

  programs.starship = {
    enable = true;

    settings = {
      palette = "catppuccin_mocha";

      palettes = {
        catppuccin_mocha = {
          rosewater = "#f5e0dc";
          flamingo  = "#f2cdcd";
          pink      = "#f5c2e7";
          mauve     = "#cba6f7";
          red       = "#f38ba8";
          maroon    = "#eba0ac";
          peach     = "#fab387";
          yellow    = "#f9e2af";
          green     = "#a6e3a1";
          teal      = "#94e2d5";
          sky       = "#89dceb";
          sapphire  = "#74c7ec";
          blue      = "#89b4fa";
          lavender  = "#b4befe";
          text      = "#cdd6f4";
          subtext1  = "#bac2de";
          subtext0  = "#a6adc8";
          overlay2  = "#9399b2";
          overlay1  = "#7f849c";
          overlay0  = "#6c7086";
          surface2  = "#585b70";
          surface1  = "#45475a";
          surface0  = "#313244";
          base      = "#1e1e2e";
          mantle    = "#181825";
          crust     = "#11111b";
        };
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
