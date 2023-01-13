return function()
    local exist, mason_lspconfig = pcall(require, 'mason-lspconfig')
    if not exist then
        return
    end

    mason_lspconfig.setup({
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
