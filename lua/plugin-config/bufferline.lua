return function()
    local exist, bufferline = pcall(require, 'bufferline')

    if not exist then
        return
    end

    bufferline.setup()
end
