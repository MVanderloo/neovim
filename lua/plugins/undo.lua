return {
  {
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    event = 'VeryLazy',
    config = true,
    keys = {
      { '<leader>U', "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  {
    'SunnyTamang/select-undo.nvim',
    event = 'VeryLazy',
    opts = {
      persistent_undo = false, -- Enables persistent undo history
      mapping = false, -- Enables default keybindings
      line_mapping = 'gu', -- Undo for entire lines
      -- partial_mapping = 'gcu', -- Undo for selected characters -- Note: dont use this line as gu can also handle partial undo
    },
  },
  -- {
  --   'tzachar/highlight-undo.nvim',
  --   opts = {
  --     hlgroup = 'CurSearch',
  --     duration = 200,
  --     pattern = { '*' },
  --     -- ignored_filetypes = { 'neo-tree', 'fugitive', 'TelescopePrompt', 'mason', 'lazy' },
  --     -- ignore_cb is in comma as there is a default implementation. Setting
  --     -- to nil will mean no default os called.
  --     -- ignore_cb = nil,
  --   },
  -- },
}
