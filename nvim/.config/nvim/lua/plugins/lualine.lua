return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
    "fgheng/winbar.nvim",
  },

  config = function()
    require("lualine").setup({
      options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					"filename",
					-- {
					-- 	function()
							-- Retrieve Codeium status string
						-- 	return require("codeium.virtual_text").status_string()
						-- end,
						-- color = { fg = "#fabd2f" }, -- Gruvbox orange color
					-- },
				},
				lualine_x = {
					"encoding",
					"fileformat",
					"filetype",
					-- for displaying last line of message
					-- {
					--   require("noice").api.status.message.get_hl,
					--   cond = require("noice").api.status.message.has,
					-- },
					{
						require("noice").api.status.command.get,
						cond = require("noice").api.status.command.has,
						-- color = { fg = "#ff9e64" },
					},
					{
						require("noice").api.status.mode.get,
						cond = require("noice").api.status.mode.has,
						-- color = { fg = "#ff9e64" },
					},
					{
						require("noice").api.status.search.get,
						cond = require("noice").api.status.search.has,
						-- color = { fg = "#ff9e64" },
					},
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
		})
	end,
}
