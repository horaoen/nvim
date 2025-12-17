return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      opts = {
        log_level = "DEBUG", -- or "TRACE"
      },
    },

    config = function()
      require("codecompanion").setup({
        interactions = {
          chat = {
            adapter = "gemini_cli",
          },
        },
        adapters = {
          acp = {
            gemini_cli = function()
              return require("codecompanion.adapters").extend("gemini_cli", {
                defaults = {
                  auth_method = "oauth-personal", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
                },
              })
            end,
          },
        },
      })
    end,
  },
}
