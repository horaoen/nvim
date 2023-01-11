-- some basic keymap which is not related to plugins
local opts = { noremap = true, silent = true }

--Remap space as leader key
keyset('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- quit
keyset('n', '<leader>q', '<cmd>q<cr>', opts)
keyset('n', '<leader>Q', '<cmd>qa<cr>', opts)
keyset('n', '<leader>w', '<cmd>w<cr>', opts)
keyset('i', '<leader>q', '<cmd>wq<cr>', opts)
keyset('i', '<leader>Q', '<cmd>wqa<cr>', opts)
keyset('i', '<leader>w', '<cmd>w<cr>', opts)

-- Better window navigation
keyset('n', '<C-h>', '<C-w>h', opts)
keyset('n', '<C-j>', '<C-w>j', opts)
keyset('n', '<C-k>', '<C-w>k', opts)
keyset('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
keyset('n', '<C-Up>', ':resize -2<CR>', opts)
keyset('n', '<C-Down>', ':resize +2<CR>', opts)
keyset('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keyset('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers
keyset('n', '<S-l>', ':bnext<CR>', opts)
keyset('n', '<S-h>', ':bprevious<CR>', opts)

-- Move text up and down
keyset('n', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
keyset('n', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)

-- Press jk fast to enter
keyset('i', 'jk', '<ESC>', opts)

-- Stay in indent mode
keyset('v', '<', '<gv', opts)
keyset('v', '>', '>gv', opts)

-- Move text up and down
keyset('v', '<A-j>', ':m .+1<CR>==', opts)
keyset('v', '<A-k>', ':m .-2<CR>==', opts)
keyset('v', 'p', '"_dP', opts)

-- Move text up and down
keyset('x', 'J', ":move '>+1<CR>gv-gv", opts)
keyset('x', 'K', ":move '<-2<CR>gv-gv", opts)
keyset('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
keyset('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

keyset('t', '<C-h>', '<C-\\><C-N><C-w>h', { silent = true })
keyset('t', '<C-j>', '<C-\\><C-N><C-w>j', { silent = true })
keyset('t', '<C-k>', '<C-\\><C-N><C-w>k', { silent = true })
keyset('t', '<C-l>', '<C-\\><C-N><C-w>l', { silent = true })

-- format
keyset('n', '<leader>lf', ':lua vim.lsp.buf.format()<cr>', opts)

require('plugin-keymap.nvim-bbye')
require('plugin-keymap.nvim-tree')
require('plugin-keymap.telescope')
require('plugin-keymap.crates')
