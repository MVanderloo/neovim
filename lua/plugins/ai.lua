return {
  -- {
  --   'Davidyz/VectorCode',
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  -- },
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'ravitemer/mcphub.nvim',
    },
    opts = {
      strategies = {
        chat = { adapter = 'ollama' },
        inline = { adapter = 'ollama' },
        cmd = { adapter = 'ollama' },
      },
      adapters = {
        ollama = function()
          return require('codecompanion.adapters').extend('ollama', {
            schema = {
              model = {
                default = 'qwen2.5-coder',
              },
            },
            env = {
              url = 'http://localhost:11434', -- local endpoint
              api_key = '', -- leave empty if not needed
            },
            headers = {
              ['Content-Type'] = 'application/json',
            },
            parameters = {
              sync = true,
            },
          })
        end,
      },
      extensions = {
        vectorcode = {
          opts = { add_tool = true },
        },
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
    },
  },
}
