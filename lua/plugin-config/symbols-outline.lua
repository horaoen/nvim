return function()
    local exist, symbols = pcall(require, 'symbols-outline')
    if not exist then
        return
    end

    symbols.setup()
end
