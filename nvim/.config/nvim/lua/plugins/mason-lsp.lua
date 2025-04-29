return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason", -- Ensure it loads commands on demand
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		after = "mason.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "pyright", "ts_ls", "marksman", "texlab", "html", "cssls", "emmet_ls"},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		after = "mason.nvim",
		-- event = "BufEnter",
	},
}
