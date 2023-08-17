local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

vim.g.mapleader = " "

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
  defaults = { lazy = true, version = nil },
  install = { missing = true, colorscheme = { 'tokyonight', 'gruvbox' } },
  checker = { enabled = true },
})
