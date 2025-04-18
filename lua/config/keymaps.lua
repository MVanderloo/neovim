local set = vim.keymap.set

-- Remove any delay for space as leader key
set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remove the default s binding in favor of surround mappings (sa, sr, sd)
set({ 'n', 'x' }, 's', '<Nop>', { silent = true })

-- j and k will move to the character visually below the cursor, to deal with line wrap
-- don't use this behavior if there is a count so that relative line numbering is true
set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
-- set({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
-- set({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- Have Esc clear highlighted search
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- toggle folds with tab
set('n', '<Tab>', 'za', { silent = true, noremap = true })
-- Ctrl-i is the same thing as tab - use ctrl-shift-o to jump forwards
set('n', '<C-S-o>', '<C-i>', { silent = true, noremap = true })
-- alternatively mini.bracketed binds [j and ]j but it's less spammable
-- if i can get used to using enter to toggle tab, I won't need the above workaround

-- Keep highlight when indenting block
set('v', '<', '<gv', { silent = true, noremap = true })
set('v', '>', '>gv', { silent = true, noremap = true })

-- move between panes
set('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
set('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
set('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
set('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

-- Resize window using <ctrl> arrow keys
set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Make n always search forward, N always search backward
-- zz will center the cursor
set({ 'n', 'x', 'o' }, 'n', "v:searchforward ? 'nzz' : 'Nzz'", { expr = true, desc = 'Next Search Result' })
set({ 'n', 'x', 'o' }, 'N', "v:searchforward ? 'Nzz' : 'nzz'", { expr = true, desc = 'Prev Search Result' })

-- Lazy.nvim
set({ 'n', 'x' }, '<leader>L', '<CMD>Lazy<CR>', { desc = 'Open Lazy' })

-- TODO activate these on LSP attach
set('n', '<leader>la', function() vim.lsp.buf.code_action { apply = true } end, { desc = 'Code actions' })
set('n', '<leader>lr', function() vim.lsp.buf.rename() end, { desc = 'Rename' })

set('n', '<leader>th', function()
  local enabled = vim.lsp.inlay_hint.is_enabled { bufnr = 0 }
  vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
end, { desc = 'Toggle LSP inlay hints' })

set('n', '-', '<cmd>Oil<cr>', { desc = 'Open Parent Directory' })

-- set by mini.bracketed
-- set({ 'n', 'x' }, ']d', function()
--   local d = vim.diagnostic.get_next()
--   if d ~= nil then vim.diagnostic.jump { diagnostic = d } end
-- end)
--
-- set({ 'n', 'x' }, '[d', function()
--   local d = vim.diagnostic.get_prev()
--   if d ~= nil then vim.diagnostic.jump { diagnostic = d } end
-- end)

set({ 'n', 'x' }, '<leader>td', function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end)

set('n', '<C-q>', vim.diagnostic.setqflist)

set({ 'n', 'x' }, '<leader>sw', '<cmd>SessionSearch<CR>', { desc = 'Session search' })
set({ 'n', 'x' }, '<leader>ss', '<cmd>SessionSave<CR>', { desc = 'Save session' })
set({ 'n', 'x' }, '<leader>sa', '<cmd>SessionToggleAutoSave<CR>', { desc = 'Toggle autosave' })
