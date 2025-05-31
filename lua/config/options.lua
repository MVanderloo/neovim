local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 4
opt.softtabstop = 0 -- copy tabstop
opt.shiftwidth = 0 -- copy tabstop
opt.expandtab = true
opt.smartindent = true
opt.wrap = true
opt.breakindent = true

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.inccommand = 'split'

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = 'yes'
opt.scrolloff = 10
opt.showmode = false
opt.cursorline = true
opt.cmdheight = 0
opt.list = true
opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }
opt.winborder = 'rounded' -- "single" "rounded" "bold"

-- make window background transparent
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

-- Files
opt.autowriteall = true
opt.autowrite = true
opt.updatetime = 500
opt.hidden = true
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand(os.getenv '~/.local/share/nvim/undodir')
opt.undofile = true
opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-- Behavior
opt.splitright = true
opt.splitbelow = true
opt.errorbells = false
opt.iskeyword:append '-'
opt.virtualedit = 'block'
opt.selection = 'exclusive'
opt.mouse = 'a'

-- Completion
opt.completeopt = 'menuone,noinsert,noselect'
-- opt.autochdir = true

-- Key timeout
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0

-- Folds
opt.foldmethod = 'indent'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
opt.foldtext = '' -- enables syntax highlighting
opt.foldlevel = 99

-- Diff
-- opt.diffopt = "internal,filler,closeoff"
opt.diffopt = 'filler,internal,closeoff,algorithm:histogram,context:5,linematch:60'
opt.fillchars:append { diff = '╱' }

-- Spell
opt.spelloptions = 'camel'
