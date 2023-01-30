return function()
    require('auto-save').setup({
        trigger_events = { 'InsertLeave', 'TextChanged' },
    })
end
