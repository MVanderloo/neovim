return {
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy', -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    init = function()
      vim.diagnostic.config {
        underline = true,
        severity_sort = true,
        virtual_text = false,
        signs = false,
      }
    end,
    opts = {
      preset = 'powerline',
      options = {
        -- show_source = { enabled = true, if_many = true },
        show_source = { enabled = true },
        use_icons_from_diagnostic = false,
        set_arrow_to_diag_color = false,
        add_messages = true,
        softwrap = 30,
        multilines = { enabled = true, always_show = true },
        show_all_diags_on_cursorline = false,
        enable_on_select = true,
        break_line = { enabled = false, after = 30 },
        -- severity = {
        --   vim.diagnostic.severity.ERROR,
        --   vim.diagnostic.severity.WARN,
        --   vim.diagnostic.severity.INFO,
        --   vim.diagnostic.severity.HINT,
        -- },
      },
      disabled_ft = {},
    },
  },
}
