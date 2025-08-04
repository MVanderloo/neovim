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

vim.pack.add { 'gh:shaunsingh/nord.nvim' }

vim.cmd 'colorscheme nord'

-- return {
--   {
--     'shaunsingh/nord.nvim',
--     lazy = false,
--     config = function() vim.cmd 'colorscheme nord' end,
--   },
-- {
--   'catppuccin/nvim',
--   name = 'catppuccin',
--   lazy = false,
--   config = function() vim.cmd 'colorscheme catppuccin-macchiato' end,
-- },
-- {
--   'folke/tokyonight.nvim',
--   lazy = false,
--   config = function() vim.cmd 'colorscheme tokyonight' end,
--   -- config = true,
-- },
-- {
--   'navarasu/onedark.nvim',
--   lazy = false,
--   init = function() vim.cmd 'colorscheme onedark' end,
--   opts = { style = 'darker' },
-- },
-- {
--   'rose-pine/neovim',
--   name = 'rose-pine',
--   config = function() vim.cmd 'colorscheme rose-pine-moon' end,
-- },
-- }
