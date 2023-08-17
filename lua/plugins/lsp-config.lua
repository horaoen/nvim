return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'b0o/SchemaStore.nvim',
    },
    event = "BufRead",
    config = function()
        local lspconfig = require('lspconfig')
        local on_attach = require('util.lsptool').on_attach
        local capabilities = require('util.lsptool').capabilities

        local defaultSetupOptions = {
            on_attach = on_attach,
            capabilities = capabilities,
        }
        lspconfig['lua_ls'].setup(defaultSetupOptions)
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
}
