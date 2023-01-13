local status_ok, _ = pcall(require, 'toggleterm')
if not status_ok then
    return
end

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    keyset('t', '<esc>', [[<C-\><C-n>]], opts)
    keyset('t', 'jk', [[<C-\><C-n>]], opts)
    keyset('t', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    keyset('t', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    keyset('t', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    keyset('t', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

local node = Terminal:new({ cmd = 'node', hidden = true })

function _NODE_TOGGLE()
    node:toggle()
end

local ncdu = Terminal:new({ cmd = 'ncdu', hidden = true })

function _NCDU_TOGGLE()
    ncdu:toggle()
end

local htop = Terminal:new({ cmd = 'htop', hidden = true })

function _HTOP_TOGGLE()
    htop:toggle()
end

local python = Terminal:new({ cmd = 'python', hidden = true })

function _PYTHON_TOGGLE()
    python:toggle()
end

keyset('n', '<leader>tt', '<cmd>ToggleTerm size=10 direction=horizontal<cr>', { noremap = true, silent = true })
keyset('n', '<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>', { noremap = true, silent = true })
keyset('n', '<leader>tg', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', { noremap = true, silent = true })
keyset('n', '<leader>tn', '<cmd>lua _NODE_TOGGLE()<CR>', { noremap = true, silent = true })
keyset('n', '<leader>td', '<cmd>lua _NCDU_TOGGLE()<CR>', { noremap = true, silent = true })
keyset('n', '<leader>tp', '<cmd>lua _PYTHON_TOGGLE()<CR>', { noremap = true, silent = true })
keyset('n', '<leader>th', '<cmd>lua _HTOP_TOGGLE()<CR>', { noremap = true, silent = true })
