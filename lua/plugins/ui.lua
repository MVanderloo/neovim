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
}
