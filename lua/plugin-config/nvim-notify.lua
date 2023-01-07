return function ()
    local exist, notify = pcall(require, "notify")
    
    if not exist then
        return
    end

    vim.opt.termguicolors = true

    notify.setup({
        stages = "fade_in_slide_out",
        timeout = 3000,
    })
    vim.notify = notify
end
