local lspconfig = require "lspconfig"
local on_attach = require("nvchad.configs.lspconfig").on_attach

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
