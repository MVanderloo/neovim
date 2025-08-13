vim.pack.add { { src = 'gh:jake-stewart/multicursor.nvim', version = '1.0' } }

local mc = require 'multicursor-nvim'
mc.setup()

vim.keymap.set({ 'n', 'x' }, '<up>', function()
  if vim.opt.hlsearch then
    mc.matchAddCursor(-1)
    vim.opt.hlsearch = true
  else
    mc.lineAddCursor(-1)
  end
end)

vim.keymap.set({ 'n', 'x' }, '<down>', function()
  if vim.opt.hlsearch then
    mc.matchAddCursor(1)
    vim.opt.hlsearch = true
  else
    mc.lineAddCursor(1)
  end
end)

-- Add and remove cursors with control + left click.
vim.keymap.set('n', '<c-leftmouse>', mc.handleMouse)
vim.keymap.set('n', '<c-leftdrag>', mc.handleMouseDrag)
vim.keymap.set('n', '<c-leftrelease>', mc.handleMouseRelease)

-- Disable and enable cursors.
vim.keymap.set({ 'n', 'x' }, '<leader>ct', mc.toggleCursor)

mc.addKeymapLayer(function(layerSet)
  layerSet({ 'n', 'x' }, '[C', mc.prevCursor)
  layerSet({ 'n', 'x' }, ']C', mc.nextCursor)
  layerSet({ 'n', 'x' }, '<leader>cd', mc.deleteCursor)
  layerSet('n', '<esc>', function()
    if not mc.cursorsEnabled() then
      mc.enableCursors()
    else
      mc.clearCursors()
    end
  end)
end)

-- Customize how cursors look.
local hl = vim.api.nvim_set_hl
hl(0, 'MultiCursorCursor', { link = 'Cursor' })
hl(0, 'MultiCursorVisual', { link = 'Visual' })
hl(0, 'MultiCursorSign', { link = 'SignColumn' })
hl(0, 'MultiCursorMatchPreview', { link = 'Search' })
hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
