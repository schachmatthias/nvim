require "nvchad.mappings"

--remove default mappings
local nomap = vim.keymap.del
nomap("n", "<leader>cm")
nomap("n", "<leader>b")
nomap("n", "<leader>n")
nomap("n", "<leader>v")
nomap("n", "<leader>e")
nomap("n", "<leader>ch")
nomap("n", "<leader>ma")
nomap("n", "<leader>pt")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("n", "<Leader>l", ":%s/\\r$//e<CR>", { desc = "Replace CRLF with LF" })
map("n", "<leader>T", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "New File (as buffer)" })
map("n", "<leader>cs", "<cmd>NvCheatsheet<CR>", { desc = "Cheatsheet" })

--git
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", { desc = "Git blame" })
map("n", "<leader>gB", "<cmd>Telescope git_branches<CR>", { desc = "Git branches" })
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Git diff" })

vim.keymap.set("n", "<leader>sr", function()
  local from = vim.fn.input "Search: "
  if from == "" then
    return
  end

  local to = vim.fn.input "Replace: "
  if to == "" then
    return
  end

  local cmd = table.concat({
    "rg -l",
    vim.fn.shellescape(from),
    -- exclude files:
    "--glob '!node_modules/**'",
    "--glob '!package.json'",
    "--glob '!package-lock.json'",
    "--glob '!yarn.lock'",
    "--glob '!pnpm-lock.yaml'",
    ".",
  }, " ")

  local files = vim.fn.systemlist(cmd)

  if #files == 0 then
    print "No matches found."
    return
  end

  for _, file in ipairs(files) do
    vim.cmd("silent edit " .. vim.fn.fnameescape(file))
    vim.cmd(string.format([[silent! %%s/%s/%s/ge]], from, to))
    vim.cmd "silent update"
    vim.cmd "silent bdelete"
  end

  print("Done: replaced in " .. #files .. " files.")
end, { desc = "Project Replace (excluding node_modules & lockfiles)" })
