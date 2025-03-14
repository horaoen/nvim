return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = { adapter = "deepseek" },
      inline = { adapter = "deepseek" },
      agent = { adapter = "deepseek" },
    },
    adapters = {
      deepseek = function()
        return require("codecompanion.adapters").extend("deepseek", {
          env = {
            api_key = "sk-5ec5c76687814aecbae2af3a9c1d1271",
          },
        })
      end,
    },
    opts = {
      log_level = "DEBUG",
    },
  },
}
