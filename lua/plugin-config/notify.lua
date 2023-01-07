local notify_opts = {
    stages = 'slides',
    timeout = 3000,
}

local found, notify = pcall(require, "notify")
if not found then
    notify("Installing notify, please restart later")
    cmd([[PackerInstall notify]])
    return
end

notify = require('notify')

notify.setup(notify_opts)