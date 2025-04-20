return {
  {
    'ibhagwan/fzf-lua',
    event = 'VeryLazy',
    cmd = 'FzfLua',
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
      return {
        -- Make stuff better combine with the editor.
        fzf_colors = {
          bg = { 'bg', 'Normal' },
          gutter = { 'bg', 'Normal' },
          info = { 'fg', 'Conditional' },
          scrollbar = { 'bg', 'Normal' },
          separator = { 'fg', 'Comment' },
        },
        fzf_opts = {
          ['--info'] = 'default',
          ['--layout'] = 'reverse-list',
        },
        keymap = {
          builtin = {
            ['<C-/>'] = 'toggle-help',
            ['<C-a>'] = 'toggle-fullscreen',
            ['<C-i>'] = 'toggle-preview',
            ['<C-f>'] = 'preview-page-down',
            ['<C-b>'] = 'preview-page-up',
          },
          fzf = {
            ['alt-s'] = 'toggle',
            ['alt-a'] = 'toggle-all',
            ['ctrl-i'] = 'toggle-preview',
          },
        },
        winopts = {
          height = 0.7,
          width = 0.55,
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
        files = {
          winopts = {
            preview = { hidden = true },
          },
        },
        grep = {
          rg_glob_fn = function(query, opts)
            local regex, flags = query:match(string.format('^(.*)%s(.*)$', opts.glob_separator))
            -- Return the original query if there's no separator.
            return (regex or query), flags
          end,
        },
        helptags = {
          actions = {
            ['enter'] = require('fzf-lua.actions').help_vert,
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
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(items, opts, on_choice)
        local ui_select = require 'fzf-lua.providers.ui_select'

        -- Register the fzf-lua picker the first time we call select.
        if not ui_select.is_registered() then
          ui_select.register(function(ui_opts)
            if ui_opts.kind == 'luasnip' then
              ui_opts.prompt = 'Snippet choice: '
              ui_opts.winopts = {
                relative = 'cursor',
                height = 0.35,
                width = 0.3,
              }
            elseif ui_opts.kind == 'lsp_message' then
              ui_opts.winopts = { height = 0.4, width = 0.4 }
            else
              ui_opts.winopts = { height = 0.6, width = 0.5 }
            end

            return ui_opts
          end)
        end

        -- Don't show the picker if there's nothing to pick.
        if #items > 0 then return vim.ui.select(items, opts, on_choice) end
      end
    end,
  },
  -- {
  --   'ibhagwan/fzf-lua',
  --   dependencies = { 'echasnovski/mini.icons' },
  --   event = 'VeryLazy',
  --   keys = {
  --     {
  --       '<leader>ff',
  --       function() require('fzf-lua').files() end,
  --       desc = 'Find Files in project directory',
  --     },
  --     {
  --       '<leader>fg',
  --       function() require('fzf-lua').live_grep() end,
  --       desc = 'Find by grepping in project directory',
  --     },
  --     {
  --       '<leader>fc',
  --       function() require('fzf-lua').files { cwd = vim.fn.stdpath 'config' } end,
  --       desc = 'Find in neovim configuration',
  --     },
  --     {
  --       '<leader>fh',
  --       function() require('fzf-lua').helptags() end,
  --       desc = '[F]ind [H]elp',
  --     },
  --     {
  --       '<leader>fk',
  --       function() require('fzf-lua').keymaps() end,
  --       desc = '[F]ind [K]eymaps',
  --     },
  --     {
  --       '<leader>fb',
  --       function() require('fzf-lua').builtin() end,
  --       desc = '[F]ind [B]uiltin FZF',
  --     },
  --     {
  --       '<leader>fw',
  --       function() require('fzf-lua').grep_cword() end,
  --       desc = '[F]ind current [W]ord',
  --     },
  --     {
  --       '<leader>fW',
  --       function() require('fzf-lua').grep_cWORD() end,
  --       desc = '[F]ind current [W]ORD',
  --     },
  --     {
  --       '<leader>fd',
  --       function() require('fzf-lua').diagnostics_document() end,
  --       desc = '[F]ind [D]iagnostics',
  --     },
  --     {
  --       '<leader>f.',
  --       function() require('fzf-lua').resume() end,
  --       desc = 'Resume Last Fzf',
  --     },
  --     {
  --       '<leader>fr',
  --       function() require('fzf-lua').oldfiles() end,
  --       desc = '[F]ind [R]ecent Files',
  --     },
  --     {
  --       '<leader>,',
  --       function() require('fzf-lua').buffers() end,
  --       desc = '[,] Find existing buffers',
  --     },
  --     {
  --       '<leader>/',
  --       function() require('fzf-lua').lgrep_curbuf() end,
  --       desc = '[/] Live grep the current buffer',
  --     },
  --   },
  --   opts = {
  --     'default-title',
  --     fzf_colors = {
  --       true,
  --       ['fg'] = { 'fg', 'BlinkCmpGhostText' },
  --       -- ['bg'] = { 'bg', 'Normal' },
  --       -- ['hl'] = { 'fg', 'Comment' },
  --       -- ['fg+'] = { 'fg', 'Normal' },
  --       -- ['bg+'] = { 'bg', { 'CursorLine', 'Normal' } },
  --       -- ['hl+'] = { 'fg', 'Statement' },
  --       -- ['info'] = { 'fg', 'PreProc' },
  --       -- ['prompt'] = { 'fg', 'Conditional' },
  --       -- ['pointer'] = { 'fg', 'Exception' },
  --       -- ['marker'] = { 'fg', 'Keyword' },
  --       -- ['spinner'] = { 'fg', 'Label' },
  --       -- ['header'] = { 'fg', 'Comment' },
  --       -- ['gutter'] = '-1',
  --     },
  --     fzf = {
  --       ['ctrl-d'] = 'preview-page-down',
  --       ['ctrl-u'] = 'preview-page-up',
  --       -- ['ctrl-q'] = 'select-all+accept',
  --     },
  --     actions = {
  --       -- files = {
  --       --   ['default'] = require("fzf-lua").actions.file_edit_or_qf,
  --       -- },
  --     },
  --   },
  -- },
}
