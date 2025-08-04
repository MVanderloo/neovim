vim.pack.add { 'gh:hat0uma/csvview.nvim' }

require('csvview.nvim').setup {
  view = {
    min_column_width = 1,
    spacing = 1,
    display_mode = 'border',
  },
  delimiter = {
    default = ',',
    ft = {
      tsv = '\t',
    },
  },
  parser = { comments = { '#', '//' } },
  keymaps = {
    textobject_field_inner = { 'if', mode = { 'o', 'x' } },
    textobject_field_outer = { 'af', mode = { 'o', 'x' } },
    jump_next_field_end = { '<tab>', mode = { 'n', 'v' }, noremap = true },
    jump_prev_field_end = { '<s-tab>', mode = { 'n', 'v' }, noremap = true },
    -- jump_next_row = { '<Enter>', mode = { 'n', 'v' } },
    -- jump_prev_row = { '<S-Enter>', mode = { 'n', 'v' } },
  },
}
