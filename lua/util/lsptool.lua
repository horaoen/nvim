local lsptool = {}

lsptool.on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
end
lsptool.capabilities = require('cmp_nvim_lsp').default_capabilities()

return lsptool
