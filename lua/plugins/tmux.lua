vim.pack.add({ 'gh:christoomey/vim-tmux-navigator' }, { confirm = false })

vim.keymap.set({ 'n', 'x', 'i' }, '<C-h>', '<cmd>TmuxNavigateLeft<cr>', { remap = false })
vim.keymap.set({ 'n', 'x', 'i' }, '<C-j>', '<cmd>TmuxNavigateDown<cr>', { remap = false })
vim.keymap.set({ 'n', 'x', 'i' }, '<C-k>', '<cmd>TmuxNavigateUp<cr>', { remap = false })
vim.keymap.set({ 'n', 'x', 'i' }, '<C-l>', '<cmd>TmuxNavigateRight<cr>', { remap = false })
vim.keymap.set({ 'n', 'x', 'i' }, '<C-\\>', '<cmd>TmuxNavigatePrevious<cr>', { remap = false })
