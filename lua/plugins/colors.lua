-- disable builtin color schemes
vim.opt.wildignore:append {
  'blue.vim',
  'darkblue.vim',
  'delek.vim',
  'desert.vim',
  'elflord.vim',
  'evening.vim',
  'habamax.vim',
  'industry.vim',
  'koehler.vim',
  'lunaperche.vim',
  'morning.vim',
  'murphy.vim',
  'pablo.vim',
  'peachpuff.vim',
  'quiet.vim',
  'retrobox.vim',
  'ron.vim',
  'shine.vim',
  'slate.vim',
  'sorbet.vim',
  'torte.vim',
  'unokai.vim',
  'vim.vim',
  'wildcharm.vim',
  'zaibatsu.vim',
  'zellner.vim',
}

vim.pack.add({ 'gh:shaunsingh/nord.nvim' }, { confirm = false })
vim.cmd 'colorscheme nord'

-- vim.pack.add({ 'gh:catppuccin/nvim' }, { confirm = false })
-- vim.cmd 'colorscheme catppuccin'

-- vim.pack.add({ 'gh:folke/tokyonight.nvim' }, { confirm = false })
-- vim.cmd 'colorscheme tokyonight'

-- vim.pack.add({ 'gh:navarasu/onedark.nvim' }, { confirm = false })
-- vim.cmd 'colorscheme onedark'

-- vim.pack.add({ 'gh:rose-pine/neovim' }, { confirm = false })
-- vim.cmd 'colorscheme rose-pine'
