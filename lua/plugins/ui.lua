return {
  {
    'utilyre/barbecue.nvim',
    version = '*',
    -- event = 'BufReadPre',
    event = 'BufReadPost',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
    },
    config = true,
  },
  {
    'folke/snacks.nvim',
    opts = {
      -- indent = {
      --   enabled = false,
      --   animate = { enabled = false },
      -- },
      image = { enabled = true },
      input = { enabled = true },
      -- notifier = { enabled = true },
      statuscolumn = {
        left = { 'mark', 'git', 'sign' },
        right = { 'fold' },
        folds = { open = true },
      },
    },
  },
}
