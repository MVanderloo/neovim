-- check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  pattern = '*',
  callback = function()
    if vim.fn.mode() ~= 'c' then vim.cmd 'checktime' end
  end,
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  callback = function() vim.highlight.on_yank() end,
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
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    local file_path = vim.fn.expand '<afile>:p:h'
    if vim.fn.isdirectory(file_path) == 0 then vim.fn.mkdir(file_path, 'p') end
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
