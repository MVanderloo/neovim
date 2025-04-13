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
        -- -- preset = 'super-tab'
        -- -- modified super-tab
        --  tab, C-n, down cycles forward
        --  S-tab, C-p, up cycles backwards
        --  C-e to cancel
        --  keep typing to accept
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
        keyword = { range = 'prefix' },
        trigger = {
          show_on_trigger_character = true,
          show_on_insert_on_trigger_character = true,
          show_in_snippet = false,
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
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
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
        },
      },

      sources = {
        default = {
          'lsp',
          'path',
          'buffer',
          'ripgrep',
        },

        -- per_filetype = {
        --   sql = { 'snippets', 'dadbod', 'buffer' },
        -- },
        providers = {
          ripgrep = {
            module = 'blink-ripgrep',
            name = 'Ripgrep',
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
          },
          -- dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
        },
      },
      fuzzy = {
        implementation = 'prefer_rust_with_warning',
        sorts = {
          function(a, b)
            local source_priority = {
              lsp = 4,
              path = 3,
              buffer = 2,
              riprep= 1,
            }

            local a_priority = source_priority[a.source_id]
            local b_priority = source_priority[b.source_id]
            if a_priority ~= b_priority then return a_priority > b_priority end
          end,
          -- 'score',
          -- 'sort_text',
        },
      },
      signature = {
        enabled = true,
        trigger = { show_on_insert = false },
      },
    },
  },
}
