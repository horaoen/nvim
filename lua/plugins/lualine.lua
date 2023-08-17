return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local material = require('lualine.themes.material')

    require('lualine').setup({
      options = { theme = material },
    })
  end,
}
