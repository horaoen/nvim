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
