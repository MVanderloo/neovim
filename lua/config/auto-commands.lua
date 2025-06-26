-- check if we need to reload the file when it changed
-- vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
--   pattern = '*',
--   callback = function()
--     if vim.fn.mode() ~= 'c' then vim.cmd 'checktime' end
--   end,
-- })

-- above was giving me errors, folke recommended the below snippet
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, { command = 'checktime' })

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  callback = function() vim.hl.on_yank() end,
})

-- goto last cursor location when opening file
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(event)
    local exclude = {}

    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_cursor_loc then return end
    vim.b[buf].last_cursor_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
})

-- create all intermediate directories along path when saving a file
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  callback = function(event)
    if event.match:match '^%w%w+:[\\/][\\/]' then return end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

-- start terminal in insert mode
vim.api.nvim_create_autocmd('TermOpen', { command = 'startinsert | set winfixheight' })

-- integrate LSP capabilities on attach
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client == nil then return end

    -- folding
    -- if client:supports_method 'textDocument/foldingRange' then
    --   local win = vim.api.nvim_get_current_win()
    --   vim.wo[win][0].foldmethod = 'expr'
    --   vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    -- end

    -- keybindings
    --   if client:supports_method then
    --     vim.keymap.set('i', '<leader>la')
  end,
})

-- root detection
vim.api.nvim_create_autocmd('BufEnter', {
  nested = true,
  callback = function(data)
    local names = { '.git', 'Makefile' }

    local path = vim.api.nvim_buf_get_name(data.buf)

    if path == '' then return end

    local root_file = vim.fs.find(names, { path = vim.fs.dirname(path), upward = true })[1]
    if root_file ~= nil then
      local root = vim.fs.dirname(root_file)
      if root ~= nil then vim.fn.chdir(root) end
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Disable features in big files',
  pattern = 'bigfile',
  callback = function(args)
    vim.schedule(function() vim.bo[args.buf].syntax = vim.filetype.match { buf = args.buf } or '' end)
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Close with <q>',
  pattern = { 'git', 'help', 'man', 'qf', 'query', 'scratch' },
  callback = function(args) vim.keymap.set('n', 'q', '<cmd>quit<cr>', { buffer = args.buf }) end,
})

vim.api.nvim_create_autocmd({ 'BufDelete', 'BufWipeout' }, {
  desc = 'Write to ShaDa when deleting/wiping out buffers',
  command = 'wshada',
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  callback = function() vim.hl.on_yank { higroup = 'Visual', priority = 250 } end,
})
