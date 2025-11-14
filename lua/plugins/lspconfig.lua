return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Store the original on_attach
      local nvlsp = require "nvchad.configs.lspconfig"
      local original_on_attach = nvlsp.on_attach

      -- Override on_attach globally to remove <Leader>D
      nvlsp.on_attach = function(client, bufnr)
        original_on_attach(client, bufnr) -- Let NvChad set up all its keymaps
        vim.keymap.del("n", "<Leader>D", { buffer = bufnr }) -- Then remove the one you don't want
      end

      -- Call defaults after overriding on_attach
      require("nvchad.configs.lspconfig").defaults()

      --my own configs
      require "configs.lsp.denols"
      require "configs.lsp.eslint"
      require "configs.lsp.glsl"
      require "configs.lsp.intelephense"
      require "configs.lsp.stylelint"
      require "configs.lsp.typescript"
    end,
  },
}
