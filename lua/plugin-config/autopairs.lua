return function()
    local exist, autopairs = pcall(require, 'nvim-autopairs')

    if exist then
        autopairs.setup()
    end
end
