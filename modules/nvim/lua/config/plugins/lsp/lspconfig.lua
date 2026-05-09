-- Configure and enable LSP servers

vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
vim.lsp.enable({
  'lua_ls',
  'clangd'
})
