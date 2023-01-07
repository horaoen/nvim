-- Make windows and wsl clipboard interoperable
local fn = vim.fn
local cmd = vim.cmd
if fn.has("wsl") then
	cmd([[
      augroup Yank
      autocmd!
      autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
      augroup END
    ]])
end