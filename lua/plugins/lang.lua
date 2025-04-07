return {
  -- {
  --   'WieeRd/auto-lsp.nvim',
  --   dependencies = { 'neovim/nvim-lspconfig' },
  --   event = 'VeryLazy',
  --   opts = {
  --     ['*'] = function()
  --       return {
  --         capabilities = require('blink.cmp').get_lsp_capabilities(),
  --       }
  --     end,
  --   },
  -- },
  {
    'Massolari/lsp-auto-setup.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    event = 'UIEnter',
    config = true,
  },
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPost' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>lf',
        function() require('conform').format { async = true } end,
        mode = 'n',
        desc = 'Format buffer',
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff' },

        -- javascript = { "eslint_d", "js_beautify" },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd' },
        -- json = { "fixjson" },
        json5 = { 'prettierd' },
        jsonc = { 'prettierd' },
        sh = { 'shfmt' },
        -- sh = { "shellcheck" },
        go = { 'gofumpt', 'goimports', 'goimports-reviser' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        -- rust = { "rustfmt" },
        yaml = { 'yamlfix' },
        -- html = { 'htmlbeautifier' },
        html = { 'prettierd' },
        css = { 'prettierd' },
        jq = { 'jq' },
        markdown = { 'mdformat' },
        terraform = { 'terraform_fmt' },
        toml = { 'taplo' },
        xml = { 'xmllint' },
        yq = { 'yq' },
        zig = { 'zigfmt' },
        zon = { 'zigfmt' },
        zsh = { 'shellcheck' },
        ['_'] = { 'trim_whitespace' },
      },
      default_format_opts = { lsp_format = 'fallback' },
      formatters = {
        -- config formatters
        -- shfmt = { prepend_args = { '-i', '2' } },
      },
    },
    -- init = function()
    --   -- why doesn't this work well
    --   vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    -- end,
  },
  -- require 'lua',
  -- require 'python',
  -- require 'tabular',
  {
    'mfussenegger/nvim-lint',
    -- event = { 'BufReadPost' },
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
