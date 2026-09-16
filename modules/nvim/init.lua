vim.g.mapleader = " "

vim.opt.number = true                      -- show line numbers
vim.opt.relativenumber = true              -- relative line numbers
vim.opt.expandtab = true                   -- spaces instead of tabs
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2                        -- display width of a literal tab
vim.opt.softtabstop = 2                    -- <Tab>/<BS> move by 2

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

require("config.pack")
require("theme")
