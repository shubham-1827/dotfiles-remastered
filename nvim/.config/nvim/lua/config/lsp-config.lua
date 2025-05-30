local mason_lsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  -- anything or anyfunctionality you want on attach of the lsp to the buffer
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- 3) handler-based setup *inside* setup
mason_lsp.setup({
  ensure_installed = {
    "lua_ls",
    "clangd",
    "pyright",
    "marksman",
    "texlab",
    "html",
    "cssls",
    "emmet_ls",
  },
  handlers = {
    -- default handler (applies to all servers)
    function(server_name)
      lspconfig[server_name].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,

    -- override specific servers:
    ["clangd"] = function()
      lspconfig.clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "clangd", "--background-index" },
      })
    end,

    ["lua_ls"] = function()
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })
    end,
    ["pyright"] = function()
      lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },
})
