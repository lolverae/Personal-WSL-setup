local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- local servers = { "html", "cssls", "gopls", "bashls", "marksman", "svelte", "eslint", "pyright", "golangci_lint_ls", "golangci-lint-langserver" }
local servers = { "html", "cssls", "gopls", "bashls", "marksman", "svelte", "eslint", "pyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

