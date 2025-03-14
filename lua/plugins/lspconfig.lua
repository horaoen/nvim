return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    keys[#keys + 1] = { "<leader>ca", "<cmd>Lspsaga code_action<cr>" }
    keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<cr>" }
    keys[#keys + 1] = {
      "<leader>cr",
      "<cmd>Lspsaga rename<cr>",
      desc = "Rename",
    }
    keys[#keys + 1] = {
      "gd",
      "<cmd>Lspsaga goto_definition<cr>",
      desc = "Goto Definition",
    }
    keys[#keys + 1] = {
      "gy",
      "<cmd>Lspsaga goto_type_definition<cr>",
      desc = "Goto Type Definition",
    }
  end,
  ---@class PluginLspOpts
  opts = {
    inlay_hints = { enabled = false },
    ---@type lspconfig.options
    servers = {
      jsonls = {},
      bashls = {},
      lua_ls = {
        -- mason = false, -- set to false if you don't want this server to be installed with mason
        -- Use this to add any additional keymaps
        -- for specific lsp servers
        ---@type LazyKeys[]
        -- keys = {},
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            completion = { callSnippet = "Replace" },
          },
        },
      },
    },
  },
}
