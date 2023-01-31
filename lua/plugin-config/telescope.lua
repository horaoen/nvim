return function()


    telescope.setup({
        defaults = {
            mappings = {
                i = { ['<rt>'] = trouble.open_with_trouble },
                n = { ['<rt>'] = trouble.open_with_trouble },
            },
        },
    })
end
