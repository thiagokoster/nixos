vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
      if not ev.data.active then vim.cmd.packadd("telescope-fzf-native.nvim") end
      local plugin_dir = vim.fn.stdpath("data") .. "/site/pack/core/opt/telescope-fzf-native.nvim"
      vim.fn.system("make -C " .. plugin_dir)
    end
  end,
})

vim.pack.add({
  -- Dependencies
  { src = "https://github.com/nvim-lua/plenary.nvim" }, -- telescope
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" }, -- telescope
  { src = "https://github.com/nvim-mini/mini.icons" }, -- oil

  -- telescope
  { src = "https://github.com/nvim-telescope/telescope.nvim", branch = "master" },

  -- blink
  { src = "https://github.com/saghen/blink.cmp", version = "v1.10.2" },
  { src = "https://github.com/L3MON4D3/LuaSnip", version = "v2.4.1" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },

  -- files
  { src = "https://github.com/stevearc/oil.nvim" },


  -- LSP
  { src = "https://github.com/neovim/nvim-lspconfig" },

  -- Themes
  { src = "https://github.com/morhetz/gruvbox" },
})

require("config.plugins.telescope")
require("config.plugins.blink")
require("config.plugins.oil")

-- LSP
require("config.plugins.lsp.lspconfig")
