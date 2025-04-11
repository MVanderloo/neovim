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
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN] = 'W',
      [vim.diagnostic.severity.INFO] = 'I',
      [vim.diagnostic.severity.HINT] = 'H',
    },
    -- linehl = {
    --   [vim.diagnostic.severity.ERROR] = 'Error',
    --   [vim.diagnostic.severity.WARN] = 'Warn',
    --   [vim.diagnostic.severity.INFO] = 'Info',
    --   [vim.diagnostic.severity.HINT] = 'Hint',
    -- },
  },
}

vim.keymap.set({ 'n', 'x' }, ']d', function()
  local d = vim.diagnostic.get_next()
  if type(d) == nil then vim.diagnostic.jump { diagnostic = d } end
end)
