-- Flavour is generated from modules/theme.nix (see modules/nvim/default.nix)
local ok, flavour = pcall(dofile, vim.fn.expand("~/.config/nvim-theme/flavour.lua"))
require("catppuccin").setup({ flavour = ok and flavour or "mocha" })
vim.cmd("colorscheme catppuccin")
