-- Make windows and wsl clipboard interoperable
local autocmd = vim.api.nvim_create_autocmd

cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

autocmd("TermOpen", {
	group = myAutoGroup,
	command = "startinsert",
})

if vim.fn.has("wsl") then
	vim.cmd([[
      augroup Yank
      autocmd!
      autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
      augroup END
    ]])
end
