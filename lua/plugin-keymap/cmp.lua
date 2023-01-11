return function(cmp)
    return {
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    }
end
