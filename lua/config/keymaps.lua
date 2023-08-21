-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
keyset("i", "jk", "<ESC>")
keyset("n", "<leader>w", "<cmd>w<cr>")

vim.keymap.del("n", "<leader>l")

-- just for show latex keymap key-label
local wk = require("which-key")
wk.register({
  ["<leader>l"] = {
    name = "+Latex",
    l = { "<cmd>VimtexCompile<cr>", "<Plugin>(vimtex-compile)" },
  },
})
