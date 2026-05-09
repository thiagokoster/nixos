vim.g.mapleader = " "

vim.opt.number = true                      -- show line numbers
vim.opt.relativenumber = true              -- relative line numbers
vim.opt.expandtab = true                   -- spaces instead of tabs
vim.opt.shiftwidth = 2

require("config.pack")
require("theme")
