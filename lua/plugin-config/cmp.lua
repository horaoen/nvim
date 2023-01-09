local exist, cmp_engine = pcall(require, 'cmp')
if not exist then
    return
end

cmp_engine.setup({
  snippet = {
    expand = function(args)
      fn["vsnip#anonymous"](args.body)
    end,
  },

  sources = cmp_engine.config.sources(
  {
    { name = "nvim_lsp" }, { name = "vsnip" },
    },
    {
            { name = "buffer" }, { name = "path" },
    }),
})

-- / 查找模式使用 buffer 源
cmp_engine.setup.cmdline("/", {
  mapping = cmp_engine.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp_engine.setup.cmdline(":", {
  mapping = cmp_engine.mapping.preset.cmdline(),
  sources = cmp_engine.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
