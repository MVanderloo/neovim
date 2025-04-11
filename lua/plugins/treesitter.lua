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
    build = ':TSUpdate',
    opts = {
      ensure_installed = 'all',
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = { 'VeryLazy' },
    init = function()
      local config = require 'nvim-treesitter.configs'
      config.setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['a/'] = '@comment.outer',
              ['i/'] = '@comment.inner',
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['aC'] = '@class.outer',
              ['iC'] = '@class.inner',
              ['ac'] = '@conditional.outer',
              ['ic'] = '@conditional.inner',
              ['al'] = '@loop.outer',
              ['il'] = '@loop.inner',
              ['aB'] = '@block.outer',
              ['iB'] = '@block.inner',
            },
            selection_modes = {
              ['@function.outer'] = 'v',
              ['@function.inner'] = 'v',
              ['@comment.outer'] = 'v',
              ['@comment.inner'] = 'v',
              ['@parameter.outer'] = 'v',
              ['@parameter.inner'] = 'v',
              ['@class.outer'] = 'V',
              ['@class.inner'] = 'V',
              ['@conditional.outer'] = 'v',
              ['@conditional.inner'] = 'v',
              ['@loop.outer'] = 'v',
              ['@loop.inner'] = 'v',
              ['@block.outer'] = 'V',
              ['@block.inner'] = 'V',
            },
            include_surrounding_whitespace = true,
          },
          -- move = {
          --   enable = true,
          --   set_jumps = true,
          --   goto_next_start = {
          --     [']f'] = '@function.outer',
          --     [']/'] = '@comment.outer',
          --     [']a'] = '@parameter.outer',
          --     [']C'] = '@class.outer',
          --     [']c'] = '@conditional.outer',
          --     [']B'] = '@block.outer',
          --   },
          --   goto_previous_start = {
          --     ['[f'] = '@function.outer',
          --     ['[/'] = '@comment.outer',
          --     ['[a'] = '@parameter.outer',
          --     ['[C'] = '@class.outer',
          --     ['[c'] = '@conditional.outer',
          --     ['[B'] = '@block.outer',
          --   },
          -- },
          -- swap = {
          --   enable = true,
          --   swap_next = {
          --     ['snf'] = '@function.outer',
          --     ['sna'] = '@parameter.inner',
          --     ['snC'] = '@parameter.inner',
          --     ['snc'] = '@parameter.inner',
          --     ['snl'] = '@parameter.inner',
          --     ['snB'] = '@parameter.inner',
          --   },
          --   swap_previous = {
          --     ['spf'] = '@parameter.inner',
          --     ['spa'] = '@parameter.inner',
          --     ['spC'] = '@parameter.inner',
          --     ['spc'] = '@parameter.inner',
          --     ['spl'] = '@parameter.inner',
          --     ['spB'] = '@parameter.inner',
          --   }
          -- },
        },
      }
    end,
  },
  {
    'folke/ts-comments.nvim',
    config = true,
    event = 'VeryLazy',
  },
}
