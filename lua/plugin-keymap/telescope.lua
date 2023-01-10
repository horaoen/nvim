--telescope
local telescope_exist, telescope = pcall(require, 'telescope.builtin')
if telescope_exist then
    keyset('n', '<leader>ff', telescope.find_files, {})
    keyset('n', '<leader>fg', telescope.live_grep, {})
    keyset('n', '<leader>fb', telescope.buffers, {})
    keyset('n', '<leader>fh', telescope.help_tags, {})
end
