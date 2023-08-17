return {
    'jose-elias-alvarez/null-ls.nvim',
    evnet = "BufRead",
    config = function()
        local null_ls = require('null-ls')

        local formatting = null_ls.builtins.formatting

        local opts = {
            debug = false,
            sources = {
                formatting.shfmt,
                formatting.stylua,
            },
            diagnostics_format = '[#{s}] #{m}',
        }
        null_ls.setup(opts)
    end
}