return function()
    local exist, auto_save = pcall(require, 'auto-save')

    if not exist then
        return
    end

    auto_save.setup({
        trigger_events = { 'InsertLeave', 'TextChanged' },
    })
end
