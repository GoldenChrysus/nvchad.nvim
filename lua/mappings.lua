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
end, { desc = "Go to definition" })

map("n", "<Leader>lbR", function()
  vim.lsp.buf.rename()
end, { desc = "Rename symbol" })

map("n", "<Leader>lbh", function()
  vim.lsp.buf.hover()
  vim.lsp.buf.hover()
end, { desc = "Display hover actions and enter" })

map("n", "<Leader>fw", ":Telescope workspaces<cr>", { desc = "Telescope workspaces" })
map("n", "<Leader>fl", ":Telescope live_grep<cr>", { desc = "Telescope live grep" })
map("n", "<Leader>ldw", ":Trouble workspace_diagnostics<cr>", { desc = "Trouble workspace diagnostics" })
map("n", "<Leader>ldd", ":Trouble document_diagnostics<cr>", { desc = "Trouble document diagnostics" })
