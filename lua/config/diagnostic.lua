vim.diagnostic.config {
  underline = true,
  virtual_text = {
    prefix = '',
    severity = nil,
    source = 'if_many',
    format = nil,
  },
  severity_sort = true,
  update_in_insert = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅙 ',
      [vim.diagnostic.severity.WARN] = '󰀦 ',
      [vim.diagnostic.severity.INFO] = '󰋼 ',
      [vim.diagnostic.severity.HINT] = '󰌵 ',
    },
  },
}

vim.keymap.set({ 'n', 'x' }, ']d', function()
  local d = vim.diagnostic.get_next()
  if d ~= nil then vim.diagnostic.jump { diagnostic = d } end
end)

vim.keymap.set({ 'n', 'x' }, '[d', function()
  local d = vim.diagnostic.get_prev()
  if d ~= nil then vim.diagnostic.jump { diagnostic = d } end
end)

vim.keymap.set('n', '<C-q>', vim.diagnostic.setqflist)
