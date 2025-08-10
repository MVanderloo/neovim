vim.pack.add {
  'gh:nvim-treesitter/nvim-treesitter',
  'gh:nvim-treesitter/nvim-treesitter-textobjects',
  'gh:folke/ts-comments.nvim',
  'gh:wansmer/treesj',
}

require('nvim-treesitter').setup {
  ensure_installed = 'all',
  highlight = { enabled = true },
  indent = { enable = true },
}

-- require('nvim-treesitter-textobjects').setup {
--   select = {
--     lookahead = true,
--     selection_modes = {
--       ['@parameter.outer'] = 'v', -- charwise
--       ['@function.outer'] = 'V', -- linewise
--       ['@class.outer'] = '<c-v>', -- blockwise
--     },
--     include_surrounding_whitespace = false,
--   },
-- }

-- vim.keymap.set(
--   { 'x', 'o' },
--   'af',
--   function() require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects') end
-- )
-- vim.keymap.set(
--   { 'x', 'o' },
--   'if',
--   function() require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects') end
-- )
-- vim.keymap.set(
--   { 'x', 'o' },
--   'ac',
--   function() require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects') end
-- )
-- vim.keymap.set(
--   { 'x', 'o' },
--   'ic',
--   function() require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects') end
-- )

require('ts-comments').setup()

require('treesj').setup {
  use_default_keymaps = true,
  check_syntax_error = true, -- try setting this false
  max_join_length = 240,
  ---Cursor behavior:
  ---hold - cursor follows the node/place on which it was called
  ---start - cursor jumps to the first symbol of the node being formatted
  ---end - cursor jumps to the last symbol of the node being formatted
  ---@type 'hold'|'start'|'end'
  cursor_behavior = 'hold',
  ---@type boolean Notify about possible problems or not
  notify = true,
  ---@type boolean Use `dot` for repeat action
  dot_repeat = true,
  ---@type nil|function Callback for treesj error handler. func (err_text, level, ...other_text)
  on_error = nil,
}
