require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<Leader>lbr", function()
  require("telescope.builtin").lsp_references()
end, { desc = "Lsp View references" })

map("n", "<Leader>lbd", function()
  require("telescope.builtin").lsp_definitions()
end, { desc = "Lsp Go to definition" })

map("n", "<Leader>lbR", function()
  vim.lsp.buf.rename()
end, { desc = "Lsp Rename symbol" })

map("n", "<Leader>lbh", function()
  vim.lsp.buf.hover()
  vim.lsp.buf.hover()
end, { desc = "Lsp Display hover actions and enter" })

map("n", "<Leader>fw", ":Telescope workspaces<cr>", { desc = "Telescope Find workspaces" })
map("n", "<Leader>fl", ":Telescope live_grep<cr>", { desc = "Telescope Live grep" })
map("n", "<Leader>ldw", ":Trouble workspace_diagnostics<cr>", { desc = "Trouble Workspace diagnostics" })
map("n", "<Leader>ldd", ":Trouble document_diagnostics<cr>", { desc = "Trouble Document diagnostics" })
