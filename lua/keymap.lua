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

keyset('n', '<C-c>', '<cmd>Bdelete<cr>', opts)

keyset('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', opts)

keyset('n', '<leader>ff', '<cmd>Telescope find_files theme=dropdown<cr>', {})
keyset('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {})
keyset('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {})
keyset('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {})
keyset('n', '<leader>fp', '<cmd>Telescope projects<cr>', {})
keyset('n', '<leader>ft', '<cmd>TodoTelescope theme=dropdown<cr>', {})
keyset('n', '<leader>fe', '<cmd>Trouble<cr>', {})

keyset('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', { silent = true })
keyset({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', { silent = true })
keyset('n', 'gr', '<cmd>Lspsaga rename<CR>', { silent = true })
keyset('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', { silent = true })
keyset('n', '<leader>da', '<cmd>Lspsaga show_cursor_diagnostics<CR>', { silent = true })
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

keyset('n', '<leader>tt', '<cmd>ToggleTerm size=17 direction=horizontal<cr>', opts)
keyset('n', '<leader>tv', '<cmd>ToggleTerm size=60 direction=vertical<cr>', opts)
keyset('n', '<leader>tf', '<cmd>ToggleTerm size=40 direction=float<cr>', opts)

keyset('n', '<leader>ct', require('crates').toggle, opts)
keyset('n', '<leader>cr', require('crates').reload, opts)

keyset('n', '<leader>cv', require('crates').show_versions_popup, opts)
keyset('n', '<leader>cf', require('crates').show_features_popup, opts)
keyset('n', '<leader>cd', require('crates').show_dependencies_popup, opts)

keyset('n', '<leader>cU', require('crates').upgrade_crate, opts)
keyset('v', '<leader>cU', require('crates').upgrade_crates, opts)
keyset('n', '<leader>cA', require('crates').upgrade_all_crates, opts)

keyset('n', '<leader>cH', require('crates').open_homepage, opts)
keyset('n', '<leader>cR', require('crates').open_repository, opts)
keyset('n', '<leader>cD', require('crates').open_documentation, opts)
keyset('n', '<leader>cC', require('crates').open_crates_io, opts)

local keymap = {}
keymap.cmp = function(cmp)
    return {
        ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<A-,>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        }),
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    }
end

return keymap
