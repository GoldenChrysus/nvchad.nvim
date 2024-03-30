-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local servers = { "html", "cssls", "pyright", "tsserver", "solargraph" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.intelephense.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern("composer.json", ".git", ".svn"),
}
