return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {
      on_attach = "default",
      filters = {
        dotfiles = false,
        git_ignored = false,
        -- custom = { "node_modules" },
      },
      view = {
        side = "right",
        adaptive_size = true,
        relativenumber = true,
      },
      git = {
        enable = true,
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },
}
