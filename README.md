[toc]

# A brief explanation of my neovim configuration

this is a simple profile for neovim in archlinux（wsl2) and it maybe work will in other os.

Blow is  detailed installation tutorial.

[notion note](https://water-crest-907.notion.site/neovim-in-archlinux-40e46fe1c5a34026856d7d5efccff834)

## plugin list

- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)
- [catppuccin/nvim](https://github.com/catppuccin/nvim)
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [moll/vim-bbye](https://github.com/moll/vim-bbye)
- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)
- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [glepnir/dashboard-nvim](https://github.com/glepnir/dashboard-nvim)
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [glepnir/lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)
- [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim)
- [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [hrsh7th/vim-vsnip](https://github.com/hrsh7th/vim-vsnip)
- [hrsh7th/cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip)
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
- [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [saecki/crates.nvim](https://github.com/saecki/crates.nvim)
- [simrat39/rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim)
## keymap

### telescope

```
    keyset('n', '<leader>ff', telescope.find_files, {})
    keyset('n', '<leader>fg', telescope.live_grep, {})
    keyset('n', '<leader>fb', telescope.buffers, {})
    keyset('n', '<leader>fh', telescope.help_tags, {})
```

