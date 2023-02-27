return function()
    require('mason-lspconfig').setup({
        ensure_installed = {
            'lua_ls',
            'tsserver',
            'cssls',
            'dockerls',
            'emmet_ls',
            'html',
            'jsonls',
            'rust_analyzer',
            'yamlls',
            'eslint',
            'docker_compose_language_service'
        },
    })
end
