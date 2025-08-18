vim.pack.add({
  'gh:nvim-treesitter/nvim-treesitter',
  -- 'gh:nvim-treesitter/nvim-treesitter-textobjects',
  -- 'gh:folke/ts-comments.nvim',
  'gh:wansmer/treesj',
  { src = 'gh:echasnovski/mini.ai' },
}, { confirm = false })

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

-- require('ts-comments').setup()

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

-- {
--   'echasnovski/mini.ai',
--   version = '*',
--   event = 'VeryLazy',
--   config = true,
--   -- config = function()
--   --   local ts_spec = require('mini.ai').gen_spec.treesitter
--   --
--   --   return {
--   --     n_lines = 500,
--   --     custom_textobjects = {
--   --       -- argument
--   --       a = ts_spec { a = '@parameter.outer', i = '@parameter.inner' },
--   --       -- class
--   --       C = ts_spec { a = '@class.outer', i = '@class.inner' },
--   --       -- function call
--   --       f = ts_spec { a = '@call.outer', i = '@call.inner' },
--   --       -- definition
--   --       d = ts_spec {
--   --         a = { '@function.outer', '@class.outer' },
--   --         i = { '@function.inner', '@class.inner' },
--   --       },
--   --       -- scope
--   --       s = ts_spec {
--   --         a = { '@block.outer', '@conditional.outer', '@loop.outer' },
--   --         i = { '@block.inner', '@conditional.inner', '@loop.inner' },
--   --       },
--   --       -- loop
--   --       l = ts_spec { a = '@loop.outer', i = '@loop.inner' },
--   --     },
--   --   }
--   -- end,
-- },
