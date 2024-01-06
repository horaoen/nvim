return {
  "telescope.nvim",
  dependencies = {
    -- project management
    {
      "ahmedkhalf/project.nvim",
      opts = {
        manual_mode = false,
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
        detection_methods = { "lsp", "pattern" },
      },
    },
  },
}
