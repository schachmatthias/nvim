local on_attach = require("nvchad.configs.lspconfig").on_attach
local lspconfig = require "lspconfig"

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
