return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'all' },
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
              -- ['ac'] = '@class.outer',
              -- ['ic'] = '@class.inner',
              ['ao'] = '@comment.outer',
              -- ['as'] = { query = '@local.scope', query_group = 'locals', desc = 'Select language scope' },
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['aC'] = '@class.outer',
              ['iC'] = '@class.inner',
              ['ic'] = '@conditional.inner',
              ['ac'] = '@conditional.outer',
              ['il'] = '@loop.inner',
              ['al'] = '@loop.outer',
            },
            selection_modes = {
              ['@parameter.outer'] = 'v',
              ['@function.outer'] = 'V',
              ['@class.outer'] = '<c-v>',
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true or false
            include_surrounding_whitespace = true,
          },
          -- swap = {
          --   enable = true,
          --   swap_next = {
          --     ['<leader>a'] = { query = '@parameter.inner', desc = 'Swap with next parameter' },
          --   },
          --   swap_previous = {
          --     ['<leader>A'] = '@parameter.inner',
          --   },
          -- },
          -- move = {
          --   enable = true,
          --   set_jumps = true, -- whether to set jumps in the jumplist
          --   goto_next_start = {
          --     [']m'] = '@function.outer',
          --     [']]'] = '@class.outer',
          --   },
          --   goto_next_end = {
          --     [']M'] = '@function.outer',
          --     [']['] = '@class.outer',
          --   },
          --   goto_previous_start = {
          --     ['[m'] = '@function.outer',
          --     ['[['] = '@class.outer',
          --   },
          --   goto_previous_end = {
          --     ['[M'] = '@function.outer',
          --     ['[]'] = '@class.outer',
          --   },
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
