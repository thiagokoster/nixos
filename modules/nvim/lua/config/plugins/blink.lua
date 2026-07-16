require("blink.cmp").setup({
  fuzzy = {
        implementation = "lua",
    },
    -- keymaps
    keymap = {
        preset = "default",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
    },

    -- editor insert mode completions
    completion = {
        menu = {
            auto_show = true, -- show on type
        },
        documentation = {
            auto_show = true, -- show function signature/docs 
        },
        ghost_text = {
            enabled = false,
            show_with_menu = false,
        },
        accept = {
            auto_brackets = {
                enabled = true,
            },
        },
    },
    snippets = {
      preset = "luasnip",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        snippets = {
          enabled = function()
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local line = vim.api.nvim_get_current_line()
            local char_before = line:sub(col, col)
            return char_before ~= "."
          end,
        }
      }
    },
})

require("luasnip.loaders.from_vscode").lazy_load() -- load friendly snippets collection
