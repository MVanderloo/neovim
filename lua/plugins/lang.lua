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
  --     formatters_by_ft = {
  --       lua = { 'stylua' },
  --       python = { 'ruff' },
  --
  --       -- javascript = { "eslint_d", "js_beautify" },
  --       javascript = { 'prettierd', 'prettier', stop_after_first = true },
  --       typescript = { 'prettierd', 'prettier', stop_after_first = true },
  --       json = { 'prettierd' },
  --       -- json = { "fixjson" },
  --       json5 = { 'prettierd' },
  --       jsonc = { 'prettierd' },
  --       sh = { 'shfmt' },
  --       -- sh = { "shellcheck" },
  --       go = { 'gofumpt', 'goimports', 'goimports-reviser' },
  --       rust = { 'rustfmt', lsp_format = 'fallback' },
  --       -- rust = { "rustfmt" },
  --       yaml = { 'yamlfix' },
  --       -- html = { 'htmlbeautifier' },
  --       html = { 'prettierd' },
  --       css = { 'prettierd' },
  --       jq = { 'jq' },
  --       markdown = { 'mdformat' },
  --       terraform = { 'terraform_fmt' },
  --       toml = { 'taplo' },
  --       xml = { 'xmllint' },
  --       yq = { 'yq' },
  --       zig = { 'zigfmt' },
  --       zon = { 'zigfmt' },
  --       zsh = { 'shellcheck' },
  --       ['_'] = { 'trim_whitespace' },
  --     },
  --     formatters = {
  --       -- config formatters
  --       -- shfmt = { prepend_args = { '-i', '2' } },
  --     },
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPost' },
    config = function()
      local lint = require 'lint'

      lint.linters_by_ft = {
        go = { 'codespell', 'golangcilint' },
        html = { 'tidy' },
        javascript = { 'eslint_d' },
        json = { 'jsonlint' },
        make = { 'checkmake' },
        markdown = { 'alex', 'markdownlint' },
        rust = { 'clippy' },
        sh = { 'bash', 'shellcheck' },
        bash = { 'bash', 'shellcheck' },
        terraform = { 'tflint', 'trivy' },
        zsh = { 'shellcheck', 'zsh' },
        lua = { 'luacheck' },
      }
    end,
  },
}
