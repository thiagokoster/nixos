{ config, pkgs, ... }:

{
	imports = [
		./modules/waybar.nix
	];

	# Home Manager needs a bit of information about you and the paths it should
	# manage.
	home.username = "thiagokoster";
	home.homeDirectory = "/home/thiagokoster";

	# This value determines the Home Manager release that your configuration is
	# compatible with. This helps avoid breakage when a new Home Manager release
	# introduces backwards incompatible changes.
	#
	# You should not change this value, even if you update Home Manager. If you do
	# want to update the value, then make sure to first check the Home Manager
	# release notes.
	home.stateVersion = "24.05"; # Please read the comment before changing.

	# The home.packages option allows you to install Nix packages into your
	# environment.
	home.packages = [
		# # Adds the 'hello' command to your environment. It prints a friendly
		# # "Hello, world!" when run.
		# pkgs.hello

		# # It is sometimes useful to fine-tune packages, for example, by applying
		# # overrides. You can do that directly here, just don't forget the
		# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
		# # fonts?
		# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

		# # You can also create simple shell scripts directly inside your
		# # configuration. For example, this adds a command 'my-hello' to your
		# # environment:
		# (pkgs.writeShellScriptBin "my-hello" ''
		#   echo "Hello, ${config.home.username}!"
		# '')
	];

	# Home Manager is pretty good at managing dotfiles. The primary way to manage
	# plain files is through 'home.file'.
	home.file = {
		# # Building this configuration will create a copy of 'dotfiles/screenrc' in
		# # the Nix store. Activating the configuration will then make '~/.screenrc' a
		# # symlink to the Nix store copy.
		# ".screenrc".source = dotfiles/screenrc;

		# # You can also set the file content immediately.
		# ".gradle/gradle.properties".text = ''
		#   org.gradle.console=verbose
		#   org.gradle.daemon.idletimeout=3600000
		# '';
	};

	# Home Manager can also manage your environment variables through
	# 'home.sessionVariables'. These will be explicitly sourced when using a
	# shell provided by Home Manager. If you don't want to manage your shell
	# through Home Manager then you have to manually source 'hm-session-vars.sh'
	# located at either
	#
	#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
	#
	# or
	#
	#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
	#
	# or
	#
	#  /etc/profiles/per-user/thiagokoster/etc/profile.d/hm-session-vars.sh
	#
	home.sessionVariables = {
		EDITOR = "nvim";
	};

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;

	programs.neovim = {
		enable = true;
		defaultEditor = true;

		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;

		extraPackages = with pkgs; [
			lua-language-server

			cargo
			rustc
			rust-analyzer

			nil
			gcc

			ripgrep

			xclip
			wl-clipboard
		];
	};

	xdg.configFile.nvim = {
		source = ./modules/nvim;
		recursive = true;
	};


	# Hyprland
	wayland.windowManager.hyprland = {
		# Whether to enable Hyprland wayland compositor
		enable = true;
		# The hyprland package to use
		package = pkgs.hyprland;
		# Whether to enable XWayland
		xwayland.enable = true;

		# Optional
		# Whether to enable hyprland-session.target on hyprland startup
		systemd.enable = true;

		settings = {
			"$mod" = "SUPER";
			"$terminal" = "kitty";
			"$menu" = "pkill wofi || wofi --show drun";

			exec-once = [
				"waybar"
			];

			xwayland = {
				force_zero_scaling = true;
			};

			general = {
				gaps_in = 6;
				gaps_out = 6;
			};

			animations = {
				enabled = true;
				animation = [
					"workspaces, 0"
				];
			};

			bind =[
				# General
				"$mod, return, exec, $terminal"
				"$mod, D, exec, $menu"

				# Screen focus
            	"$mod, v, togglefloating"
				"$mod, f, fullscreen"

				# Switch workspaces with mainMod + [0-9]
				"$mod, 1, workspace, 1"
				"$mod, 2, workspace, 2"
				"$mod, 3, workspace, 3"
				"$mod, 4, workspace, 4"
				"$mod, 5, workspace, 5"
				"$mod, 6, workspace, 6"
				"$mod, 7, workspace, 7"
				"$mod, 8, workspace, 8"
				"$mod, 9, workspace, 9"
				"$mod, 0, workspace, 10"

				# Move to workspaces
				"$mod SHIFT, 1, movetoworkspace,1"
				"$mod SHIFT, 2, movetoworkspace,2"
				"$mod SHIFT, 3, movetoworkspace,3"
				"$mod SHIFT, 4, movetoworkspace,4"
				"$mod SHIFT, 5, movetoworkspace,5"
				"$mod SHIFT, 6, movetoworkspace,6"
				"$mod SHIFT, 7, movetoworkspace,7"
				"$mod SHIFT, 8, movetoworkspace,8"
				"$mod SHIFT, 9, movetoworkspace,9"
				"$mod SHIFT, 0, movetoworkspace,10"

				# Navigation
				"$mod, h, movefocus, l"
				"$mod, l, movefocus, r"
				"$mod, k, movefocus, u"
				"$mod, j, movefocus, d"
			];
		};
	};
}
