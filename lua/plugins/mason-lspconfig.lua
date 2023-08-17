return {
  'williamboman/mason-lspconfig.nvim',
  event = "BufRead",
  opts = {
    ensure_installed = {
      'lua_ls',
      'dockerls',
      'jsonls',
      'yamlls',
      'docker_compose_language_service',
      'jdtls',
    },
  }
}
