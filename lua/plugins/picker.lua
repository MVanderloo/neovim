return {
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
  {
    'echasnovski/mini.pick',
    version = '*',
    event = 'VeryLazy',
    keys = {
      { '<leader>ff', '<cmd>Pick files<cr>' },
      { '<leader>fg', '<cmd>Pick grep_live<cr>' },
      { '<leader>,', '<cmd>Pick buffers<cr>' },
      { '<leader>,', '<cmd>Pick buffers<cr>' },
    },
    opts = {
      options = { content_from_bottom = true },
    },
  },
  {
    'folke/snacks.nvim',
    event = 'VeryLazy',
    opts = {
      picker = { enabled = true },
    },
    keys = {
      -- { '<leader><space>', function() Snacks.picker.smart() end, desc = 'Smart Find Files' },
      -- { '<leader>,', function() Snacks.picker.buffers() end, desc = 'Buffers' },
      -- { '<leader>/', function() Snacks.picker.grep() end, desc = 'Grep' },
      -- { '<leader>:', function() Snacks.picker.command_history() end, desc = 'Command History' },
      -- { '<leader>n', function() Snacks.picker.notifications() end, desc = 'Notification History' },
      -- -- find
      -- { '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Buffers' },
      -- { '<leader>fc', function() Snacks.picker.files { cwd = vim.fn.stdpath 'config' } end, desc = 'Find Config File' },
      -- -- { '<leader>ff', function() Snacks.picker.files() end, desc = 'Find Files' },
      -- { '<leader>fg', function() Snacks.picker.git_files() end, desc = 'Find Git Files' },
      -- { '<leader>fp', function() Snacks.picker.projects() end, desc = 'Projects' },
      -- { '<leader>fr', function() Snacks.picker.recent() end, desc = 'Recent' },
      -- -- git
      -- { '<leader>gb', function() Snacks.picker.git_branches() end, desc = 'Git Branches' },
      -- { '<leader>gl', function() Snacks.picker.git_log() end, desc = 'Git Log' },
      -- { '<leader>gL', function() Snacks.picker.git_log_line() end, desc = 'Git Log Line' },
      -- { '<leader>gs', function() Snacks.picker.git_status() end, desc = 'Git Status' },
      -- { '<leader>gS', function() Snacks.picker.git_stash() end, desc = 'Git Stash' },
      -- { '<leader>gd', function() Snacks.picker.git_diff() end, desc = 'Git Diff (Hunks)' },
      -- { '<leader>gf', function() Snacks.picker.git_log_file() end, desc = 'Git Log File' },
      -- -- Grep
      -- { '<leader>sb', function() Snacks.picker.lines() end, desc = 'Buffer Lines' },
      -- { '<leader>sB', function() Snacks.picker.grep_buffers() end, desc = 'Grep Open Buffers' },
      -- { '<leader>sg', function() Snacks.picker.grep() end, desc = 'Grep' },
      -- { '<leader>sw', function() Snacks.picker.grep_word() end, desc = 'Visual selection or word', mode = { 'n', 'x' } },
      -- -- search
      -- { '<leader>s"', function() Snacks.picker.registers() end, desc = 'Registers' },
      -- { '<leader>s/', function() Snacks.picker.search_history() end, desc = 'Search History' },
      -- { '<leader>sa', function() Snacks.picker.autocmds() end, desc = 'Autocmds' },
      -- { '<leader>sb', function() Snacks.picker.lines() end, desc = 'Buffer Lines' },
      -- { '<leader>sc', function() Snacks.picker.command_history() end, desc = 'Command History' },
      -- { '<leader>sC', function() Snacks.picker.commands() end, desc = 'Commands' },
      -- { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = 'Diagnostics' },
      -- { '<leader>sD', function() Snacks.picker.diagnostics_buffer() end, desc = 'Buffer Diagnostics' },
      -- { '<leader>sh', function() Snacks.picker.help() end, desc = 'Help Pages' },
      -- { '<leader>sH', function() Snacks.picker.highlights() end, desc = 'Highlights' },
      -- { '<leader>si', function() Snacks.picker.icons() end, desc = 'Icons' },
      -- { '<leader>sj', function() Snacks.picker.jumps() end, desc = 'Jumps' },
      -- { '<leader>sk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },
      -- { '<leader>sl', function() Snacks.picker.loclist() end, desc = 'Location List' },
      -- { '<leader>sm', function() Snacks.picker.marks() end, desc = 'Marks' },
      -- { '<leader>sM', function() Snacks.picker.man() end, desc = 'Man Pages' },
      -- { '<leader>sp', function() Snacks.picker.lazy() end, desc = 'Search for Plugin Spec' },
      -- { '<leader>sq', function() Snacks.picker.qflist() end, desc = 'Quickfix List' },
      -- { '<leader>sR', function() Snacks.picker.resume() end, desc = 'Resume' },
      -- { '<leader>su', function() Snacks.picker.undo() end, desc = 'Undo History' },
      -- { '<leader>uC', function() Snacks.picker.colorschemes() end, desc = 'Colorschemes' },
      -- -- LSP
      { 'gd', function() require('snacks').picker.lsp_definitions() end, desc = 'Goto Definition' },
      { 'gD', function() require('snacks').picker.lsp_declarations() end, desc = 'Goto Declaration' },
      { 'gr', function() require('snacks').picker.lsp_references() end, nowait = true, desc = 'References' },
      { 'gI', function() require('snacks').picker.lsp_implementations() end, desc = 'Goto Implementation' },
      { 'gy', function() require('snacks').picker.lsp_type_definitions() end, desc = 'Goto T[y]pe Definition' },
      -- { '<leader>ls', function() Snacks.picker.lsp_symbols() end, desc = 'LSP Symbols' },
      -- { '<leader>lw', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'LSP Workspace Symbols' },
    },
  },
}
