require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<Leader>lbr", function()
  require("telescope.builtin").lsp_references()
end, { desc = "View references" })

map("n", "<Leader>lbd", function()
  require("telescope.builtin").lsp_definitions()
end, { desc = "Go-to definition" })

map("n", "<Leader>lbR", function()
  vim.lsp.buf.rename()
end, { desc = "Rename symbol" })
