require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()
require("oil").setup({
  view_options = {
    show_hidden = true
  }
})

vim.keymap.set("n", "-", "<cmd>Oil<CR>")
