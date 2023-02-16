return function()
    local null_ls = require('null-ls')

    local formatting = null_ls.builtins.formatting

    local opts = {
        debug = false,
        sources = {
            formatting.shfmt,
            formatting.rustfmt,
            formatting.stylua,
            -- frontend
            formatting.prettier.with({
                filetypes = {
                    'javascript',
                    'javascriptreact',
                    'typescript',
                    'typescriptreact',
                    'vue',
                    'css',
                    'scss',
                    'less',
                    'html',
                    'json',
                    'yaml',
                    'graphql',
                },
                extra_filetypes = { 'njk' },
                prefer_local = 'node_modules/.bin',
            }),
        },
        diagnostics_format = '[#{s}] #{m}',
    }

    null_ls.setup(opts)
end
