local exist, mason_lspconfig = pcall(require, "mason-lspconfig")
if not exist then
    return
end

mason_lspconfig.setup {
    ensure_installed = {
        "sumneko_lua",
        "tsserver",
        "bashls",
        "cssls",
        "dockerls",
        "emmet_ls",
        "html",
        "jsonls",
        "rust_analyzer",
        "yamlls",
    }
}

local exist, lspconfig = pcall(require, "lspconfig")
if not exist then
    return
end

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  keyset('n', 'gD', vim.lsp.buf.declaration, bufopts)
  keyset('n', 'gd', vim.lsp.buf.definition, bufopts)
  keyset('n', 'K', vim.lsp.buf.hover, bufopts)
  keyset('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  keyset('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  keyset('n', 'gi', vim.lsp.buf.implementation, bufopts)
  keyset('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  keyset('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
  keyset('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  keyset('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  keyset('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  keyset('n', 'gr', vim.lsp.buf.references, bufopts)
  keyset('n', '<space>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

lspconfig['tsserver'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
lspconfig['rust_analyzer'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
lspconfig['sumneko_lua'].setup {

}

-- lsp tools setup
require('plugin-config.lsptools').setup()

