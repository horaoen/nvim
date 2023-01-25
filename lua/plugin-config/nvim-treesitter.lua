return function()
    local exist, treesitter = pcall(require, 'nvim-treesitter.configs')
    if not exist then
        return
    end
    local exist, rainbow = pcall(require, 'ts-rainbow.strategy.global')

    if not exist then
        return
    end
    treesitter.setup({
        ensure_installed = {
            'c',
            'lua',
            'vim',
            'rust',
            'markdown',
            'javascript',
            'typescript',
            'yaml',
            'css',
            'html',
            'cpp'
        },
        sync_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    })
end
