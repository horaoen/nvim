return function()
    local exist, indent_blankline = pcall(require, 'indent_blankline')

    if not exist then
        return
    end

    indent_blankline.setup({
        filetype_exclude = { 'dashboard' },
    })
end
