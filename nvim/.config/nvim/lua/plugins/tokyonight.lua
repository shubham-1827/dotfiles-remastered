return {
 "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
	  style = "night",
	  transparent = true,
	  terminal_colors = true,
	  styles = {
		  keywords = { italic = true, bold = true },
		  functions = { bold = true, underline = true },
		  comments = { italic = true },
	  }
  },
}
