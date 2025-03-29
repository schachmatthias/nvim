require("lspconfig").eslint.setup {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
    "svelte",
    "astro",
    "jsonc",
    "json",
  },
}
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {
    "*.tsx",
    "*.ts",
    "*.jsx",
    "*.js",
    "*.cjs",
    "*.mjs",
    "*.vue",
    "*.json",
  },
  command = "silent! EslintFixAll",
})

require("lspconfig").pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "W391" },
          maxLineLength = 100,
        },
      },
    },
  },
}
