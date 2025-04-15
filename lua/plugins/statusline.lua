return {
  'nvim-lualine/lualine.nvim',
  event = 'UIEnter',
  opts = {
    refresh = { statusline = 10 },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'filename' },
      lualine_c = {
        {
          'diagnostics',
          symbols = { error = '󰅙 ', warn = '󰀦 ', info = '󰋼 ', hint = '󰌵 ' },
        },
      },
      lualine_x = { 'filetype' },
      lualine_y = { 'encoding'},
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    -- tabline = {
    --   lualine_a = { 'branch' },
    --   lualine_b = { 'diff' },
    --   lualine_c = { 'filename' },
    --   lualine_x = {},
    --   lualine_y = {},
    --   lualine_z = { 'tabs' },
    -- },
    -- winbar = {
    --   lualine_a = {},
    --   lualine_b = {},
    --   lualine_c = { 'filename' },
    --   lualine_x = {},
    --   lualine_y = {},
    --   lualine_z = {},
    -- },
    -- inactive_winbar = {},
    -- extensions = {},
  },
}
