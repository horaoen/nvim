return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
    event = "BufReadPost",
    opts = {
        ensure_installed = {
            'lua',
            'java',
            'rust',
            'markdown',
            'javascript',
            'typescript',
            'yaml',
            'html',
            'tsx',
        },
        indent = {
            enable = true,
        },
        sync_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        autotag = {
            enable = true,
        },
    }
}