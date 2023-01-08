-- manage language features, such as lsp、dap、formatter、linter、completion

return function()
    -- mason setup
    require('plugin-config.mason')

    -- lsp setup
    require('plugin-config.mason-lspconfig')

    -- dap setup
    require('plugin-config.nvim-dap')
end

