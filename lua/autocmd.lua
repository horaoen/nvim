-- Make windows and wsl clipboard interoperable
local autocmd = vim.api.nvim_create_autocmd
autocmd('TermOpen', {
    group = myAutoGroup,
    command = 'startinsert',
})

if vim.fn.has('wsl') then
    vim.cmd([[
      augroup Yank
      autocmd!
      autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
      augroup END
    ]])
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
