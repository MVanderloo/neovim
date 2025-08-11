-- Tab / Indentation
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

-- Search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.inccommand = 'split'

-- Appearance
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes:2'
vim.opt.scrolloff = 10
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.cmdheight = 0
vim.opt.list = true
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }
vim.opt.winborder = 'rounded' -- "single" "rounded" "bold"

-- make window background transparent
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

-- Files
vim.opt.autowriteall = true
vim.opt.autowrite = true
vim.opt.updatetime = 500
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath 'data' .. '/undo'
vim.opt.undofile = true
vim.opt.sessionoptions = 'blank,buffers,curdir,folds,globals,help,localoptions,options,tabpages,winpos,winsize'

-- Behavior
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.errorbells = false
vim.opt.iskeyword:append '-'
vim.opt.virtualedit = 'block'
vim.opt.selection = 'exclusive'
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

-- Completion
vim.opt.completeopt = 'menuone,noinsert,noselect'

-- Key timeout
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0

-- Folds
vim.opt.foldmethod = 'manual'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldtext = '' -- enables syntax highlighting
vim.opt.foldlevel = 99

-- Diff
-- vim.opt.diffopt = "internal,filler,closeoff"
vim.opt.diffopt = 'filler,internal,closeoff,algorithm:histogram,context:5,linematch:60'
vim.opt.fillchars:append { diff = '╱' }

-- Spell
vim.opt.spelloptions = 'camel'

-- execute .nvim.lua for project local config
vim.opt.exrc = true
