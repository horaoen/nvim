return {
  "nvim-java/nvim-java",
  config = function()
    require("java").setup()
    vim.lsp.enable("jdtls")
  end,
  ft = { "java" },
  keys = {
    { "<leader>fj", "<cmd>:FzfLua lsp_live_workspace_symbols<cr>", desc = "Workspace Symbols Search" },
  },
}
