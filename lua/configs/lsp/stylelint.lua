require("lspconfig").stylelint_lsp.setup {
  settings = {
    stylelintplus = {
      autoFixOnSave = true,
      validateOnSave = true,
    },
  },
}
