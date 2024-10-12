return {
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("auto-session").setup {
        {
          auto_save = true,
          suppressed_dirs = { "~/", "~/coding-projects", "~/Downloads", "/" },
        },
      }
    end,
  },
}
