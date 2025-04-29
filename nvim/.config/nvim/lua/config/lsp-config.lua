local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  -- if client.server_capabilities["documentSymbolProvider"] then
  -- 	require("nvim-navic").attach(client, bufnr)
  -- end
  client.server_capabilities.documentFormattingProvider = false
end

lspconfig.lua_ls.setup({
  on_attach = on_attach,
})

lspconfig.pyright.setup({
  on_attach = on_attach,
})
lspconfig.clangd.setup({
  on_attach = on_attach,
})

-- for markdown files
require("lspconfig").marksman.setup({
  on_attach = on_attach,
})

-- for web development
lspconfig.ts_ls.setup({
  on_attach = on_attach,
})

lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "vscode-html-languageserver", "--stdio" },
  filetypes = { "html", "htm" },
  root_dir = lspconfig.util.root_pattern("package.json", ".git"),
  settings = {
    html = {
      format = { enable = true }, -- Enable formatting
      validate = true,         -- Enable validation
    },
  },
})

lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Emmet Language Server Setup
lspconfig.emmet_ls.setup({
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  filetypes = { "html", "css", "javascriptreact", "typescriptreact" }, -- Adjust filetypes as needed
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
})

-- Define the border style
local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

-- Configure hover handler
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = border,
})

-- Configure signature help handler
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = border,
})

vim.cmd([[
  highlight FloatBorder guifg=#ff0000 guibg=#1e1e1e
]])
