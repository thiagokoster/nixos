return {
	{
		'saghen/blink.cmp',
		dependencies = 'rafamadriz/friendly-snippets',

		version = '*',
		opts = {
			keymap = { preset = 'default' },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = 'mono'
			},
			completion = {
				menu = { border = 'single' },
				documentation = { window = { border = 'single' } },
			},
			signature = {
				enabled = true,
				window = { border = 'single' }
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
	}
}
