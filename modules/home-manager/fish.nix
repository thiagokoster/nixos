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
    enableFishIntegration = config.programs.fish.enable;
    settings = {
        add_newline = false;
        command_timeout = 1000;
        time = {
          disabled = true;
        };
        format = lib.concatStrings [
          "$username"
          "@"
          "$hostname"
          "$directory"
          "$git_branch"
          "$nix_shell"
          "$character"
        ];

        username = {
          format = "[ $user]($style)";
          show_always = true;
          style_user = "fg:green bg:surface2";
          style_root = "fg:red bg:surface2";
        };
        hostname = {
          disabled = false;
          style = "bg:overlay0 fg:red";
          ssh_only = false;
          ssh_symbol = " 󰖈";
          format = "[$hostname]($style)[$ssh_symbol](bg:overlay0 fg:maroon)";
        };
        directory = {
          format = "[ $path]($style)[$read_only]($read_only_style)";
          home_symbol = "";
          read_only = " 󰈈";
          read_only_style = "bold fg:crust bg:mauve";
          style = "fg:base bg:mauve";
          truncation_length = 3;
          truncation_symbol = "…/";
        };
# Shorten long paths by text replacement. Order matters
        git_branch = {
          format = " \\([$branch]($style)\\)";
          style = "fg:base bg:peach";
        };

        nix_shell = {
          format = "[ <nix shell>]($style)";
          style = "fg:base bg:teal";
          symbol = "󱄅";
        };

        character = {
          disabled = false;
          format = " $symbol";
          error_symbol = "~> ";
          success_symbol = "~> ";
        };
    };
  };
}
