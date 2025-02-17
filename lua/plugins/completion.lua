return {
  -- check these out
  -- https://cmp.saghen.dev/recipes.html
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      {
        'xzbdmw/colorful-menu.nvim',
        -- opts = { max_width = 30 },
      },
    },
    event = 'InsertEnter',
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'super-tab',
        -- -- preset = 'super-tab'
        -- -- modified super-tab
        -- --  tab, C-n, down cycles forward
        -- --  S-tab, C-p, up cycles backwards
        -- --  C-e to cancel
        -- --  keep typing to accept
        -- ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        -- ['<C-e>'] = { 'cancel', 'fallback' },
        -- ['<Tab>'] = {
        --   function(cmp)
        --     if cmp.snippet_active() then
        --       return cmp.accept()
        --     else
        --       return cmp.select_next()
        --     end
        --   end,
        --   'snippet_forward',
        --   'fallback',
        -- },
        -- ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
        -- ['<Up>'] = { 'select_prev', 'fallback' },
        -- ['<Down>'] = { 'select_next', 'fallback' },
        -- ['<C-p>'] = { 'select_prev', 'fallback' },
        -- ['<C-n>'] = { 'select_next', 'fallback' },
        -- ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        -- ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        -- ['<C-y>'] = { 'accept' },
        -- -- ['<CR>'] = {
        -- --   function(cmp)
        -- --     if cmp.get_selected_item().kind == 15 then
        -- --       return cmp.accept()
        -- --     end
        -- --   end,
        -- --   'fallback'
        -- -- }
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
        -- treesitter integration
        -- menu = { draw = { treesitter = { 'lsp' } } },
        -- colorful-menu integration
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
      -- sources = {
      --   default = { 'lsp', 'path' },
      --   cmdline = {},
      -- },
    },
  },
}
