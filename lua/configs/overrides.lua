local M = {}

-- git support in nvimtree
M.nvimtree = {
  on_attach = "default",
  filters = {
    dotfiles = false,
    git_ignored = false,
    custom = { "node_modules" },
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
}

return M
