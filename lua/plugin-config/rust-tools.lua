return function()
    local rt = require('rust-tools')

    rt.setup({
        server = {
            on_attach = function(_, bufnr)
            end,
        },
    })
end
