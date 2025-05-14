return {
  {
    'ibhagwan/fzf-lua',
    event = 'VeryLazy',
    cmd = 'FzfLua',
    init = function()
      require('fzf-lua').register_ui_select()
    end,
    keys = {
      { '<leader>f.', '<cmd>FzfLua resume<cr>', desc = 'Resume last command' },
      {
        '<leader>/',
        function()
          require('fzf-lua').lgrep_curbuf {
            winopts = {
              height = 0.6,
              width = 0.5,
              preview = { vertical = 'up:70%' },
            },
          }
        end,
        desc = 'Grep current buffer',
      },
      { '<leader>fc', '<cmd>FzfLua highlights<cr>', desc = 'Highlights' },
      { '<leader>fd', '<cmd>FzfLua lsp_document_diagnostics<cr>', desc = 'Document diagnostics' },
      { '<leader>fD', '<cmd>FzfLua lsp_workspace_diagnostics<cr>', desc = 'Workspace diagnostics' },
      { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find files' },
      { '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = 'Grep' },
      { '<leader>fg', '<cmd>FzfLua grep_visual<cr>', desc = 'Grep', mode = 'x' },
      { '<leader>fh', '<cmd>FzfLua help_tags<cr>', desc = 'Help' },
      {
        '<leader>fr',
        function()
          -- Read from ShaDa to include files that were already deleted from the buffer list.
          vim.cmd 'rshada!'
          require('fzf-lua').oldfiles()
        end,
        desc = 'Recently opened files',
      },
      { 'z=', '<cmd>FzfLua spell_suggest<cr>', desc = 'Spelling suggestions' },
    },
    opts = function()
      local actions = require('fzf-lua').actions
      return {
        -- { 'telescope' },
        fzf_colors = {
          -- true,
          -- bg = { 'bg', 'Normal' },
          -- gutter = { 'bg', 'Normal' },
          -- info = { 'fg', 'Conditional' },
          -- scrollbar = { 'bg', 'Normal' },
          -- separator = { 'fg', 'Comment' },
        },
        fzf_opts = {
          ['--info'] = 'default',
          ['--layout'] = 'reverse-list',
        },
        keymap = {
          builtin = {
            ['<C-/>'] = 'toggle-help',
            ['<C-a>'] = 'select-all',
            ['<C-i>'] = 'toggle+down',
            ['<C-S-i>'] = 'toggle+up',
            ['<C-f>'] = 'preview-page-down',
            ['<C-b>'] = 'preview-page-up',
            -- -- neovim `:tmap` mappings for the fzf win
            -- -- true,        -- uncomment to inherit all the below in your custom config
            -- ["<M-Esc>"]     = "hide",     -- hide fzf-lua, `:FzfLua resume` to continue
            -- ["<F1>"]        = "toggle-help",
            -- ["<F2>"]        = "toggle-fullscreen",
            -- -- Only valid with the 'builtin' previewer
            -- ["<F3>"]        = "toggle-preview-wrap",
            -- ["<F4>"]        = "toggle-preview",
            -- -- Rotate preview clockwise/counter-clockwise
            -- ["<F5>"]        = "toggle-preview-ccw",
            -- ["<F6>"]        = "toggle-preview-cw",
            -- -- `ts-ctx` binds require `nvim-treesitter-context`
            -- ["<F7>"]        = "toggle-preview-ts-ctx",
            -- ["<F8>"]        = "preview-ts-ctx-dec",
            -- ["<F9>"]        = "preview-ts-ctx-inc",
            -- ["<S-Left>"]    = "preview-reset",
            -- ["<S-down>"]    = "preview-page-down",
            -- ["<S-up>"]      = "preview-page-up",
            -- ["<M-S-down>"]  = "preview-down",
            -- ["<M-S-up>"]    = "preview-up",
          },
          fzf = {
            ['ctrl-z'] = 'abort',
            ['ctrl-u'] = 'unix-line-discard',
            ['ctrl-f'] = 'half-page-down',
            ['ctrl-b'] = 'half-page-up',
            -- ["ctrl-a"]      = "beginning-of-line",
            -- ["ctrl-e"]      = "end-of-line",
            ['ctrl-a'] = 'toggle-all',
            ['alt-g'] = 'first',
            ['alt-G'] = 'last',
            -- ["f3"]          = "toggle-preview-wrap",
            -- ["f4"]          = "toggle-preview",
            ['shift-down'] = 'preview-page-down',
            ['shift-up'] = 'preview-page-up',
          },
        },
        actions = {
          files = {
            -- true,
            ['ctrl-q'] = actions.file_edit_or_qf,
            ['enter'] = actions.file_edit,
            ['ctrl-s'] = actions.file_split,
            ['ctrl-v'] = actions.file_vsplit,
            ['ctrl-t'] = actions.file_tabedit,
            ['alt-q'] = actions.file_sel_to_qf,
            ['alt-Q'] = actions.file_sel_to_ll,
            ['alt-i'] = actions.toggle_ignore,
            ['alt-h'] = actions.toggle_hidden,
            ['alt-f'] = actions.toggle_follow,
          },
        },
        winopts = {
          height = 0.8,
          width = 0.7,
          preview = {
            scrollbar = false,
            layout = 'vertical',
            vertical = 'up:40%',
          },
        },
        defaults = { git_icons = false },
        previewers = {
          codeaction = { toggle_behavior = 'extend' },
        },
        -- Configuration for specific commands.
        -- files = {
        --   winopts = {
        --     preview = { hidden = true },
        --   },
        -- },
        grep = {
          rg_glob_fn = function(query, opts)
            local regex, flags = query:match(string.format('^(.*)%s(.*)$', opts.glob_separator))
            -- Return the original query if there's no separator.
            return (regex or query), flags
          end,
        },
        helptags = {
          actions = {
            ['enter'] = actions.help_vert,
          },
        },
        lsp = {
          code_actions = {
            winopts = {
              width = 70,
              height = 20,
              relative = 'cursor',
              preview = {
                hidden = true,
                vertical = 'down:50%',
              },
            },
          },
        },
        oldfiles = {
          include_current_session = true,
          winopts = {
            preview = { hidden = true },
          },
        },
      }
    end,
  },
}
