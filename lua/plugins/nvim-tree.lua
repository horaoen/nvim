return {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    opts = {
        hijack_cursor = true,
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = true,
        },
        filters = {
            dotfiles = true,
        },
        renderer = {
            group_empty = true,
        },
        view = {
            width = 34,
            side = 'left',
            hide_root_folder = false,
            number = false,
            relativenumber = false,
            signcolumn = 'yes',
        },
        actions = {
            open_file = {
                resize_window = true,
                quit_on_open = true,
            },
        },
    }
}
