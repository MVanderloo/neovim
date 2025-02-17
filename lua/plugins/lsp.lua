return {
  {
    'folke/lazydev.nvim',
    dependencies = {
      { 'Bilal2453/luvit-meta', lazy = true },
    },
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
      { 'j-hui/fidget.nvim', config = true },
    },
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { 'LspInfo', 'LspInstall', 'LspUninstall' },
    opts = {
      servers = {
        lua_ls = {},
        basedpyright = {},
        bashls = {},
        gopls = {},
        zls = {},
        taplo = {},
      },
    },
    config = function(_, opts)
      local lspconfig = require 'lspconfig'
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
  },
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>lf',
        function() require('conform').format { async = true } end,
        mode = '',
        desc = 'Format buffer',
      },
    },
    ---@module 'conform'
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd' },
        json5 = { 'prettierd' },
        jsonc = { 'prettierd' },
        sh = { 'shfmt' },
        go = { 'goimports', 'gofmt' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        yaml = { 'yamlfix' },
        ['_'] = { 'trim_whitespace' },
      },
      default_format_opts = { lsp_format = 'fallback' },
      formatters = {
        -- config formatters
        -- shfmt = { prepend_args = { '-i', '2' } },
      },
    },
    init = function()
      -- why doesn't this work well
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}
