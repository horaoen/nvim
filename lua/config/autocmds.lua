-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- ~/.config/nvim/lua/config/autocmds.lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.bo.tabstop = 4 -- 1个 Tab 显示为4个空格
    vim.bo.shiftwidth = 4 -- 自动缩进使用4个空格
    vim.bo.expandtab = true -- 将 Tab 转换为空格
  end,
})
