return {
	"folke/neodev.nvim",
	{
		"neovim/nvim-lspconfig",
	    dependencies = { 'saghen/blink.cmp' },
		opts = {
			servers = {
				lua_ls = {},
				rust_analyzer = {},
				nil_ls = {},
				ts_ls = {},
				eslint = {},
				clangd = {},
			}
		},
		config = function(_, opts)

			local on_attach = function(_, bufnr)
				local bufmap = function(keys, func)
					vim.keymap.set('n', keys, func, { buffer = bufnr })
				end

				bufmap('<leader>r', vim.lsp.buf.rename)
				bufmap('<leader>a', vim.lsp.buf.code_action)
				bufmap('<leader>ds', vim.diagnostic.open_float)

				bufmap('gd', vim.lsp.buf.definition)
				bufmap('gD', vim.lsp.buf.declaration)
				bufmap('gI', vim.lsp.buf.implementation)
				bufmap('<leader>D', vim.lsp.buf.type_definition)
				bufmap('<A-CR>', vim.lsp.buf.code_action)

				bufmap('K', vim.lsp.buf.hover)

				vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
					vim.lsp.buf.format()
				end, {})
			end


			require("neodev").setup()

			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				config.on_attach = on_attach
				lspconfig[server].setup(config)
			end
		end,
	}
}
