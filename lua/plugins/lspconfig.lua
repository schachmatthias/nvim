return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lsp.denols"
      require "configs.lsp.eslint"
      require "configs.lsp.glsl"
      require "configs.lsp.intelephense"
      require "configs.lsp.stylelint"
      require "configs.lsp.typescript"
    end,
  },
}
