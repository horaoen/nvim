-- manage language features, such as lsp、dap、formatter、linter、completion

-- mason setup
require('plugin-config.mason')

-- lsp setup
require('plugin-config.mason-lspconfig')
require('lsptool').setup()

-- cmp setup
require('plugin-config.cmp')
