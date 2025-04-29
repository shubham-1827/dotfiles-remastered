return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		-- integration of trouble with telescope
		-- local actions = require("telescope.actions")
		-- local open_with_trouble = require("trouble.sources.telescope").open
		--
		-- -- Use this to add more results without clearing the trouble list
		-- local add_to_trouble = require("trouble.sources.telescope").add

		-- Set up Telescope
		require("telescope").setup({
			defaults = {
				-- Default configuration for Telescope
				-- mappings = {
				-- 	i = {
				-- 		["<c-t>"] = open_with_trouble,
				-- 		["<c-a>"] = add_to_trouble,
				-- 	},
				-- 	n = {
				-- 		["<c-t>"] = open_with_trouble,
				-- 		["<c-a>"] = add_to_trouble,
				-- 	},
				-- },
			},
			pickers = {
				-- Default configuration for builtin pickers
			},
			extensions = {

      },
		})
	end,
}
