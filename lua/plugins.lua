local ensure_packer = function()
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
-- Use a protected call so we don't error out on first use
require('packer').startup({
    function(use)
        --[[
            ====== 1. packer can manage itself ======
        --]]
        use('wbthomason/packer.nvim')

        --[[ 
            ====== 2. outlook plugin ======
        --]]

        -- 2.1 theme
        use({
            'catppuccin/nvim',
            as = 'catppuccin',
            config = require('plugin-config.theme'),
        })

        --[[ 
            ====== 3. some useful tools ======
        --]]

        use({
            'windwp/nvim-autopairs',
            event = 'VimEnter',
            config = require('plugin-config.autopairs'),
        })

        use({ 'moll/vim-bbye', event = 'BufRead' }) -- buffer delete

        use({
            'lukas-reineke/indent-blankline.nvim',
            event = 'BufRead',
            config = require('plugin-config.indent-blankline'),
        })

        -- 3.2 common
        use({
            'rcarriga/nvim-notify', -- notify tools
            config = require('plugin-config.nvim-notify'),
        })

        use({
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly',
            config = require('plugin-config.nvim-tree'),
        })

        use({
            'nvim-telescope/telescope.nvim',
            cmd = 'Telescope',
            tag = '0.1.0',
            requires = {
                { 'nvim-lua/plenary.nvim' },
            },
        })
        use({
            'akinsho/toggleterm.nvim',
            tag = '*',
            config = require('plugin-config.toggleterm'),
        })

        use({
            'nvim-lualine/lualine.nvim', -- statusline
            config = require('plugin-config.lualine'),
        })

        use({
            'glepnir/dashboard-nvim', -- dashboard
            config = require('plugin-config.dashboard'),
        })

        use({
            'akinsho/bufferline.nvim',
            tag = 'v3.*',
            event = 'BufRead',
            config = require('plugin-config.bufferline'),
        })

        use({
            'ellisonleao/glow.nvim',
            config = require('plugin-config.glow'),
            cmd = 'Glow',
        })

        use({
            'numToStr/Comment.nvim',
            event = 'BufRead',
            config = function()
                require('Comment').setup({})
            end,
        })
        use({
            'Pocco81/auto-save.nvim',
            event = 'BufRead',
            config = require('plugin-config.auto-save'),
        })
        --[[
            ====== 4. language support ======
        --]]
        use({
            'williamboman/mason.nvim',
            config = require('plugin-config.mason'),
        })
        -- 4.1 lsp
        use({
            'williamboman/mason-lspconfig.nvim',
            config = require('plugin-config.mason-lspconfig'),
        })

        use({
            'neovim/nvim-lspconfig',
            after = { 'cmp-nvim-lsp', 'fidget.nvim' },
            config = require('plugin-config.lsp-config'),
        })

        use({
            'j-hui/fidget.nvim',
            event = 'BufAdd',
            config = require('plugin-config.fidget'),
        })
        use({
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = require('plugin-config.nvim-treesitter'),
        })

        use({
            'HiPhish/nvim-ts-rainbow2',
        })

        use({
            'glepnir/lspsaga.nvim',
            event = 'BufRead',
            branch = 'main',
            config = require('plugin-config.lspsaga'),
        })

        use({
            'jose-elias-alvarez/null-ls.nvim',
            event = 'BufRead',
            config = require('plugin-config.null-ls'),
        })

        use({
            'onsails/lspkind-nvim',
            event = 'BufAdd',
        })

        -- 4.2 dap
        use('mfussenegger/nvim-dap')

        -- 4.3 cmp
        use({
            'hrsh7th/nvim-cmp',
            after = 'lspkind-nvim',
            config = require('plugin-config.cmp'),
        })

        use({ 'hrsh7th/vim-vsnip', after = 'nvim-cmp' })
        use({ 'hrsh7th/cmp-vsnip', after = 'nvim-cmp' })
        use({ 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' })
        use({ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' })
        use({ 'hrsh7th/cmp-path', after = 'nvim-cmp' })
        use({ 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' })
        -- for rust
        use({
            'saecki/crates.nvim',
            tag = 'v0.3.0',
            after = 'null-ls.nvim',
            requires = { 'nvim-lua/plenary.nvim' },
            config = require('plugin-config.crates'),
        })

        use({
            'simrat39/rust-tools.nvim',
            after = 'nvim-lspconfig',
            config = require('plugin-config.rust-tools'),
        })

        if packer_bootstrap then
            require('packer').sync()
        end
    end,
})
