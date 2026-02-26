return {
  "nvim-java/nvim-java",
  config = false,
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          jdtls = {
            settings = {
              java = {
                format = {
                  insertSpaces = true,
                  tabSize = 4,
                },
              },
            },
          },
        },
        setup = {
          jdtls = function()
            require("java").setup({})
          end,
        },
      },
    },
  },
  keys = {
    { "<leader>fj", "<cmd>:FzfLua lsp_live_workspace_symbols<cr>", desc = "Workspace Symbols Search" },
  },
}
