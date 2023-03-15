return function()
    local material = require('lualine.themes.material')

    require('lualine').setup({
        options = { theme = material },
    })
end
