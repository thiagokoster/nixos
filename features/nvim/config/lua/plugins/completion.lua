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
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
				providers = {
					snippets = {
						should_show_items = function(ctx)
							return ctx.trigger.initial_kind ~= 'trigger_character'
						end,
					}
				}
			},

			signature = {
				enabled = true,
				window = { border = 'single' }
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
	}
}
