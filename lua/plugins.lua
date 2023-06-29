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
        lazy = true,
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
        'Exafunction/codeium.vim',
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
        'nvim-lualine/lualine.nvim',
        event = { 'VimEnter' },
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = require('plugin-config.lualine'),
    },
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = require('plugin-config.dashboard'),
    },
    {
        'folke/zen-mode.nvim',
        cmd = 'ZenMode',
        config = function()
            require('zen-mode').setup({})
        end,
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
        'j-hui/fidget.nvim',
        branch = 'legacy',
        config = function()
            require('fidget').setup()
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
        'kevinhwang91/nvim-ufo',
        dependencies = { 'kevinhwang91/promise-async' },
        event = 'BufRead',
        config = require('plugin-config.fold-ufo'),
    },
    {
        'sindrets/diffview.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require('diffview').setup({})
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = true,
        config = require('plugin-config.mason'),
    },
    -- 4.1 lsp
    {
        'williamboman/mason-lspconfig.nvim',
        lazy = true,
        event = 'BufRead',
        dependencies = {
            'mason.nvim',
        },
        config = require('plugin-config.mason-lspconfig'),
    },
    {
        'neovim/nvim-lspconfig',
        lazy = true,
        config = require('plugin-config.lsp-config'),
    },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = true,
        build = ':TSUpdate',
        dependencies = {
            'nvim-ts-autotag',
        },
        config = require('plugin-config.nvim-treesitter'),
    },
    {
        'glepnir/lspsaga.nvim',
        event = 'LspAttach',
        config = function()
            require('lspsaga').setup()
        end,
        dependencies = {
            { 'nvim-tree/nvim-web-devicons' },
            --Please make sure you install markdown and markdown_inline parser
            { 'nvim-treesitter/nvim-treesitter' },
        },
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        lazy = true,
        config = require('plugin-config.null-ls'),
    },
    {
        'onsails/lspkind-nvim',
        lazy = true,
    },
    {
        'b0o/SchemaStore.nvim',
        lazy = true,
    },

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
        lazy = true,
        event = 'BufRead Cargo.toml',
        dependencies = { 'plenary.nvim' },
        config = require('plugin-config.crates'),
    },
    {
        'jose-elias-alvarez/typescript.nvim',
        event = 'BufRead',
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
