local methods = vim.lsp.protocol.Methods

local M = {}

-- disable inlay hints by default
vim.g.inlay_hints = false

--- Sets up LSP keymaps and autocommands for the given buffer.
---@param client vim.lsp.Client
---@param bufnr integer
local function on_attach(client, bufnr)
  ---@param lhs string
  ---@param rhs string|function
  ---@param desc string
  ---@param mode? string|string[]
  local function keymap(lhs, rhs, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  keymap('gra', '<cmd>FzfLua lsp_code_actions<cr>', 'vim.lsp.buf.code_action()', { 'n', 'x' })

  keymap('grr', '<cmd>FzfLua lsp_references<cr>', 'vim.lsp.buf.references()')

  keymap('gy', '<cmd>FzfLua lsp_typedefs<cr>', 'Go to type definition')

  keymap('<leader>fs', '<cmd>FzfLua lsp_document_symbols<cr>', 'Document symbols')
  keymap('<leader>fS', function()
    -- Disable the grep switch header.
    require('fzf-lua').lsp_live_workspace_symbols { no_header_i = true }
  end, 'Workspace symbols')

  -- keymap('[d', function() vim.diagnostic.jump { count = -1 } end, 'Previous diagnostic')
  -- keymap(']d', function() vim.diagnostic.jump { count = 1 } end, 'Next diagnostic')
  -- keymap(
  --   '[e',
  --   function() vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.ERROR } end,
  --   'Previous error'
  -- )
  -- keymap(']e', function() vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.ERROR } end, 'Next error')

  if client:supports_method(methods.textDocument_definition) then
    keymap('gd', function() require('fzf-lua').lsp_definitions { jump1 = true } end, 'Go to definition')
    keymap('gD', function() require('fzf-lua').lsp_definitions { jump1 = false } end, 'Peek definition')
  end

  -- if client:supports_method(methods.textDocument_signatureHelp) then
  --   local blink_window = require 'blink.cmp.completion.windows.menu'
  --   local blink = require 'blink.cmp'
  --
  --   keymap('<C-k>', function()
  --     -- Close the completion menu first (if open).
  --     if blink_window.win:is_open() then blink.hide() end
  --
  --     vim.lsp.buf.signature_help()
  --   end, 'Signature help', 'i')
  -- end

  if client:supports_method(methods.textDocument_documentHighlight) then
    vim.api.nvim_create_autocmd({ 'CursorHold', 'InsertLeave' }, {
      desc = 'Highlight references under the cursor',
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'InsertEnter', 'BufLeave' }, {
      desc = 'Clear highlight references',
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end

  if client:supports_method(methods.textDocument_inlayHint) and vim.g.inlay_hints then
    -- Initial inlay hint display.
    vim.defer_fn(function()
      local mode = vim.api.nvim_get_mode().mode
      vim.lsp.inlay_hint.enable(mode == 'n' or mode == 'v', { bufnr = bufnr })
    end, 500)

    vim.api.nvim_create_autocmd('InsertEnter', {
      desc = 'Enable inlay hints',
      buffer = bufnr,
      callback = function()
        if vim.g.inlay_hints then vim.lsp.inlay_hint.enable(false, { bufnr = bufnr }) end
      end,
    })

    vim.api.nvim_create_autocmd('InsertLeave', {
      desc = 'Disable inlay hints',
      buffer = bufnr,
      callback = function()
        if vim.g.inlay_hints then vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end
      end,
    })
  end
end

---@diagnostic disable-next-line: duplicate-set-field
-- vim.lsp.buf.hover = function()
--   return vim.lsp.buf.hover {
--     max_height = math.floor(vim.o.lines * 0.5),
--     max_width = math.floor(vim.o.columns * 0.4),
--   }
-- end

---@diagnostic disable-next-line: duplicate-set-field
-- vim.lsp.buf.signature_help = function()
--   return vim.lsp.buf.signature_help {
--     max_height = math.floor(vim.o.lines * 0.5),
--     max_width = math.floor(vim.o.columns * 0.4),
--   }
-- end

-- Update mappings when registering dynamic capabilities.
-- vim.lsp.handlers[methods.client_registerCapability] = function(err, res, ctx)
--   local client = vim.lsp.get_client_by_id(ctx.client_id)
--   if not client then return end
--
--   on_attach(client, vim.api.nvim_get_current_buf())
--
--   return vim.lsp.handlers[methods.client_registerCapability](err, res, ctx)
-- end

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Configure LSP keymaps',
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then return end

    on_attach(client, args.buf)
  end,
})

-- Set up LSP servers.
-- vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
--   once = true,
--   callback = function()
--     local server_configs = vim
--       .iter(vim.api.nvim_get_runtime_file('lsp/*.lua', true))
--       :map(function(file) return vim.fn.fnamemodify(file, ':t:r') end)
--       :totable()
--     vim.lsp.enable(server_configs)
--   end,
-- })

vim.lsp.enable {
  'ruff',
  'basedpyright',
  'lua_ls',
  'rust_analyzer',
  'awk_ls',
  'bashls',
  'jsonls',
  'taplo',
  'yamlls',
  'ty',
}

return M
