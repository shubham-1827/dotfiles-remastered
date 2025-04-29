return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
  },
  main = "ibl",

  config = function()
    -- local h1_group = {
    --   "RainbowRed",
    --   "RainbowYellow",
    --   "RainbowBlue",
    --   "RainbowOrange",
    --   "RainbowGreen",
    --   "RainbowViolet",
    --   "RainbowCyan",
    -- }
    --
    -- local h2 = {
    --   "IndentBlanklineChar",
    -- }
    -- local hooks = require("ibl.hooks")
    -- -- create the highlight groups in the highlight setup hook, so they are reset
    -- -- every time the colorscheme changes
    -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    --   vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    --   vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    --   vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    --   vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    --   vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    --   vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    --   vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    --   vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#7c6f64" })
    -- end)
    --
    -- vim.g.rainbow_delimiters = { highlight = h1_group }
    -- require("ibl").setup({
    --  -- indent = { char = '▏' },
    --  scope = { highlight = h2, }
    -- })

    -- wo filetypes jisme ye nahi chalega,
    -- toh indentation nahi aayenge jaise ki dashboard filetype main
    require("ibl").overwrite {
      exclude = {
        filetypes = {
          "dashboard",
        }
      }
    }
    -- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
