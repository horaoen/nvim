return function()
    require('typescript').setup({
        disable_commands = false, -- prevent the plugin from creating Vim commands
        debug = false, -- enable debug logging for commands
        go_to_source_definition = {
            fallback = true, -- fall back to standard LSP definition on failure
        },
        server = {
            handlers = {
                ['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = false,
                }),
            },
            on_attach = require('util.lsptool').on_attach,
            capabilities = require('util.lsptool').capabilities,
        },
    })
end
