return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
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
  'windwp/nvim-ts-autotag',
  {
    'moll/vim-bbye',
    event = 'BufRead',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = true,
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
    config = true,
  },
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end,
  },
  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    config = true,
  },
  {
    'akinsho/bufferline.nvim',
    version = 'v3.*',
    event = 'BufRead',
    config = true,
  },
  {
    'j-hui/fidget.nvim',
    branch = 'legacy',
    config = true,
  },
  {
    'numToStr/Comment.nvim',
    event = 'BufRead',
    config = true,
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
    'sindrets/diffview.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true,
  },
  {
    'glepnir/lspsaga.nvim',
    event = 'LspAttach',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      { 'nvim-treesitter/nvim-treesitter' },
    },
    config = true,
  },
  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
  },
  {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = true,
  },
  {
    'mfussenegger/nvim-jdtls',
  },
  {
    'akinsho/toggleterm.nvim',
    config = true,
  }
}
