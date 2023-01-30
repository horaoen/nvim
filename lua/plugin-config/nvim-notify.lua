return function()

    local notify = require('notify')
    notify.setup({
        stages = 'fade_in_slide_out',
        timeout = 1500,
        background_color = '#ffffff',
    })

    vim.notify = notify
end
