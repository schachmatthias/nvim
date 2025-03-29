local M = {}

-- Sets colors to line numbers Above, Current and Below
function M.setup()
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F" })
  vim.api.nvim_set_hl(0, "DiagnosticError", { bg = "#000000", fg = "#FFA500" })
end

return M
