return function()
    local exist, fidget = pcall(require, 'fidget')

    if not exist then
        return
    end

    fidget.setup({})
end
