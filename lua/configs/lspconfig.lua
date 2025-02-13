-- EXAMPL
local on_attach = require("nvchad.configs.lspconfig").on_attach
-- local on_init = require("nvchad.configs.lspconfig").on_init
-- local capabilities = require("nvchad.configs.lspconfig").capabilities
--
local lspconfig = require "lspconfig"
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
require("lspconfig").denols.setup {
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  init_options = {
    lint = true,
    unstable = true,
    suggest = {
      imports = {
        hosts = {
          ["https://deno.land"] = true,
          ["https://cdn.nest.land"] = true,
          ["https://crux.land"] = true,
        },
      },
    },
  },

  on_attach = on_attach,
}

require("lspconfig").intelephense.setup {
  on_attach = on_attach,
  filetypes = { "php" },
  cmd = { "intelephense", "--stdio" },
  settings = {
    intelephense = {
      format = {
        enable = false,
      },
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

require("lspconfig").ts_ls.setup {
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = require("mason-registry").get_package("vue-language-server"):get_install_path()
          .. "/node_modules/@vue/language-server",
        languages = { "vue" },
      },
    },
  },
  handlers = {
    -- Usually gets called after another code action
    -- https://github.com/jose-elias-alvarez/typescript.nvim/issues/17
    ["_typescript.rename"] = function(_, result)
      return result
    end,
    -- 'Go to definition' workaround
    -- https://github.com/holoiii/nvim/commit/73a4db74fe463f5064346ba63870557fedd134ad
    ["textDocument/definition"] = function(err, result, ...)
      result = vim.islist(result) and result[1] or result
      vim.lsp.handlers["textDocument/definition"](err, result, ...)
    end,
  },
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    vim.keymap.set("n", "<leader>ro", function()
      vim.lsp.buf.execute_command {
        command = "_typescript.organizeImports",
        arguments = { vim.fn.expand "%:p" },
      }
    end, { buffer = bufnr, remap = false })
  end,
  root_dir = function(filename, bufnr)
    local denoRootDir = lspconfig.util.root_pattern("deno.json", "deno.json")(filename)
    if denoRootDir then
      -- print('this seems to be a deno project; returning nil so that tsserver does not attach');
      return nil
      -- else
      -- print('this seems to be a ts project; return root dir based on package.json')
    end

    return lspconfig.util.root_pattern "package.json"(filename)
  end,
  single_file_support = false,
}
--[[ cfg_lazy_lsp_servers_volar ]]
volar = {}

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
    "json",
    "jsonc",
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

require("lspconfig").stylelint_lsp.setup {
  settings = {
    stylelintplus = {
      autoFixOnSave = true,
      validateOnSave = true,
    },
  },
}
-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F" })
end

LineNumberColors()
