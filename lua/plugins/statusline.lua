return {
  'nvim-lualine/lualine.nvim',
  event = 'UIEnter',
  opts = {
    refresh = { statusline = 10, tabline = 10, winbar = 10 },
    options = {
      component_separators = { left = '|', right = '|' },
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { 'mode', 'selectioncount' },
      lualine_b = { 'filename' },
      lualine_c = {
        'diff',
      },
      lualine_x = {
        'searchcount',
        {
          'diagnostics',
          symbols = { error = '󰅙 ', warn = '󰀦 ', info = '󰋼 ', hint = '󰌵 ' },
        },
      },
      lualine_y = { 'progress', 'filesize' },
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
    --   lualine_a = {},
    --   lualine_b = {},
    --   lualine_c = {},
    --   lualine_x = {},
    --   lualine_y = {},
    --   lualine_z = {},
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
