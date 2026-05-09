vim.pack.add({
  -- Dependencies
  { src = "https://github.com/nvim-lua/plenary.nvim" }, -- telescope dependency

  -- telescope
  { src = "https://github.com/nvim-telescope/telescope.nvim", branch = "master" },

  -- blink
  { src = "https://github.com/saghen/blink.cmp", version = "v1.10.2" },
  { src = "https://github.com/L3MON4D3/LuaSnip", version = "v2.4.1" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },

  -- LSP
  { src = "https://github.com/neovim/nvim-lspconfig" },

  -- Themes
  { src = "https://github.com/morhetz/gruvbox" },
})

require("config.plugins.telescope")
require("config.plugins.blink")

-- LSP
require("config.plugins.lsp.lspconfig")
