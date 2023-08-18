-- bootstrap lazy.nvim, LazyVim and your plugins
_G.fn = vim.fn
_G.cmd = vim.cmd
_G.keyset = vim.keymap.set
_G.keydel = vim.keymap.del
_G.home = os.getenv("HOME")

require("config.lazy")
