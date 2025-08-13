vim.pack.add { 'gh:stevearc/oil.nvim', 'gh:echasnovski/mini.icons' }

require('mini.icons').setup {}
require('oil').setup {
  default_file_explorer = true,
  watch_for_changes = true,
  view_options = { show_hidden = true },
  skip_confirm_for_simple_edits = true,
  is_always_hidden = function(name, _) return name:match '^..' ~= nil end,
}

vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' })
