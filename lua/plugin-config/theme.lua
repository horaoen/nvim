
return function()
    local setup_opts = {
        flavour = 'mocha',
        background = {
            light = 'latte',
            dark = 'mocha',
        },
        transparent_background = false,
        term_colors = false,
        dim_inactive = {
            enabled = false,
            shade = 'dark',
            percentage = 0.15,
        },
        no_italic = false,
        no_bold = false,
        styles = {
            comments = { 'italic' },
            conditionals = { 'italic' },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
            notify = true,
            mini = false,
        },
    }
    local exist, catppuccin = pcall(require, 'catppuccin')
    if not exist then
        return
    end

    catppuccin.setup(setup_opts)
    cmd.colorscheme('catppuccin')
end
