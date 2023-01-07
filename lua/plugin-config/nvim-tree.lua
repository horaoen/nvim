-- disable netrw at the very start of your init.lua (strongly advised)
local setup_opts = {
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}


return function ()
  local exist, nvim_tree = pcall(require, "nvim-tree")
  if not exist then
    return
  end

  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  -- set termguicolors to enable highlight groups
  vim.opt.termguicolors = true

  nvim_tree.setup(setup_opts)
end

