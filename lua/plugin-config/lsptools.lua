local lsptools_manager = {}

lsptools_manager.tools = {
    { name = "fidget", opts = {}},
    { name = "symbols-outline", opts = {} },
    { name = "nvim-treesitter.configs", opts = require("plugin-config.lsptool-opt.treesitter-opts")}
}

lsptools_manager.setup = function()
    for _, tool in pairs(lsptools_manager.tools) do
        local exist, plugin = pcall(require, tool.name)
        if exist then
            plugin.setup(tool.opts)
        end
    end
end


return lsptools_manager
