-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
end

return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- closing bracket completion

        use { 'catppuccin/nvim', as = 'catppuccin' }


        -- some useful tools
        -- 1. edit  
        use 'rstacruz/vim-closer' -- closing bracket completion

        -- 2. common
        use 'rcarriga/nvim-notify'-- notify tools
end)
