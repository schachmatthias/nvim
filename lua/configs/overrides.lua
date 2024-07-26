local M = {}

-- git support in nvimtree
M.nvimtree = {
  filters = {
    dotfiles = false,
    custom = { "node_modules" },
  },
  view = {
    side = "right",
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
}

return M
