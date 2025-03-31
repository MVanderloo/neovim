return {
  {
    'hat0uma/csvview.nvim',
    cmd = { 'CsvViewEnable', 'CsvViewDisable', 'CsvViewToggle' },
    ft = { 'csv', 'tsv' },
    keys = {
      { '<localleader>e', '<cmd>CsvViewEnable<cr>', desc = 'Enable Csv View' },
      { '<localleader>d', '<cmd>CsvViewDisable<cr>', desc = 'Disable Csv View' },
      { '<localleader>t', '<cmd>CsvViewToggle<cr>', desc = 'Toggle Csv View' },
    },
    opts = {
      parser = { comments = { '#', '//' } },
      view = {
        display_mode = 'border',
      },
      keymaps = {
        textobject_field_inner = { 'if', mode = { 'o', 'x' } },
        textobject_field_outer = { 'af', mode = { 'o', 'x' } },
        jump_next_field_end = { '>', mode = { 'n', 'v' } },
        jump_prev_field_end = { '<', mode = { 'n', 'v' } },
        jump_next_row = { '<Enter>', mode = { 'n', 'v' } },
        jump_prev_row = { '<S-Enter>', mode = { 'n', 'v' } },
      },
    },
  },
}
