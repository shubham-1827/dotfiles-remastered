return {
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		config = function()
			vim.g.mkdp_auto_start = 1
		end,
	},
	{
		"godlygeek/tabular",
		ft = { "markdown" },
	},
}
