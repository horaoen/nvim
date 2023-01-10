local exist, null_ls = pcall(require, 'null-ls')

if not exist then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

return {
    debug = false,
    sources = {
        formatting.shfmt,
        formatting.rustfmt,
        formatting.stylua,
        formatting.astyle,
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

        diagnostics.eslint.with({
            prefer_local = 'node_modules/.bin',
        }),
        code_actions.eslint.with({
            prefer_local = 'node_modules/.bin',
        }),
    },

    diagnostics_format = '[#{s}] #{m}',
}
