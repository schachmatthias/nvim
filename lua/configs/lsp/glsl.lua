local on_attach = require("nvchad.configs.lspconfig").on_attach

require("lspconfig").glsl_analyzer.setup {
  on_attach = on_attach,
  filetypes = { "glsl" },
}
