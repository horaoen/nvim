return function ()
    local saga = require('lspsaga')

    saga.init_lsp_saga()

    keyset("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

    keyset({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

    keyset("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

    keyset("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

    keyset("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

    keyset("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

    keyset("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
    keyset("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

    keyset("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end, { silent = true })
    keyset("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
    end, { silent = true })

    keyset("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })

    keyset("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

    keyset("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
    keyset("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
    -- close floaterm
    keyset("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
end