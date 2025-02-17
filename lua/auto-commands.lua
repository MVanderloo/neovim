-- check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  pattern = '*',
  callback = function()
    if vim.fn.mode() ~= 'c' then
      vim.cmd 'checktime'
    end
  end,
})

-- Make tabular data more readable
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  desc = 'Enable csvview on csv and tsv files',
  pattern = { '*.csv', '*.tsv' },
  callback = function()
    require('csvview').enable()
    vim.opt_local.wrap = false
    vim.opt_local.number = true
    vim.opt_local.relativenumber = false
  end,
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- goto last cursor location when opening file
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(event)
    local exclude = { 'gitcommit' }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_cursor_loc then
      return
    end
    vim.b[buf].last_cursor_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- create all intermediate directories along path when saving a file
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  callback = function(event)
    if event.match:match '^%w%w+:[\\/][\\/]' then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'text', 'plaintex', 'typst', 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- set scrolloff to 999 in man page and help buffers
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'man', 'help' },
  callback = function()
    vim.cmd 'normal! M' -- move cursor to center
    vim.opt_local.scrolloff = 999 -- keep cursor in the center
  end,
})

-- start terminal in insert mode
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  command = 'startinsert | set winfixheight',
})

-- start git messages in insert mode
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'gitcommit', 'gitrebase' },
  command = 'startinsert | 1',
})

-- local function open_diffview_with_files()
--   local args = vim.fn.argv()
--   if #args >= 2 then
--     require('diffview').open { args[1], args[2] }
--   else
--     require('diffview').open {}
--   end
-- end
--
-- -- Autocommand to trigger diffview on startup with -d
-- vim.api.nvim_create_autocmd('VimEnter', {
--   pattern = '*',
--   callback = function()
--     -- Check if the user started nvim with -d and provided files
--     local args = vim.fn.argv()
--     if vim.fn.index(args, '-d') ~= -1 then
--       open_diffview_with_files()
--     end
--   end,
-- })
