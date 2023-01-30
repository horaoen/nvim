return function()
    require('mason-lspconfig').setup({
        ensure_installed = {
            'sumneko_lua',
            'tsserver',
            'bashls',
            'cssls',
            'dockerls',
            'emmet_ls',
            'html',
            'jsonls',
            'rust_analyzer',
            'yamlls',
        },
    })
end
