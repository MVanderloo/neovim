-- -- movement
-- vim.keymap.set({ 'n', 'v' }, '<M-k>', '<cmd>Treewalker Up<cr>', { silent = true })
-- vim.keymap.set({ 'n', 'v' }, '<M-j>', '<cmd>Treewalker Down<cr>', { silent = true })
-- vim.keymap.set({ 'n', 'v' }, '<M-h>', '<cmd>Treewalker Left<cr>', { silent = true })
-- vim.keymap.set({ 'n', 'v' }, '<M-l>', '<cmd>Treewalker Right<cr>', { silent = true })
--
-- -- swapping
-- vim.keymap.set('n', '<M-S-k>', '<cmd>Treewalker SwapUp<cr>', { silent = true })
-- vim.keymap.set('n', '<M-S-j>', '<cmd>Treewalker SwapDown<cr>', { silent = true })
-- vim.keymap.set('n', '<M-S-h>', '<cmd>Treewalker SwapLeft<cr>', { silent = true })
-- vim.keymap.set('n', '<M-S-l>', '<cmd>Treewalker SwapRight<cr>', { silent = true })

return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    opts = {
      ensure_installed = 'all',
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },
  -- {
  --   'nvim-treesitter/nvim-treesitter-textobjects',
  --   dependencies = { 'nvim-treesitter/nvim-treesitter' },
  --   event = { 'VeryLazy' },
  --   init = function()
  --     local config = require 'nvim-treesitter.configs'
  --     config.setup {
  --       textobjects = {
  --         -- select = {
  --         --   enable = true,
  --         --   lookahead = true,
  --         --   keymaps = {
  --         --     ['af'] = '@function.outer',
  --         --     ['if'] = '@function.inner',
  --         --     ['a/'] = '@comment.outer',
  --         --     ['i/'] = '@comment.inner',
  --         --     ['aa'] = '@parameter.outer',
  --         --     ['ia'] = '@parameter.inner',
  --         --     ['aC'] = '@class.outer',
  --         --     ['iC'] = '@class.inner',
  --         --     ['ac'] = '@conditional.outer',
  --         --     ['ic'] = '@conditional.inner',
  --         --     ['al'] = '@loop.outer',
  --         --     ['il'] = '@loop.inner',
  --         --     ['aB'] = '@block.outer',
  --         --     ['iB'] = '@block.inner',
  --         --   },
  --         --   selection_modes = {
  --         --     ['@function.outer'] = 'v',
  --         --     ['@function.inner'] = 'v',
  --         --     ['@comment.outer'] = 'v',
  --         --     ['@comment.inner'] = 'v',
  --         --     ['@parameter.outer'] = 'v',
  --         --     ['@parameter.inner'] = 'v',
  --         --     ['@class.outer'] = 'V',
  --         --     ['@class.inner'] = 'V',
  --         --     ['@conditional.outer'] = 'v',
  --         --     ['@conditional.inner'] = 'v',
  --         --     ['@loop.outer'] = 'v',
  --         --     ['@loop.inner'] = 'v',
  --         --     ['@block.outer'] = 'V',
  --         --     ['@block.inner'] = 'V',
  --         --   },
  --         --   include_surrounding_whitespace = true,
  --         -- },
  --         -- move = {
  --         --   enable = true,
  --         --   set_jumps = true,
  --         --   goto_next_start = {
  --         --     [']f'] = '@function.outer',
  --         --     [']/'] = '@comment.outer',
  --         --     [']a'] = '@parameter.outer',
  --         --     [']C'] = '@class.outer',
  --         --     [']c'] = '@conditional.outer',
  --         --     [']B'] = '@block.outer',
  --         --   },
  --         --   goto_previous_start = {
  --         --     ['[f'] = '@function.outer',
  --         --     ['[/'] = '@comment.outer',
  --         --     ['[a'] = '@parameter.outer',
  --         --     ['[C'] = '@class.outer',
  --         --     ['[c'] = '@conditional.outer',
  --         --     ['[B'] = '@block.outer',
  --         --   },
  --         -- },
  --         -- swap = {
  --         --   enable = true,
  --         --   swap_next = {
  --         --     ['snf'] = '@function.outer',
  --         --     ['sna'] = '@parameter.inner',
  --         --     ['snC'] = '@parameter.inner',
  --         --     ['snc'] = '@parameter.inner',
  --         --     ['snl'] = '@parameter.inner',
  --         --     ['snB'] = '@parameter.inner',
  --         --   },
  --         --   swap_previous = {
  --         --     ['spf'] = '@parameter.inner',
  --         --     ['spa'] = '@parameter.inner',
  --         --     ['spC'] = '@parameter.inner',
  --         --     ['spc'] = '@parameter.inner',
  --         --     ['spl'] = '@parameter.inner',
  --         --     ['spB'] = '@parameter.inner',
  --         --   }
  --         -- },
  --       },
  --     }
  --   end,
  -- },
  { 'folke/ts-comments.nvim', config = true, event = 'VeryLazy' },
  {
    'Wansmer/treesj',
    event = 'VeryLazy',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = { '<space>m', '<space>j', '<space>s' },
    opts = {
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
    },
  },
  {
    'echasnovski/mini.ai',
    version = '*',
    event = 'VeryLazy',
    config = function()
      local ts_spec = require('mini.ai').gen_spec.treesitter

      return {
        n_lines = 500,
        custom_textobjects = {
          -- argument
          a = ts_spec { a = '@parameter.outer', i = '@parameter.inner' },
          -- class
          C = ts_spec { a = '@class.outer', i = '@class.inner' },
          -- function call
          f = ts_spec { a = '@call.outer', i = '@call.inner' },
          -- definition
          d = ts_spec {
            a = { '@function.outer', '@class.outer' },
            i = { '@function.inner', '@class.inner' },
          },
          -- scope
          s = ts_spec {
            a = { '@block.outer', '@conditional.outer', '@loop.outer' },
            i = { '@block.inner', '@conditional.inner', '@loop.inner' },
          },
          -- loop
          l = ts_spec { a = '@loop.outer', i = '@loop.inner' },
        },
      }
    end,
  },
}
