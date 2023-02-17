return function()
    local setup_opts = {
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

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('nvim-tree').setup(setup_opts)
end
