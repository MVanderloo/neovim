return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
    ftype = { 'markdown' },
    opts = {
      -- completions was causing some error while i was not in markdown
      -- completions = { blink = { enabled = true } }
    },
  },
}
