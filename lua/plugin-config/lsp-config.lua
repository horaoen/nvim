return function()
    local lspconfig = require('lspconfig')
    local on_attach = require('util.lsptool').on_attach
    local capabilities = require('util.lsptool').capabilities

    local lsp_flags = {
        debounce_text_changes = 150,
    }

    lspconfig['tsserver'].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
    })

    lspconfig['lua_ls'].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })

    lspconfig['cssls'].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })

    lspconfig['html'].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })

    lspconfig['jsonls'].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            json = {
                schemas = require('schemastore').json.schemas(),
                validate = { enable = true },
            },
        },
    })
end
