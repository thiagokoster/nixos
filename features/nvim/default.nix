{pkgs, ...}:

{
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
		source = ./config;
		recursive = true;
	};
}
