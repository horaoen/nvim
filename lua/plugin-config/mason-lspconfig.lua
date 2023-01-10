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

local exist, lspconfig = pcall(require, 'lspconfig')
if not exist then
    return
end

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
end

local exist, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not exist then
    return
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

lspconfig['rust_analyzer'].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
        ['rust-analyzer'] = {},
    },
})

lspconfig['sumneko_lua'].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
