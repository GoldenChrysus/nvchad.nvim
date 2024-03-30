return {
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = "folke/trouble.nvim",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = "rust",
    dependencies = {
      {
        "lvimuser/lsp-inlayhints.nvim",
        opts = {},
      },
    },
    config = function()
      vim.g.rustaceanvim = {
        inlay_hints = {
          highlight = "NonText",
        },
        server = {
          on_attach = function(client, bufnr)
            require("lsp-inlayhints").on_attach(client, bufnr)

            vim.keymap.set("n", "<Leader>lr", function()
              vim.cmd.RustLsp "runnables"
            end, { desc = "View runnables" })

            vim.keymap.set("n", "<Leader>lt", function()
              vim.cmd.RustLsp "testables"
            end, { desc = "View testables" })

            vim.keymap.set("n", "<Leader>lh", function()
              vim.cmd.RustLsp { "hover", "actions" }
              vim.lsp.buf.hover()
            end, { desc = "Display hover actions and enter" })
          end,
        },
      }
    end,
  },
}
