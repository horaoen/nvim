local lsptools_manager = {}

lsptools_manager.tools = {
    { name = 'fidget', opts = {}},
    { name = 'symbols-outline', opts = {} },
    { name = 'nvim-treesitter.configs', opts = require('lsptool.treesitter-opts')},
    { name = 'lspsaga', setup = require('lsptool.lspsaga-setup')},
    { name = 'null-ls', opts = require('lsptool.null-ls')}
}

lsptools_manager.setup = function()
    for _, tool in pairs(lsptools_manager.tools) do
        local exist, plugin = pcall(require, tool.name)
        if exist then
            if tool.setup ~= nil then
                tool.setup()
            else
                plugin.setup(tool.opts)
            end
        end
    end
end

return lsptools_manager
