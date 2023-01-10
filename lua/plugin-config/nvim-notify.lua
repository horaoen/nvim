return function()
    local exist, notify = pcall(require, 'notify')

    if not exist then
        return
    end

    notify.setup({
        stages = 'fade_in_slide_out',
        timeout = 3000,
        background_color = '#ffffff',
    })
    vim.notify = notify
end
