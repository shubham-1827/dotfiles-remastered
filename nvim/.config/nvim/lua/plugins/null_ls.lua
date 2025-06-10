return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
		"jay-babu/mason-null-ls.nvim",
	},

	config = function()
		require("mason-null-ls").setup({
			ensure_installed = {
				-- "ruff",
				-- "mypy",
				"prettier",
				"black",
				"clang_format",
				"stylua",
			},
			automatic_installation = true,
		})
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		-- Configure null-ls sources
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.prettier,
				-- null_ls.builtins.diagnostics.mypy.with({
				-- 	-- Remove or simplify the 'condition' if you want it to always run
				-- 	condition = function(utils)
				-- 		return utils.executable_exists("mypy")
				-- 	end,
				-- 	-- You might need to pass global configuration options here
				-- 	extra_args = { "--python-version", "3.10", "--ignore-missing-imports" },
				-- }),
				-- null_ls.builtins.diagnostics.ruff.with({
				-- 	condition = function(utils)
				-- 		return utils.executable_exists("ruff")
				-- end,
				-- 	-- Pass global ruff arguments if desired
				-- 	extra_args = { "--select=E,F,W,I,UP", "--line-length=88" },
				-- }),
				-- null_ls.builtins.formatting.ruff.with({
				-- 	condition = function(utils)
				-- 		return utils.executable_exists("ruff")
				-- 	end,
				-- }),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,
		})
	end,
}
