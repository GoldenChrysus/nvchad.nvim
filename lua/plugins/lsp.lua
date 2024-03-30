return {
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = "folke/trouble.nvim",
    config = function ()
      require "configs.lspconfig"
    end
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
          end,
        },
      }
    end,
  }, 
}
