return {
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function(_, bufnr)
      require("lsp_signature").setup({
        hint_enable = false,
        toggle_key = "<M-d>",
        toggle_key_flip_floatwin_setting = true,
        fix_pos = true,
      }, bufnr)
    end,
  },

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
            end, { desc = "Lsp View runnables" })

            vim.keymap.set("n", "<Leader>lt", function()
              vim.cmd.RustLsp "testables"
            end, { desc = "Lsp View testables" })

            vim.keymap.set("n", "<Leader>lbh", function()
              vim.cmd.RustLsp { "hover", "actions" }
              vim.lsp.buf.hover()
            end, { desc = "Lsp Display hover actions and enter" })

            vim.keymap.set("n", "<Leader>lba", function()
              vim.cmd.RustLsp "codeAction"
              vim.lsp.buf.hover()
            end, { desc = "Lsp Display code actions and enter" })
          end,
        },
      }
    end,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "mrcjkb/rustaceanvim",
    },
    event = "LspAttach",
    config = function()
      vim.keymap.set("n", "<Leader>lTn", ":lua require('neotest').run.run()<CR>", { desc = "Neotest Run nearest test" })
      require("neotest").setup {
        adapters = {
          require "rustaceanvim.neotest",
        },
      }
    end,
  },
}
