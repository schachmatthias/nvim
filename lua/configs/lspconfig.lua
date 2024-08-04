-- EXAMPL
-- local on_attach = require("nvchad.configs.lspconfig").on_attach
-- local on_init = require("nvchad.configs.lspconfig").on_init
-- local capabilities = require("nvchad.configs.lspconfig").capabilities
--
-- local lspconfig = require "lspconfig"
-- local servers = { "html", "cssls", "t" }

-- lsps with default config
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,
--   }
-- end
--
-- require'lspconfig'.volar.setup{
--             filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
--             init_options = {
--               vue = {
--                 hybridMode = false,
--               },
--               typescript = {
--                 tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
--               },
--             },
--           }
--
require'lspconfig'.tsserver.setup{
 filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
          init_options = {
            plugins = {
              {
                name = '@vue/typescript-plugin',
                location = require('mason-registry').get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server',
                languages = { 'vue' },
              },
            },
          },
          handlers = {
            -- Usually gets called after another code action
            -- https://github.com/jose-elias-alvarez/typescript.nvim/issues/17
            ['_typescript.rename'] = function(_, result)
              return result
            end,
            -- 'Go to definition' workaround
            -- https://github.com/holoiii/nvim/commit/73a4db74fe463f5064346ba63870557fedd134ad
            ['textDocument/definition'] = function(err, result, ...)
              result = vim.islist(result) and result[1] or result
              vim.lsp.handlers['textDocument/definition'](err, result, ...)
            end,
          },
        }
        --[[ cfg_lazy_lsp_servers_volar ]]
        volar = {}

require 'lspconfig'.eslint.setup {
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
    "json",
    "jsonc",
  }
}
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
