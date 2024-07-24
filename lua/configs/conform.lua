local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    javascript = { "eslint"},
    vue = {"eslint"},
    typescript = { "eslint"}
  },

  format_on_save = {
     -- These options will be passed to conform.format()
     timeout_ms = 500,
     lsp_fallback = true,
   },
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = {
    '*.tsx',
    '*.ts',
    '*.jsx',
    '*.js',
    '*.cjs',
    '*.mjs',
    '*.vue',
    '*.json',
  },
  command = 'silent! EslintFixAll',
})
}

require("conform").setup(options)

