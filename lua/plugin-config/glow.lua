return function()
    local exist, glow = pcall(require, 'glow')
    if not exist then
        return
    end

    glow.setup({
        style = 'dark',
        width = 120,
    })
end
