return {
  {
    "natecraddock/workspaces.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      require("workspaces").setup()
      require("telescope").load_extension "workspaces"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "intelephense",
        "prettier",
        "rust-analyzer",
        "typescript-language-server",
        "pyright",
        "solargraph",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "rust",
        "toml",
        "python",
        "php",
        "ruby",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      ident = { enable = true },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
    },
  },

  {
    "mg979/vim-visual-multi",
    lazy = false,
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-y>",
      }
    end,
  },
}
