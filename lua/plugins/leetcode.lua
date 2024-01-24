local leet_args = "leet"
return {
  "kawre/leetcode.nvim",
  lazy = leet_args ~= vim.fn.argv()[1],
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim", -- optional
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    lang = "rust",
    arg = leet_args,
    directory = vim.fn.expand("~/code/leetcode"),
  },
}
