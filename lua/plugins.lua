local ensure_packer = function()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Use a protected call so we don't error out on first use
require("packer").startup({
    function(use)
        --[[
            ====== 1. packer can manage itself ======
        --]]
        use 'wbthomason/packer.nvim'

        --[[ 
            ====== 2. outlook plugin ======
        --]]

        -- 2.1 theme
        use { 
            'catppuccin/nvim', as = 'catppuccin',
            config = require('plugin-config.theme')
        }

        --[[ 
            ====== 3. some useful tools ======
        -- ]]
        
        -- 3.1 edit
        use 'rstacruz/vim-closer' -- closing bracket completion

        -- 3.2 common
        use {
            'rcarriga/nvim-notify', -- notify tools
            config = require('plugin-config.nvim-notify')
        }

        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly',
            config = require('plugin-config.nvim-tree')
        }

        if packer_bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
})

