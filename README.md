[toc]

# Simple explain for my Neovim profile

this is a simple profile for neovim in archlinux

The detailed installation tutorial is here

[my notion note](https://water-crest-907.notion.site/neovim-in-archlinux-40e46fe1c5a34026856d7d5efccff834)

## plugin list

- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)
- [catppuccin/nvim](https://github.com/catppuccin/nvim)

## keymap

### telescope

```
    keyset('n', '<leader>ff', telescope.find_files, {})
    keyset('n', '<leader>fg', telescope.live_grep, {})
    keyset('n', '<leader>fb', telescope.buffers, {})
    keyset('n', '<leader>fh', telescope.help_tags, {})
```

