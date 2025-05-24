return {
  'nmac427/guess-indent.nvim',
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', event = 'InsertEnter' },
  -- { 'echasnovski/mini.align', version = '*', config = true },
  { 'echasnovski/mini.operators', version = '*', event = 'VeryLazy', config = true },
  { 'echasnovski/mini.surround', version = '*', event = 'VeryLazy', config = true },
  { 'echasnovski/mini.pairs', version = '*', event = 'InsertEnter', config = true },
}
