return function()
    local lspconfig = require('lspconfig')
    local on_attach = require('util.lsptool').on_attach
    local capabilities = require('util.lsptool').capabilities

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

    lspconfig['eslint'].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })

    lspconfig['cssmodules_ls'].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end
