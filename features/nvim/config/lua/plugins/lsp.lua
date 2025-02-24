return {
	"folke/neodev.nvim",
	{
		"neovim/nvim-lspconfig",
		config = function()
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

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


			local lspconfig = require("lspconfig")

			require("neodev").setup()
			lspconfig.lua_ls.setup {
				on_attach = on_attach,
				capabilities = capabilities,
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			}

			local servers = { 
				"nil_ls",
				"rust_analyzer",
				"gdscript",
				"csharp_ls",
				"clangd",
				"gopls",
				"ts_ls",
				"eslint"
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup { on_attach = on_attach, capabilities = capabilities }
			end
		end,
	}
}
