return {
  -- Formatting.
  {
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>lf',
        function() require('conform').format { async = true } end,
        mode = 'n',
        desc = 'Format buffer',
      },
    },
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        c = { name = 'clangd', timeout_ms = 500, lsp_format = 'prefer' },
        javascript = { 'prettier', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
        javascriptreact = { 'prettier', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
        json = { 'prettier', stop_on_first = true, name = 'dprint', timeout_ms = 500 },
        jsonc = { 'prettier', stop_on_first = true, name = 'dprint', timeout_ms = 500 },
        less = { 'prettier' },
        lua = { 'stylua' },
        markdown = { 'prettier' },
        rust = { name = 'rust_analyzer', timeout_ms = 500, lsp_format = 'prefer' },
        scss = { 'prettier' },
        sh = { 'shfmt' },
        typescript = { 'prettier', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
        typescriptreact = { 'prettier', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
        ['_'] = { 'trim_whitespace', 'trim_newlines' },
      },
      -- default_format_opts = { lsp_format = 'fallback' },
      format_on_save = function()
        if not vim.g.autoformat then return nil end
        return {}
      end,
    },
    -- init = function()
    --   vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    -- end,
  },
}
