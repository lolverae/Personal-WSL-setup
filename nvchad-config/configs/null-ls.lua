local null_ls = require "null-ls"

local b = null_ls.builtins
local autogroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- Golang
  b.formatting.gofumpt,
  b.formatting.goimports_reviser,
}

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({
      group = autogroup,
      buffer = bufnr,
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = autogroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,

}

