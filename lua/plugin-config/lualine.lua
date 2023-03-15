return function()
    local material = require('lualine.themes.material')

    require('lualine').setup({
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'filename' },
            lualine_c = {
                -- invoke `progress` to get lsp progress status.
                require('lsp-progress').progress,
            },
        },
        options = { theme = material },
    })
end
