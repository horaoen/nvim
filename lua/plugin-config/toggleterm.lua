return function()
    local opts = {
        float_opts = {
            width = 120,
            height = 30,
        },
    }

    require('toggleterm').setup(opts)
end
