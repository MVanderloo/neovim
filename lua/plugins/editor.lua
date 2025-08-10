vim.pack.add {
  'gh:nmac427/guess-indent.nvim',
  'gh:lukas-reineke/indent-blankline.nvim',
  'gh:echasnovski/mini.align',
  'gh:echasnovski/mini.operators',
  'gh:echasnovski/mini.surround',
  'gh:echasnovski/mini.pairs',
  'gh:echasnovski/mini.ai'
}

require('guess-indent').setup()
require('ibl').setup()
require('mini.align').setup()
require('mini.operators').setup()
require('mini.surround').setup()
require('mini.pairs').setup()
require('mini.ai').setup()

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
