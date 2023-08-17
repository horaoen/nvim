-- global aliases
_G.fn = vim.fn
_G.cmd = vim.cmd
_G.keyset = vim.keymap.set
_G.keydel = vim.keymap.del
_G.home = os.getenv('HOME')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugin')
require('keymap')
