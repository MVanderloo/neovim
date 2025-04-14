return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'xzbdmw/colorful-menu.nvim',
      'mikavilpas/blink-ripgrep.nvim',
      -- 'rafamadriz/friendly-snippets',
      -- 'kristijanhusak/vim-dadbod-completion',
    },
    event = 'VeryLazy',
    version = '*',
    init = function() vim.lsp.config('*', { capabilities = require('blink.cmp').get_lsp_capabilities() }) end,
    opts = {
      keymap = {
        preset = 'super-tab',
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'cancel', 'fallback' },
        ['<Tab>'] = {
          'select_next',
          -- function(cmp)
          --   if cmp.snippet_active() then
          --     return cmp.accept()
          --   else
          --     return cmp.select_next()
          --   end
          -- end,
          -- 'snippet_forward',
          'fallback',
        },
        ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-y>'] = { 'accept' },
        -- ['<CR>'] = {
        --   function(cmp)
        --     if cmp.get_selected_item().kind == 15 then
        --       return cmp.accept()
        --     end
        --   end,
        --   'fallback'
        -- }
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
        accept = { auto_brackets = { enabled = false } },
        menu = {
          draw = {
            columns = { { 'kind_icon' }, { 'label', gap = 1 } },
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

      sources = {
        default = { 'lsp', 'path', 'buffer', 'ripgrep' },
        -- per_filetype = { sql = { 'snippets', 'dadbod', 'buffer' } },
        providers = {
          lsp = { score_offset = 100 },
          path = { score_offset = 90 },
          buffer = { score_offset = 20 },
          ripgrep = {
            module = 'blink-ripgrep',
            name = 'Ripgrep',
            score_offset = 10,
            opts = {
              prefix_min_len = 3,
              context_size = 5,
              max_filesize = '1M',
              project_root_marker = '.git',
              project_root_fallback = true,
              search_casing = '--ignore-case', -- '--smart-case'
              additional_paths = {},
              backend = {
                -- The backend to use for searching. Defaults to "ripgrep".
                -- Available options:
                -- - "ripgrep", always use ripgrep
                -- - "gitgrep", always use git grep
                -- - "gitgrep-or-ripgrep", use git grep if possible, otherwise
                --   ripgrep
                use = 'ripgrep',
              },
            },
            score_offset = 0,
          },
          -- dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
        },
      },
      fuzzy = {
        implementation = 'prefer_rust_with_warning',
      },
      signature = {
        enabled = true,
        trigger = { show_on_insert = false },
      },
      signature = { enabled = true, trigger = { show_on_insert = false } },
    },
  },
}
