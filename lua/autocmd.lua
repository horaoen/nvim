-- Make windows and wsl clipboard interoperable
if fn.has("wsl") then
	cmd([[
      augroup Yank
      autocmd!
      autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
      augroup END
    ]])
end

cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
