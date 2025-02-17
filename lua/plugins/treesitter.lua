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
  -- { 'nvim-treesitter/nvim-treesitter-context' }, -- this is a bit intrusive
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('nvim-treesitter.configs').setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['aC'] = '@class.outer',
              ['iC'] = '@class.inner',
              ['ic'] = '@conditional.inner',
              ['ac'] = '@conditional.outer',
              ['il'] = '@loop.inner',
              ['al'] = '@loop.outer',
              ['at'] = '@comment.outer',
            },
          },
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
}
