local treesitter_opts = {
    ensure_installed = {
        'c',
        'cpp',
        'css',
        'rust',
        'lua',
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

return treesitter_opts
