return function()
    local exist, treesitter = pcall(require, 'nvim-treesitter.configs')
    if not exist then
        return
    end

    treesitter.setup({
        ensure_installed = {
            'lua',
            'vim',
            'rust',
            'markdown',
            'javascript',
            'typescript',
            'yaml',
            'html',
        },
        sync_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        autotag = {
            enable = true,
        },
    })

    require('plugin-config.nvim-ts-autotag')
end
