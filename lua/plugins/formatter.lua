vim.pack.add { 'gh:stevearc/conform.nvim' }

vim.o.formatexpr = "v:lua.require('conform').formatexpr()"

require('conform').setup {
  notify_on_error = true,
  default_format_opts = { lsp_format = 'fallback' },
  formatters_by_ft = {
    bash = { 'shfmt' },
    c = { name = 'clangd', timeout_ms = 500},
    fish = { 'fish_indent' },
    javascript = { 'prettier', name = 'dprint', timeout_ms = 500 },
    javascriptreact = { 'prettier', name = 'dprint', timeout_ms = 500 },
    json = { 'prettier', stop_on_first = true, name = 'dprint', timeout_ms = 500 },
    jsonc = { 'prettier', stop_on_first = true, name = 'dprint', timeout_ms = 500 },
    go = { 'goimports', 'gofmt' },
    less = { 'prettier' },
    lua = { 'stylua' },
    markdown = { 'prettier' },
    python = { 'ruff' },
    rust = { name = 'rust_analyzer', timeout_ms = 500 },
    scss = { 'prettier' },
    sh = { 'shfmt' },
    zsh = { 'shfmt' },
    ['*'] = { 'injected' },
    ['_'] = { 'trim_whitespace', 'trim_newlines' },
  },
  format_on_save = function(bufnr)
    if not vim.g.autoformat and not vim.b[bufnr].autoformat then return end
    return { timeout_ms = 500 }
  end,
}

vim.keymap.set({ 'n' }, 'glf', function() require('conform').format { async = true } end, { desc = 'Format Code' })
vim.keymap.set({ 'x' }, 'glf', function()
  require('conform').format({ async = true }, function(err)
    if not err then
      local mode = vim.api.nvim_get_mode().mode
      if vim.startswith(string.lower(mode), 'v') then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)
      end
    end
  end)
end, { desc = 'Format code' })
