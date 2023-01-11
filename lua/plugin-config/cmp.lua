local exist, cmp_engine = pcall(require, 'cmp')
if not exist then
    return
end

local exist, lspkind = pcall(require, 'lspkind')
if not exist then
    return
end

cmp_engine.setup({
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        })
    },
    mapping = require('plugin-keymap.cmp')(cmp_engine),

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
        { name = 'crates' }
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
