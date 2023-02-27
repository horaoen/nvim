return function()
    local lspconfig = require('lspconfig')
    local on_attach = require('util.lsptool').on_attach
    local capabilities = require('util.lsptool').capabilities

    local defaultSetupOptions = {
        on_attach = on_attach,
        capabilities = capabilities,
    }
    lspconfig['lua_ls'].setup(defaultSetupOptions)
    lspconfig['cssls'].setup(defaultSetupOptions)
    lspconfig['html'].setup(defaultSetupOptions)
    lspconfig['eslint'].setup(defaultSetupOptions)
    lspconfig['dockerls'].setup(defaultSetupOptions)

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
