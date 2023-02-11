return function()
    require('mason-lspconfig').setup({
        ensure_installed = {
            'sumneko_lua',
            'tsserver',
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
