vim.pack.add { 'gh:stevearc/oil.nvim', 'gh:echasnovski/mini.icons' }

require 'mini.icons'.setup {}
require 'oil'.setup {}

vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
