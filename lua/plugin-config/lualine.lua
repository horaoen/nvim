return function()
    local exist, lualine = pcall(require, 'lualine')
    if not exist then
        return
    end
    local material = require'lualine.themes.material'

    require('lualine').setup {
        options = { theme  = material },
    }
end
