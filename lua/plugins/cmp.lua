return {
  "saghen/blink.cmp",
  optional = true,
  specs = { "Kaiser-Yang/blink-cmp-avante" },
  opts = {
    sources = {
      default = { "avante" },
      providers = { avante = { module = "blink-cmp-avante", name = "Avante" } },
    },
  },
}
