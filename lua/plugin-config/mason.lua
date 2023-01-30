return function()
    local setup_opts = {
        log_level = vim.log.levels.INFO,
        github = {
            download_url_template = 'https://ghproxy.com/https://github.com/%s/releases/download/%s/%s',
        },
        ui = {
            icons = {
                package_installed = '✓',
                package_pending = '➜',
                package_uninstalled = '✗',
            },
            keymaps = {
                toggle_package_expand = '<CR>',
                install_package = 'i',
                update_package = 'u',
                check_package_version = 'c',
                update_all_packages = 'U',
                check_outdated_packages = 'C',
                uninstall_package = 'X',
                cancel_installation = '<C-c>',
                apply_language_filter = '<C-f>',
            },
        },
    }

    require('mason').setup(setup_opts)
end
