vim.pack.add({
  'gh:nvim-lua/plenary.nvim',
  'gh:jiaoshijie/undotree',
  'gh:sunnytamang/select-undo.nvim',
}, { confirm = false })

require('undotree').setup {
  window = { winblend = 0 },
}

vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })

require('select-undo').setup {
  persistent_undo = false,
  mapping = false,
  line_mapping = 'gu',
}

-- return {
--   {
--     'SunnyTamang/select-undo.nvim',
--     event = 'VeryLazy',
--     opts = {
--       persistent_undo = false, -- Enables persistent undo history
--       mapping = false, -- Enables default keybindings
--       line_mapping = 'gu', -- Undo for entire lines
--       -- partial_mapping = 'gcu', -- Undo for selected characters -- Note: dont use this line as gu can also handle partial undo
--     },
--   },
--   -- {
--   --   'tzachar/highlight-undo.nvim',
--   --   opts = {
--   --     hlgroup = 'CurSearch',
--   --     duration = 200,
--   --     pattern = { '*' },
--   --     -- ignored_filetypes = { 'neo-tree', 'fugitive', 'TelescopePrompt', 'mason', 'lazy' },
--   --     -- ignore_cb is in comma as there is a default implementation. Setting
--   --     -- to nil will mean no default os called.
--   --     -- ignore_cb = nil,
--   --   },
--   -- },
-- }
