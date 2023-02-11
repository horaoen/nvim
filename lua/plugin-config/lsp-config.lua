return function()
    local lspconfig = require('lspconfig')
    local on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local lsp_flags = {
        debounce_text_changes = 150,
    }

    lspconfig['tsserver'].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
    })

    lspconfig['sumneko_lua'].setup({
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
            }
        }
    })

    lspconfig['tsserver'].setup({
        on_attach = on_attach,
        capabilities = capabilities
    })
end
