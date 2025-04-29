return {
	"nvimdev/dashboard-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			-- config
			theme = "hyper",
			config = {
        header = {
          "                                              ",
          "██╗   ██╗██╗ ██████╗████████╗ ██████╗ ██████╗ ",
          "██║   ██║██║██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗",
          "██║   ██║██║██║        ██║   ██║   ██║██████╔╝",
          "╚██╗ ██╔╝██║██║        ██║   ██║   ██║██╔══██╗",
          " ╚████╔╝ ██║╚██████╗   ██║   ╚██████╔╝██║  ██║",
          "  ╚═══╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝",
          "                                              ",
          "                                              ",
        },
				-- week_header = {
				-- 	enable = true,
				-- },
				shortcut = {
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " dotfiles",
						group = "Number",
						action = "Telescope dotfiles",
						key = "d",
					},
					{
						desc = " Mason",
						group = "@property",
						action = "Mason",
						key = "m",
					},
				},
        footer = {
          "     ",
          "     ",
          "Talk is cheap, Show me the CODE",
          "By Linus Torwalds, yo you 'know' who he is...",
        }
			},
		})
    vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#ba351e' })
	end,
}
