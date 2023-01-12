local exist, crates = pcall(require, 'crates')

if not exist then
    return
end

local _, null_ls = pcall(require, 'null-ls')
crates.setup({
    null_ls = {
        enabled = true,
        name = 'crates.nvim',
    },
})
