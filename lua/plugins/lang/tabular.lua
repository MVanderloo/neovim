return {
  {
    'hat0uma/csvview.nvim',
    ft = { 'csv', 'tsv' },
    opts = {
      view = {
        min_column_width = 1,
        spacing = 0,
        display_mode = 'border',
      },
      delimiter = {
        default = ',',
        ft = {
          tsv = '\t',
        },
      },
    },
    keys = {
      {
        '<localleader>e',
        '<cmd>CsvViewEnable<cr>',
        ft = { 'csv', 'tsv' },
        desc = 'Enable Tabular View',
      },
      {
        '<localleader>d',
        '<cmd>CsvViewDisable<cr>',
        ft = { 'csv', 'tsv' },
        desc = 'Disabled Tabular View',
      },
    },
  },
}
