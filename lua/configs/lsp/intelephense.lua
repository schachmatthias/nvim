local on_attach = require("nvchad.configs.lspconfig").on_attach

require("lspconfig").intelephense.setup {
  on_attach = on_attach,
  filetypes = { "php" },
  cmd = { "intelephense", "--stdio" },
  settings = {
    intelephense = {
      files = {
        maxSize = 10000000,
      },
    },
    php = {
      validate = {
        enable = true,
        autoFix = true,
      },
      suggest = {
        enable = true,
      },
    },
  },
}
