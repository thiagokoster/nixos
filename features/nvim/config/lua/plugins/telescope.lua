return {
	"nvim-telescope/telescope.nvim",
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function ()
		local builtin = require("telescope.builtin")
		vim.keymap.set('n', '<C-p>', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		vim.keymap.set('n', 'gr', builtin.lsp_references, {})
		vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, {})
		vim.keymap.set('n', '<leader>S', builtin.lsp_dynamic_workspace_symbols, {})
	end
}
