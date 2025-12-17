return {
  { "folke/snacks.nvim", opts = { dashboard = { enabled = false } } },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-mini/mini.icons" },
    config = function()
      local alpha = require("alpha")
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
          dashboard.button("g", " " .. " Find text", [[<cmd> lua LazyVim.pick("live_grep")() <cr>]]),
          dashboard.button("c", " " .. " Config", "<cmd> lua LazyVim.pick.config_files()() <cr>"),
          dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
          dashboard.button("x", " " .. " Lazy Extras", "<cmd> LazyExtras <cr>"),
          dashboard.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
          dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
        },
        position = "center",
      }

      theta.config.layout[6] = buttons
      alpha.setup(theta.config)
    end,
  },
}
