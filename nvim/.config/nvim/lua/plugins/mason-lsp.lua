return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason", -- Ensure it loads commands on demand
		config = function()
			require("mason").setup({
				ensure_installed = {
					"mypy",
					"ruff",
					"pyright",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		after = "mason.nvim",
		-- config = function()
		--   local mason_lsp = require("mason-lspconfig")
		--   local lspconfig = require("lspconfig")

		--   -- 1) install & keep updated
		--   mason_lsp.setup({
		--     ensure_installed = {
		--       "lua_ls",
		--       "clangd",
		--       "pyright",
		--       "marksman",
		--       "texlab",
		--       "html",
		--       "cssls",
		--       "emmet_ls",
		--     },
		--   })

		--   -- 2) common on_attach & capabilities
		--   local on_attach = function(client, bufnr)
		--     -- your keymaps, etc.
		--   end

		--   local capabilities = vim.lsp.protocol.make_client_capabilities()
		--   capabilities.textDocument.completion.completionItem.snippetSupport = true

		--   -- 3) handler-based setup *inside* setup
		--   mason_lsp.setup({
		--     ensure_installed = {}, -- already did above; this call could be merged
		--     handlers = {
		--       -- default handler (applies to all servers)
		--       function(server_name)
		--         lspconfig[server_name].setup({
		--           on_attach = on_attach,
		--           capabilities = capabilities,
		--         })
		--       end,

		--       -- override specific servers:
		--       ["clangd"] = function()
		--         lspconfig.clangd.setup({
		--           on_attach = on_attach,
		--           capabilities = capabilities,
		--           cmd = { "clangd", "--background-index" },
		--         })
		--       end,

		--       ["lua_ls"] = function()
		--         lspconfig.lua_ls.setup({
		--           on_attach = on_attach,
		--           capabilities = capabilities,
		--           settings = {
		--             Lua = {
		--               diagnostics = { globals = { "vim" } },
		--             },
		--           },
		--         })
		--       end,
		--     },
		--   })
		-- end,
	},
	{
		"neovim/nvim-lspconfig",
		after = "mason.nvim",
		-- event = "BufEnter",
		config = function()
			-- Example: Use this inside your on_attach function
			local opt = { noremap = true, silent = true }

			-- all the other related with definition, declaration, and implementations are controlled by trouble.nvim
			-- vim.keymap.set(
			-- 	"n",
			-- 	"gr",
			-- 	vim.lsp.buf.references,
			-- 	vim.tbl_extend("force", opt, { desc = "List references" })
			-- ) -- List references
			vim.keymap.set(
				"n",
				"<leader>k",
				vim.lsp.buf.hover,
				vim.tbl_extend("force", opt, { desc = "Show hover info" })
			) -- Show hover info
			vim.keymap.set(
				"n",
				"<C-k>",
				vim.lsp.buf.signature_help,
				vim.tbl_extend("force", opt, { desc = "Signature help" })
			) -- Signature help
			vim.keymap.set(
				"n",
				"<leader>rn",
				vim.lsp.buf.rename,
				vim.tbl_extend("force", opt, { desc = "Rename symbol" })
			) -- Rename symbol
			vim.keymap.set(
				"n",
				"<leader>ca",
				vim.lsp.buf.code_action,
				vim.tbl_extend("force", opt, { desc = "Code action" })
			) -- Code action
			vim.keymap.set(
				"n",
				"<leader>e",
				vim.diagnostic.open_float,
				vim.tbl_extend("force", opt, { desc = "Show diagnostic float" })
			) -- Show diagnostic float
			vim.keymap.set("n", "<leader>fm", function()
				vim.lsp.buf.format({ async = true })
			end, vim.tbl_extend("force", opt, { desc = "Format document" })) -- Format document
		end,
	},
}
