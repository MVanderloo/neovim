vim.pack.add { 'gh:lewis6991/gitsigns.nvim' }

require("gitsigns").setup {
  current_line_blame = true,
  current_line_blame_opts = {
    virtual_text = true,
    virtual_text_pos = "right_align",
    delay = 10,
    ignore_whitespace = true,
    virtual_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)

    map('v', '<leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('v', '<leader>hr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hi', gitsigns.preview_hunk_inline)

    map('n', '<leader>hb', function()
      gitsigns.blame_line({ full = true })
    end)

    map('n', '<leader>hd', gitsigns.diffthis)

    map('n', '<leader>hD', function()
      gitsigns.diffthis('~')
    end)

    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
    map('n', '<leader>hq', gitsigns.setqflist)

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>tw', gitsigns.toggle_word_diff)

    -- Text object
    map({'o', 'x'}, 'ih', gitsigns.select_hunk)
  end
}

-- return {
--   {
--     'sindrets/diffview.nvim',
--     cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
--     keys = {
--       {
--         '<leader>gd',
--         function() vim.cmd 'DiffviewOpen' end,
--         desc = 'Open Diffview',
--       },
--       {
--         '<leader>gD',
--         function() vim.cmd 'DiffviewClose' end,
--         desc = 'Close Diffview',
--       },
--     },
--     config = function()
--       local actions = require 'diffview.actions'
--       return {
--         diff_binaries = false,
--         enhanced_diff_hl = true,
--         use_icons = false, -- Requires nvim-web-devicons
--         watch_index = true, -- Update views and index buffers when the git index changes.
--         icons = { folder_closed = '', folder_open = '' },
--         signs = { fold_closed = '', fold_open = '', done = '✓' },
--         view = {
--           default = { layout = 'diff2_horizontal', disable_diagnostics = false, winbar_info = false },
--           merge_tool = { layout = 'diff3_horizontal', disable_diagnostics = true, winbar_info = true },
--           file_history = { layout = 'diff2_horizontal', disable_diagnostics = false, winbar_info = false },
--         },
--         file_panel = {
--           listing_style = 'tree', -- One of 'list' or 'tree'
--           win_config = { position = 'left', width = 35, win_opts = {} },
--         },
--         file_history_panel = {
--           log_options = {
--             git = {
--               single_file = { diff_merges = 'combined' },
--               multi_file = { diff_merges = 'first-parent' },
--             },
--             hg = { single_file = {}, multi_file = {} },
--           },
--           win_config = { position = 'bottom', height = 16, win_opts = {} },
--         },
--         commit_log_panel = { win_config = {} },
--         default_args = { DiffviewOpen = {}, DiffviewFileHistory = {} },
--         hooks = {},
--         keymaps = {
--           disable_defaults = false,
--           view = {
--             -- The `view` bindings are active in the diff buffers, only when the current tabpage is a Diffview.
--             { 'n', ']f', actions.select_next_entry, { desc = 'Open the diff for the next file' } },
--             { 'n', '[f', actions.select_prev_entry, { desc = 'Open the diff for the previous file' } },
--             { 'n', '[F', actions.select_first_entry, { desc = 'Open the diff for the first file' } },
--             { 'n', ']F', actions.select_last_entry, { desc = 'Open the diff for the last file' } },
--             { 'n', 'gf', actions.goto_file_edit, { desc = 'Open the file in the previous tabpage' } },
--             -- { 'n', '<C-w><C-f>', actions.goto_file_split, { desc = 'Open the file in a new split' } },
--             -- { 'n', '<C-w>gf', actions.goto_file_tab, { desc = 'Open the file in a new tabpage' } },
--             { 'n', '<localleader>f', actions.focus_files, { desc = 'Bring focus to the file panel' } },
--             { 'n', '-', actions.toggle_files, { desc = 'Toggle the file panel.' } },
--             { 'n', '<localleader>c', actions.cycle_layout, { desc = 'Cycle through available layouts.' } },
--             { 'n', '[x', actions.prev_conflict, { desc = 'In the merge-tool: jump to the previous conflict' } },
--             { 'n', ']x', actions.next_conflict, { desc = 'In the merge-tool: jump to the next conflict' } },
--             -- todo get these working
--             -- { 'n', '[X', actions.jumpto_conflict(1), { desc = 'In the merge-tool: jump to the first conflict' } },
--             -- { 'n', ']X', actions.jumpto_conflict(-1), { desc = 'In the merge-tool: jump to the last conflict' } },
--             {
--               'n',
--               '<localleader>o',
--               actions.conflict_choose 'ours',
--               { desc = 'Choose the OURS version of a conflict' },
--             },
--             {
--               'n',
--               '<localleader>O',
--               actions.conflict_choose_all 'ours',
--               { desc = 'Choose the OURS version of a conflict for the whole file' },
--             },
--             {
--               'n',
--               '<localleader>t',
--               actions.conflict_choose 'theirs',
--               { desc = 'Choose the THEIRS version of a conflict' },
--             },
--             {
--               'n',
--               '<localleader>T',
--               actions.conflict_choose_all 'theirs',
--               { desc = 'Choose the THEIRS version of a conflict for the whole file' },
--             },
--             {
--               'n',
--               '<localleader>b',
--               actions.conflict_choose 'base',
--               { desc = 'Choose the BASE version of a conflict' },
--             },
--             {
--               'n',
--               '<localleader>B',
--               actions.conflict_choose_all 'base',
--               { desc = 'Choose the BASE version of a conflict for the whole file' },
--             },
--             {
--               'n',
--               '<localleader>a',
--               actions.conflict_choose 'all',
--               { desc = 'Choose all the versions of a conflict' },
--             },
--             {
--               'n',
--               '<localleader>A',
--               actions.conflict_choose_all 'all',
--               { desc = 'Choose all the versions of a conflict for the whole file' },
--             },
--             { 'n', '<localleader>d', actions.conflict_choose 'none', { desc = 'Delete the conflict region' } },
--             {
--               'n',
--               '<localleader>D',
--               actions.conflict_choose_all 'none',
--               { desc = 'Delete the conflict region for the whole file' },
--             },
--           },
--           diff1 = {},
--           diff2 = {},
--           diff3 = {
--             -- Mappings in 3-way diff layouts
--             {
--               { 'n', 'x' },
--               '<localleader>2',
--               actions.diffget 'ours',
--               { desc = 'Obtain the diff hunk from the OURS version of the file' },
--             },
--             {
--               { 'n', 'x' },
--               '<localleader>3',
--               actions.diffget 'theirs',
--               { desc = 'Obtain the diff hunk from the THEIRS version of the file' },
--             },
--           },
--           diff4 = {
--             -- Mappings in 4-way diff layouts
--             {
--               { 'n', 'x' },
--               '<localleader>1',
--               actions.diffget 'base',
--               { desc = 'Obtain the diff hunk from the BASE version of the file' },
--             },
--             {
--               { 'n', 'x' },
--               '<localleader>2',
--               actions.diffget 'ours',
--               { desc = 'Obtain the diff hunk from the OURS version of the file' },
--             },
--             {
--               { 'n', 'x' },
--               '<localleader>3',
--               actions.diffget 'theirs',
--               { desc = 'Obtain the diff hunk from the THEIRS version of the file' },
--             },
--           },
--           file_panel = {
--             { 'n', 'j', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
--             { 'n', '<down>', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
--             { 'n', 'k', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry' } },
--             { 'n', '<up>', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry' } },
--             { 'n', '<cr>', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
--             { 'n', 'o', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
--             { 'n', 'l', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
--             { 'n', '<2-LeftMouse>', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
--             { 'n', 'h', actions.toggle_stage_entry, { desc = 'Stage / unstage the selected entry' } },
--             { 'n', 's', actions.toggle_stage_entry, { desc = 'Stage / unstage the selected entry' } },
--             { 'n', 'S', actions.stage_all, { desc = 'Stage all entries' } },
--             { 'n', 'U', actions.unstage_all, { desc = 'Unstage all entries' } },
--             { 'n', 'X', actions.restore_entry, { desc = 'Restore entry to the state on the left side' } },
--             { 'n', 'L', actions.open_commit_log, { desc = 'Open the commit log panel' } },
--             -- { 'n', 'zo', actions.open_fold, { desc = 'Expand fold' } },
--             -- { 'n', 'h', actions.close_fold, { desc = 'Collapse fold' } },
--             -- { 'n', 'zc', actions.close_fold, { desc = 'Collapse fold' } },
--             -- { 'n', 'za', actions.toggle_fold, { desc = 'Toggle fold' } },
--             -- { 'n', 'zR', actions.open_all_folds, { desc = 'Expand all folds' } },
--             -- { 'n', 'zM', actions.close_all_folds, { desc = 'Collapse all folds' } },
--             { 'n', '<c-b>', actions.scroll_view(-0.25), { desc = 'Scroll the view up' } },
--             { 'n', '<c-f>', actions.scroll_view(0.25), { desc = 'Scroll the view down' } },
--             -- { 'n', '<tab>', actions.select_next_entry, { desc = 'Open the diff for the next file' } },
--             -- { 'n', '<s-tab>', actions.select_prev_entry, { desc = 'Open the diff for the previous file' } },
--             { 'n', '[F', actions.select_first_entry, { desc = 'Open the diff for the first file' } },
--             { 'n', ']F', actions.select_last_entry, { desc = 'Open the diff for the last file' } },
--             { 'n', 'gf', actions.goto_file_edit, { desc = 'Open the file in the previous tabpage' } },
--             { 'n', '<C-w><C-f>', actions.goto_file_split, { desc = 'Open the file in a new split' } },
--             { 'n', '<C-w>gf', actions.goto_file_tab, { desc = 'Open the file in a new tabpage' } },
--             { 'n', 'i', actions.listing_style, { desc = "Toggle between 'list' and 'tree' views" } },
--             { 'n', 'f', actions.toggle_flatten_dirs, { desc = 'Flatten empty subdirectories in tree listing style' } },
--             { 'n', 'R', actions.refresh_files, { desc = 'Update stats and entries in the file list' } },
--             { 'n', '<leader>e', actions.focus_files, { desc = 'Bring focus to the file panel' } },
--             { 'n', '<leader>b', actions.toggle_files, { desc = 'Toggle the file panel' } },
--             -- { 'n', 'g<C-x>', actions.cycle_layout, { desc = 'Cycle available layouts' } },
--             { 'n', '[x', actions.prev_conflict, { desc = 'Go to the previous conflict' } },
--             { 'n', ']x', actions.next_conflict, { desc = 'Go to the next conflict' } },
--             { 'n', 'g?', actions.help 'file_panel', { desc = 'Open the help panel' } },
--             {
--               'n',
--               '<localleader>O',
--               actions.conflict_choose_all 'ours',
--               { desc = 'Choose the OURS version of a conflict for the whole file' },
--             },
--             {
--               'n',
--               '<localleader>T',
--               actions.conflict_choose_all 'theirs',
--               { desc = 'Choose the THEIRS version of a conflict for the whole file' },
--             },
--             {
--               'n',
--               '<localleader>B',
--               actions.conflict_choose_all 'base',
--               { desc = 'Choose the BASE version of a conflict for the whole file' },
--             },
--             {
--               'n',
--               '<localleader>A',
--               actions.conflict_choose_all 'all',
--               { desc = 'Choose all the versions of a conflict for the whole file' },
--             },
--             {
--               'n',
--               'dX',
--               actions.conflict_choose_all 'none',
--               { desc = 'Delete the conflict region for the whole file' },
--             },
--           },
--           file_history_panel = {
--             { 'n', 'g!', actions.options, { desc = 'Open the option panel' } },
--             { 'n', '<C-A-d>', actions.open_in_diffview, { desc = 'Open the entry under the cursor in a diffview' } },
--             { 'n', 'y', actions.copy_hash, { desc = 'Copy the commit hash of the entry under the cursor' } },
--             { 'n', 'L', actions.open_commit_log, { desc = 'Show commit details' } },
--             { 'n', 'X', actions.restore_entry, { desc = 'Restore file to the state from the selected entry' } },
--             { 'n', 'zo', actions.open_fold, { desc = 'Expand fold' } },
--             { 'n', 'zc', actions.close_fold, { desc = 'Collapse fold' } },
--             { 'n', 'h', actions.close_fold, { desc = 'Collapse fold' } },
--             { 'n', 'za', actions.toggle_fold, { desc = 'Toggle fold' } },
--             { 'n', 'zR', actions.open_all_folds, { desc = 'Expand all folds' } },
--             { 'n', 'zM', actions.close_all_folds, { desc = 'Collapse all folds' } },
--             { 'n', 'j', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
--             { 'n', '<down>', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
--             { 'n', 'k', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry' } },
--             { 'n', '<up>', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry' } },
--             { 'n', '<cr>', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
--             { 'n', 'o', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
--             { 'n', 'l', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
--             { 'n', '<2-LeftMouse>', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
--             { 'n', '<c-b>', actions.scroll_view(-0.25), { desc = 'Scroll the view up' } },
--             { 'n', '<c-f>', actions.scroll_view(0.25), { desc = 'Scroll the view down' } },
--             { 'n', '<tab>', actions.select_next_entry, { desc = 'Open the diff for the next file' } },
--             { 'n', '<s-tab>', actions.select_prev_entry, { desc = 'Open the diff for the previous file' } },
--             { 'n', '[F', actions.select_first_entry, { desc = 'Open the diff for the first file' } },
--             { 'n', ']F', actions.select_last_entry, { desc = 'Open the diff for the last file' } },
--             { 'n', 'gf', actions.goto_file_edit, { desc = 'Open the file in the previous tabpage' } },
--             { 'n', '<C-w><C-f>', actions.goto_file_split, { desc = 'Open the file in a new split' } },
--             { 'n', '<C-w>gf', actions.goto_file_tab, { desc = 'Open the file in a new tabpage' } },
--             { 'n', '<leader>e', actions.focus_files, { desc = 'Bring focus to the file panel' } },
--             { 'n', '<leader>b', actions.toggle_files, { desc = 'Toggle the file panel' } },
--             { 'n', 'g<C-x>', actions.cycle_layout, { desc = 'Cycle available layouts' } },
--             { 'n', 'g?', actions.help 'file_history_panel', { desc = 'Open the help panel' } },
--           },
--           option_panel = {
--             { 'n', '<tab>', actions.select_entry, { desc = 'Change the current option' } },
--             { 'n', 'q', actions.close, { desc = 'Close the panel' } },
--             { 'n', 'g?', actions.help 'option_panel', { desc = 'Open the help panel' } },
--           },
--         },
--       }
--     end,
--   },
-- }
