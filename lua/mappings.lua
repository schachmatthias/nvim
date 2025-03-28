require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("n", "<Leader>fl", ":%s/\\r$//e<CR>", { desc = "Replace CRLF with LF" })
map("n", "<leader>do", ":DiffviewOpen<CR>", { noremap = true, silent = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
