local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- bootstrap lazy.nvim
    -- stylua: ignore
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
    spec = {
        {"LazyVim/LazyVim", import = "lazyvim.plugins"},
        {import = "lazyvim.plugins.extras.lang.json"}, -- language
        {import = "lazyvim.plugins.extras.lang.clangd"},
        {import = "lazyvim.plugins.extras.lang.cmake"},
        {import = "lazyvim.plugins.extras.lang.rust"},
        {import = "lazyvim.plugins.extras.lang.json"},
        {import = "lazyvim.plugins.extras.lang.docker"},
        {import = "lazyvim.plugins.extras.lang.markdown"},
        {import = "lazyvim.plugins.extras.lang.yaml"}, -- extras
        {import = "lazyvim.plugins.extras.util.project"},
        {import = "lazyvim.plugins.extras.ui.edgy"},
        {import = "lazyvim.plugins.extras.coding.copilot"}, -- editor
        {import = "lazyvim.plugins.extras.coding.yanky"}, {import = "plugins"}
    },
    defaults = {
        lazy = false,
        version = false -- always use the latest git commit
    },
    install = {colorscheme = {"tokyonight", "habamax"}},
    checker = {enabled = true}, -- automatically check for plugin updates
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip", -- "matchit",
                "tarPlugin", "tohtml", "tutor", "zipPlugin"
            }
        }
    }
})
