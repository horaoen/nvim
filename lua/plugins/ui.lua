return {
  { "folke/snacks.nvim", opts = { dashboard = { enabled = false } } },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-mini/mini.icons" },
    config = function()
      local theta = require("alpha.themes.theta")
      theta.header.val = {
        [[                   .@-               ]],
        [[         =*#@@@@@@@@@@@@@.           ]],
        [[       @@@@@@:::@@@:::@@*@@@         ]],
        [[      @@@::*@::::::::::::::@@@       ]],
        [[      @@:::::::::@%++%=:@:@:@@@@%@   ]],
        [[     -::=@:::::::::::::@::@:%***@::= ]],
        [[   ##::::::::::::::::@#%::@=++*****+*]],
        [[ #::::::::::::::::::::::::::::@***** ]],
        [[*:::::::::::::::::::::::::::::+****@ ]],
        [[:::::::::::::::::::::::::::::#****+  ]],
        [[#:::::::::::::::::::::::::::@*****@  ]],
        [[ #:::::::::::::::::::::::@********+  ]],
        [[   @:::::#:::::::::=@#***********+   ]],
        [[          ************************.  ]],
        [[         :************************@  ]],
        [[         -**++*********************  ]],
      }

      local dashboard = require("alpha.themes.dashboard")

      local buttons = {
        type = "group",
        val = {
          dashboard.button("f", " " .. " Find file", "<cmd> lua LazyVim.pick()() <cr>"),
          dashboard.button("n", " " .. " New file", [[<cmd> ene <BAR> startinsert <cr>]]),
          dashboard.button("r", " " .. " Recent files", [[<cmd> lua LazyVim.pick("oldfiles")() <cr>]]),
          dashboard.button("p", " " .. " Projects", [[<cmd> lua Snacks.picker.projects() <cr>]]),
          dashboard.button("g", " " .. " Find text", [[<cmd> lua LazyVim.pick("live_grep")() <cr>]]),
          dashboard.button("c", " " .. " Config", "<cmd> lua LazyVim.pick.config_files()() <cr>"),
          dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
          dashboard.button("x", " " .. " Lazy Extras", "<cmd> LazyExtras <cr>"),
          dashboard.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
          dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
        },
        position = "center",
      }

      local section_mru = {
        type = "group",
        val = {
          {
            type = "text",
            val = "Recent files",
            opts = {
              hl = "SpecialComment",
              shrink_margin = false,
              position = "center",
            },
          },
          { type = "padding", val = 1 },
          {
            type = "group",
            val = function()
              return { theta.mru(0, vim.fn.getcwd(), 5) }
            end,
            opts = { shrink_margin = false },
          },
        },
      }
      theta.config.layout[6] = buttons
      theta.config.layout[4] = section_mru
      theta.opts = theta.config
      require("alpha").setup(theta.config)
    end,
  },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
