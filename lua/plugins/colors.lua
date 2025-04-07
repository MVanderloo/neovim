-- disable builtin color schemes
vim.opt.wildignore:append {
  'blue.vim',
  'darkblue.vim',
  'delek.vim',
  'desert.vim',
  'elflord.vim',
  'evening.vim',
  'industry.vim',
  'habamax.vim',
  'koehler.vim',
  'lunaperche.vim',
  'morning.vim',
  'murphy.vim',
  'pablo.vim',
  'peachpuff.vim',
  'quiet.vim',
  'ron.vim',
  'shine.vim',
  'slate.vim',
  'sorbet.vim',
  'retrobox.vim',
  'torte.vim',
  'wildcharm.vim',
  'zaibatsu.vim',
  'zellner.vim',
}

return {
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   lazy = false,
  --   -- config = function() vim.cmd 'colorscheme catppuccin-mocha' end,
  -- },
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   config = function() vim.cmd 'colorscheme tokyonight' end,
  --   -- config = true,
  -- },
  {
    'navarasu/onedark.nvim',
    lazy = false,
    init = function() vim.cmd 'colorscheme onedark' end,
    opts = { style = 'darker' },
  },
}
