local function macro_recording()
  local reg = vim.fn.reg_recording()
  if reg == '' then return '' end
  return '@' .. reg
end

return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'UIEnter',
    opts = {
      refresh = { statusline = 10, tabline = 10, winbar = 10 },
      options = {
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode', 'selectioncount', macro_recording },
        lualine_b = {
          { 'filename', path = 4 },
        },
        lualine_c = { 'diff' },
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
      }
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
  },
  {
    'jake-stewart/auto-cmdheight.nvim',
    lazy = false,
    opts = {
      -- max cmdheight before displaying hit enter prompt.
      max_lines = 5,

      -- number of seconds until the cmdheight can restore.
      duration = 2,

      -- whether key press is required to restore cmdheight.
      remove_on_key = true,

      -- always clear the cmdline after duration and key press.
      -- by default it will only happen when cmdheight changed.
      clear_always = false,
    },
  },
}
