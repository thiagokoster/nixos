{pkgs, inputs, ...}:

{
programs.neovim = {
		enable = true;
		defaultEditor = true;
		package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;

		extraPackages = with pkgs; [
			lua-language-server

			

			nil
			gcc

			ripgrep

			xclip
			wl-clipboard
		];
	};

	xdg.configFile.nvim = {
		source = ./config;
		recursive = true;
	};
}
