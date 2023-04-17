return function()
    local dashboard = require('alpha.themes.dashboard')
    dashboard.section.header.val = {
        [[  ||  _  _  _  _  _  _  ]],
        [[  | \/o\/_|/o\/o\/o\/ \ ]],
        [[  Ln|\_/L| \_,]_/\(L_n| ]],
        [[]],
    }
    dashboard.section.buttons.val = {
        dashboard.button('f', '  Find file', ':Telescope find_files <CR>'),
        dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('p', '  Find project', ':Telescope projects <CR>'),
        dashboard.button('r', '  Recently used files', ':Telescope oldfiles <CR>'),
        dashboard.button('t', '  Find text', ':Telescope live_grep <CR>'),
        dashboard.button('c', '  Configuration', ':e ~/.config/nvim/ <CR>'),
        dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
    }

    local function footer()
        return 'practice makes perfect'
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = 'Type'
    dashboard.section.header.opts.hl = 'Include'
    dashboard.section.buttons.opts.hl = 'Keyword'

    dashboard.opts.opts.noautocmd = true
    require('alpha').setup(dashboard.opts)
end
