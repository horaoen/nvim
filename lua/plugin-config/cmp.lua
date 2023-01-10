local exist, cmp_engine = pcall(require, 'cmp')
if not exist then
    return
end

cmp_engine.setup({
    snippet = {
        expand = function(args)
            fn['vsnip#anonymous'](args.body)
        end,
    },

    sources = cmp_engine.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
    }),
})

cmp_engine.setup.cmdline('/', {
    mapping = cmp_engine.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

cmp_engine.setup.cmdline(':', {
    mapping = cmp_engine.mapping.preset.cmdline(),
    sources = cmp_engine.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})
