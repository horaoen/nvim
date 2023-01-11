local exist, crates = pcall(require, 'crates')
if not exist then
    return
end

local opts = { noremap = true, silent = true }

keyset('n', '<leader>ct', crates.toggle, opts)
keyset('n', '<leader>cr', crates.reload, opts)

keyset('n', '<leader>cv', crates.show_versions_popup, opts)
keyset('n', '<leader>cf', crates.show_features_popup, opts)
keyset('n', '<leader>cd', crates.show_dependencies_popup, opts)

keyset('n', '<leader>cu', crates.update_crate, opts)
keyset('v', '<leader>cu', crates.update_crates, opts)
keyset('n', '<leader>ca', crates.update_all_crates, opts)
keyset('n', '<leader>cU', crates.upgrade_crate, opts)
keyset('v', '<leader>cU', crates.upgrade_crates, opts)
keyset('n', '<leader>cA', crates.upgrade_all_crates, opts)

keyset('n', '<leader>cH', crates.open_homepage, opts)
keyset('n', '<leader>cR', crates.open_repository, opts)
keyset('n', '<leader>cD', crates.open_documentation, opts)
keyset('n', '<leader>cC', crates.open_crates_io, opts)
