return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    init = function()
      vim.o.formatexpr = [[v:lua.require("conform").formatexpr()]]
    end,
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        scss = { "prettier" },
        css = { "prettier" },
        markdown = { "prettier" },
        python = { "black" },
        php = { "phpstan" },
        -- javascript = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}
