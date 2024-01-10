return {
  "folke/edgy.nvim",
  opts = {
    animate = {
      enabled = false,
    },
    left = {
      {
        title = "Neo-Tree",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        pinned = true,
        open = function()
          vim.api.nvim_input("<esc><space>e")
        end,
        size = { height = 0.5 },
      },
      "neo-tree",
    },
    right = {
      {
        title = "Outline",
        ft = "sagaoutline",
        pinned = true,
        open = "Lspsata outline",
        size = { width = 0.13 },
      },
    },
  },
}
