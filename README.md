# A brief explanation of my neovim configuration
this is a simple profile for neovim in archlinux（wsl2) and it maybe work well in other os.
Blow is  detailed installation tutorial.

[horaoen's notion note](https://water-crest-907.notion.site/neovim-in-archlinux-40e46fe1c5a34026856d7d5efccff834)

## First of all

You have to resolve network issues e.g. via proxy(global proxy) before all. I believe you can do it.

## Usage

install neovim [neovim vim install](https://github.com/neovim/neovim/wiki/Installing-Neovim)

```
$ git clone https://github.com/horaoen/nvim.git ~/.config/nvim
```
## Feature
- Fast(lazy loading)
- Centralized management of keymap for easy viewing and modification
- Comfortable rust programming environment
- The code is simple and easy for secondary development

## Structure
```
.config/nvim/
├── ftplugin
│   └── lua.lua
├── init.lua
├── lazy-lock.json
├── lua
│   ├── autocmd.lua
│   ├── global-v.lua
│   ├── keymap.lua
│   ├── options.lua
│   ├── plugin-config
│   │   ├── cmp.lua
│   │   ├── crates.lua
│   │   ├── dashboard.lua
│   │   ├── fold-ufo.lua
│   │   ├── lsp-config.lua
│   │   ├── lualine.lua
│   │   ├── mason-lspconfig.lua
│   │   ├── mason.lua
│   │   ├── null-ls.lua
│   │   ├── nvim-notify.lua
│   │   ├── nvim-tree.lua
│   │   ├── nvim-treesitter.lua
│   │   ├── nvim-ts-autotag.lua
│   │   ├── rust-tools.lua
│   │   ├── telescope.lua
│   │   ├── toggleterm.lua
│   │   └── typescript.lua
│   ├── plugins.lua
│   └── util
│       └── lsptool.lua
└── README.md
```
## Dependences

> You can use your package manager to install them. Errors may still be reported after installing them, you only need to install the default dependencies through "heckheath" command in neovim.
> You can use 'MasonInstall rustfmt'、'MasonInstall stylua' in neovim to install dependencies 3、4.
1. ripgrep
2. lazygit
3. rustfmt
4. stylua
5. eslint
6. glow

## Plugin list
- [folke/lazy.nvim](https://github.com/folke/lazy.nvim)
- [catppuccin/nvim](https://github.com/catppuccin/nvim)
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [moll/vim-bbye](https://github.com/moll/vim-bbye)
- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)
- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
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
- [ellisonleao/glow.nvim](https://github.com/ellisonleao/glow.nvim)
- [Pocco81/auto-save.nvim](https://github.com/Pocco81/auto-save.nvim)
- [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)
- [Saecki/crates.nvim](https://github.com/Saecki/crates.nvim)
- [folke/trouble.nvim](https://github.com/folke/trouble.nvim)
- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [folke/zen-mode](https://github.com/folke/zen-mode.nvim)
## Keymap

### basic

```lua
-- some basic keymap which is not related to plugins
local opts = { noremap = true, silent = true }

--Remap space as leader key
keyset('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- quit
keyset('n', '<leader>q', '<cmd>q<cr>', opts)
keyset('n', '<leader>Q', '<cmd>qa<cr>', opts)
keyset('n', '<leader>w', '<cmd>w<cr>', opts)
keyset('i', '<leader>q', '<cmd>wq<cr>', opts)
keyset('i', '<leader>Q', '<cmd>wqa<cr>', opts)
keyset('i', '<leader>w', '<cmd>w<cr>', opts)

-- Better window navigation
keyset('n', '<C-h>', '<C-w>h', opts)
keyset('n', '<C-j>', '<C-w>j', opts)
keyset('n', '<C-k>', '<C-w>k', opts)
keyset('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
keyset('n', '<C-Up>', ':resize -2<CR>', opts)
keyset('n', '<C-Down>', ':resize +2<CR>', opts)
keyset('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keyset('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers
keyset('n', '<S-l>', ':bnext<CR>', opts)
keyset('n', '<S-h>', ':bprevious<CR>', opts)

-- Move text up and down
keyset('n', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
keyset('n', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)

-- Press jk fast to enter
keyset('i', 'jk', '<ESC>', opts)

-- Stay in indent mode
keyset('v', '<', '<gv', opts)
keyset('v', '>', '>gv', opts)

-- Move text up and down
keyset('v', '<A-j>', ':m .+1<CR>==', opts)
keyset('v', '<A-k>', ':m .-2<CR>==', opts)
keyset('v', 'p', '"_dP', opts)

-- Move text up and down
keyset('x', 'J', ":move '>+1<CR>gv-gv", opts)
keyset('x', 'K', ":move '<-2<CR>gv-gv", opts)
keyset('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
keyset('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

keyset('t', '<C-h>', '<C-\\><C-N><C-w>h', { silent = true })
keyset('t', '<C-j>', '<C-\\><C-N><C-w>j', { silent = true })
keyset('t', '<C-k>', '<C-\\><C-N><C-w>k', { silent = true })
keyset('t', '<C-l>', '<C-\\><C-N><C-w>l', { silent = true })

-- format
keyset('n', '<leader>lf', ':lua vim.lsp.buf.format()<cr>', opts)

```

### telescope

```lua
    keyset('n', '<leader>ff', telescope.find_files, {})
    keyset('n', '<leader>fg', telescope.live_grep, {})
    keyset('n', '<leader>fb', telescope.buffers, {})
    keyset('n', '<leader>fh', telescope.help_tags, {})
```

### cmp

```lua
["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    }

```

### creates

```lua
keyset('n', '<leader>ct', crates.toggle, opts)
keyset('n', '<leader>cr', crates.reload, opts)

keyset('n', '<leader>cv', crates.show_versions_popup, opts)
keyset('n', '<leader>cf', crates.show_features_popup, opts)
keyset('n', '<leader>cd', crates.show_dependencies_popup, opts)

keyset('n', '<leader>cu', crates.update_crate, opts)
keyset('v', '<leader>cu', crates.update_crates, opts)
keyset('n', '<leader>ca', crates.update_all_crates, opts)
keyset('n', '<leader>cU', crates.upgrade_crate, opts)
keyset('v', '<leader>cU', crates.upgrade_crates, opts)
keyset('n', '<leader>cA', crates.upgrade_all_crates, opts)

keyset('n', '<leader>cH', crates.open_homepage, opts)
keyset('n', '<leader>cR', crates.open_repository, opts)
keyset('n', '<leader>cD', crates.open_documentation, opts)
keyset('n', '<leader>cC', crates.open_crates_io, opts)
```

### lspsaga

```lua
keyset('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', { silent = true })
keyset({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', { silent = true })
keyset('n', 'gr', '<cmd>Lspsaga rename<CR>', { silent = true })
keyset('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', { silent = true })
keyset('n', '<leader>cd', '<cmd>Lspsaga show_line_diagnostics<CR>', { silent = true })
keyset('n', '<leader>cd', '<cmd>Lspsaga show_cursor_diagnostics<CR>', { silent = true })
keyset('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { silent = true })
keyset('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', { silent = true })

keyset('n', '[E', function()
    require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

keyset('n', ']E', function()
    require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

keyset('n', '<leader>o', '<cmd>Lspsaga outline<CR>', { silent = true })
keyset('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { silent = true })
keyset('n', '<A-d>', '<cmd>Lspsaga open_floaterm<CR>', { silent = true })
keyset('n', '<A-d>', '<cmd>Lspsaga open_floaterm lazygit<CR>', { silent = true })
keyset('t', '<A-d>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
```

### nvim-bye

```lua
keyset('n', '<C-c>', '<cmd>Bdelete<cr>', opts)
```

### nvim-tree

```
keyset('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', opts)
```

### toggleterm

```lua
function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    keyset('t', '<esc>', [[<C-\><C-n>]], opts)
    keyset('t', 'jk', [[<C-\><C-n>]], opts)
    keyset('t', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    keyset('t', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    keyset('t', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    keyset('t', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

local node = Terminal:new({ cmd = 'node', hidden = true })

function _NODE_TOGGLE()
    node:toggle()
end

local ncdu = Terminal:new({ cmd = 'ncdu', hidden = true })

function _NCDU_TOGGLE()
    ncdu:toggle()
end

local htop = Terminal:new({ cmd = 'htop', hidden = true })

function _HTOP_TOGGLE()
    htop:toggle()
end

local python = Terminal:new({ cmd = 'python', hidden = true })

function _PYTHON_TOGGLE()
    python:toggle()
end

keyset('n', '<leader>tg', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', { noremap = true, silent = true })
keyset('n', '<leader>tt', '<cmd>ToggleTerm size=10 direction=horizontal<cr>', { noremap = true, silent = true })
keyset('n', '<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>', { noremap = true, silent = true })
keyset('n', '<leader>tn', '<cmd>lua _NODE_TOGGLE()<CR>', { noremap = true, silent = true })
keyset('n', '<leader>td', '<cmd>lua _NCDU_TOGGLE()<CR>', { noremap = true, silent = true })
keyset('n', '<leader>tp', '<cmd>lua _PYTHON_TOGGLE()<CR>', { noremap = true, silent = true })
keyset('n', '<leader>th', '<cmd>lua _HTOP_TOGGLE()<CR>', { noremap = true, silent = true })

```

## zen-mode

```lua
keyset('n', '<leader>z', '<cmd>ZenMode<cr>', opts)
```

