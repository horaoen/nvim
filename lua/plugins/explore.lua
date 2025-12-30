return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      group_empty_dirs = true,
      scan_mode = "deep",
      bind_to_cwd = true, -- 跟随 :cd 改变根目录
    },
  },
}
