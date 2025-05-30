return {
	"folke/which-key.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"echasnovski/mini.icons",
	},
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
  config = function ()
    local wk = require("which-key")

    wk.setup({
      preset = "modern",
    })

    wk.add({
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LazyGit" },
      { "<leader>t", group = "Trouble" },
      { "<leader>f", group = "Telescope" },
      { "]", group = "[ ] Motions" },
      { "[", group = "[ ] Motions" },
      { "<leader>o", group = "ToggleTerm" },
      { "<leader>-", group = "Oil" },
      { "<leader>v", group = "Diffview" },
      { "<leader>d", group = "Debugger" },



    })
  end
}
