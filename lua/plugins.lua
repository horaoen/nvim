local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime',
    },
    {
        'catppuccin/nvim',
        lazy = false,
        priority = 1000,
        name = 'catppuccin',
        config = function()
            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = 'nvim-tree/nvim-web-devicons',
        version = 'nightly',
        config = require('plugin-config.nvim-tree'),
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function()
            require('nvim-autopairs').setup()
        end,
    },
    {
        'windwp/nvim-ts-autotag',
    },
    {
        'moll/vim-bbye',
        event = 'BufRead',
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufRead',
        config = function()
            require('indent_blankline').setup()
        end,
    },
    {
        'rcarriga/nvim-notify',
        config = require('plugin-config.nvim-notify'),
    },
    {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        version = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'ahmedkhalf/project.nvim',
            'folke/trouble.nvim',
        },
        config = function()
            require('telescope').load_extension('projects')
        end,
    },
    {
        'ahmedkhalf/project.nvim',
        config = function()
            require('project_nvim').setup({})
        end,
    },
    {
        'akinsho/toggleterm.nvim',
        config = require('plugin-config.toggleterm'),
    },
    {
        'nvim-lualine/lualine.nvim', -- statusline
        config = require('plugin-config.lualine'),
    },
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = require('plugin-config.dashboard'),
    },
    {
        'akinsho/bufferline.nvim',
        version = 'v3.*',
        event = 'BufRead',
        config = function()
            require('bufferline').setup()
        end,
    },
    {
        'numToStr/Comment.nvim',
        event = 'BufRead',
        config = function()
            require('Comment').setup({})
        end,
    },
    {
        'Pocco81/auto-save.nvim',
        event = 'BufRead',
        config = require('plugin-config.auto-save'),
    },
    {
        'ellisonleao/glow.nvim',
        config = function()
            require('glow').setup()
        end,
        cmd = 'Glow',
    },
    {
        'ahmedkhalf/project.nvim',
        config = function()
            require('project_nvim').setup({})
        end,
    },
    {
        'rmagatti/auto-session',
        config = function()
            require('auto-session').setup({
                log_level = 'error',
                auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
            })
        end,
    },
    {
        'williamboman/mason.nvim',
        config = require('plugin-config.mason'),
    },
    -- 4.1 lsp
    {
        'williamboman/mason-lspconfig.nvim',
        config = require('plugin-config.mason-lspconfig'),
    },

    {
        'neovim/nvim-lspconfig',
        evnet = 'BufRead',
        config = require('plugin-config.lsp-config'),
        dependencies = {
            'b0o/SchemaStore.nvim',
            'fidget.nvim',
        },
    },

    {
        'j-hui/fidget.nvim',
        event = 'BufRead',
        config = function()
            require('fidget').setup()
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-ts-autotag',
        },
        config = require('plugin-config.nvim-treesitter'),
    },

    {
        'glepnir/lspsaga.nvim',
        event = 'BufRead',
        version = 'main',
        config = function()
            require('lspsaga').setup()
        end,
    },

    {
        'jose-elias-alvarez/null-ls.nvim',
        event = 'BufRead',
        config = require('plugin-config.null-ls'),
    },

    {
        'onsails/lspkind-nvim',
        event = 'BufRead',
    },

    {
        'b0o/SchemaStore.nvim',
        event = 'BufRead',
    },

    -- 4.2 dap
    { 'mfussenegger/nvim-dap' },

    -- 4.3 cmp
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'onsails/lspkind.nvim',
            'hrsh7th/vim-vsnip',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        },
        config = require('plugin-config.cmp'),
    },
    -- for rust
    {
        'saecki/crates.nvim',
        version = 'v0.3.0',
        event = 'BufRead Cargo.toml',
        dependencies = { 'plenary.nvim' },
        config = require('plugin-config.crates'),
    },
    {
        'jose-elias-alvarez/typescript.nvim',
        dependencies = {
            'nvim-lspconfig',
            'cmp-nvim-lsp',
        },
        config = require('plugin-config.typescript'),
    },
    {
        'simrat39/rust-tools.nvim',
        ft = 'rust',
        dependencies = {
            'neovim/nvim-lspconfig',
        },
        config = require('plugin-config.rust-tools'),
    },
    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('todo-comments').setup({})
        end,
    },
    {
        'folke/trouble.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('trouble').setup({})
        end,
    },
})
