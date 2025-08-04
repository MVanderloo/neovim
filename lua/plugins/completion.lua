vim.pack.add { 'gh:saghen/blink.cmp' }

require('blink.cmp').setup {
  'saghen/blink.cmp',
  dependencies = {
    'xzbdmw/colorful-menu.nvim',
    'mikavilpas/blink-ripgrep.nvim',
    'rafamadriz/friendly-snippets',
    'OXY2DEV/markview.nvim',
    -- 'kristijanhusak/vim-dadbod-completion',
  },
  event = 'VeryLazy',
  version = '*',
  -- I believe this is done automatically
  -- init = function() vim.lsp.config('*', { capabilities = require('blink.cmp').get_lsp_capabilities() }) end,
  opts = {
    keymap = {
      preset = 'super-tab',
      -- cancel
      ['<C-e>'] = { 'cancel', 'fallback' },

      -- select
      ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-y>'] = { 'accept', 'select_and_accept' },

      -- documentation
      ['<C-z>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
    },
    completion = {
      ghost_text = { enabled = true },
      keyword = { range = 'prefix' },
      trigger = {
        show_on_trigger_character = true,
        show_on_insert_on_trigger_character = true,
        show_in_snippet = false,
      },
      list = { selection = { preselect = false, auto_insert = true } },
      -- accept = { auto_brackets = { enabled = false } },
      accept = { auto_brackets = { enabled = true } },
      menu = {
        draw = {
          columns = { { 'label', gap = 1 }, { 'kind_icon' } },
          components = {
            label = {
              text = function(ctx) return require('colorful-menu').blink_components_text(ctx) end,
              highlight = function(ctx) return require('colorful-menu').blink_components_highlight(ctx) end,
            },
          },
        },
      },
      documentation = { auto_show = true, auto_show_delay_ms = 0 },
    },
    cmdline = { enabled = true },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'ripgrep' },
      -- per_filetype = { sql = { 'snippets', 'dadbod', 'buffer' } },
      providers = {
        lsp = { score_offset = 100 },
        path = {
          score_offset = 90,
          opts = { get_cwd = function(_) return vim.fn.getcwd() end },
        },
        snippets = {
          score_offset = 80,
          max_items = 3,
          min_keyword_length = 2,
        },
        buffer = {
          score_offset = 15,
          max_items = 3,
          min_keyword_length = 3,
        },
        ripgrep = {
          module = 'blink-ripgrep',
          name = 'Ripgrep',
          score_offset = 10,
          opts = {
            prefix_min_len = 3,
            backend = {
              context_size = 5,
              max_filesize = '1M',
              project_root_marker = '.git',
              project_root_fallback = true,
              search_casing = '--ignore-case', -- '--smart-case'
              additional_paths = {},
            },
          },
        },

        -- dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
      },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true, trigger = { show_on_insert = false } },
  },
}
