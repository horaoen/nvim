return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({})
  end,
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>cs", "<Cmd>Lspsaga outline<CR>", desc = "outline" },
    { "<leader>fd", "<Cmd>Lspsaga finder<CR>", desc = "Lspsaga Finder" },
  },
}
