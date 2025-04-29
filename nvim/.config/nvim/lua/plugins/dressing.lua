return {
  'stevearc/dressing.nvim',

config = function()
    require("dressing").setup({
      input = {
        -- Set to false to disable the vim.ui.input implementation
        enabled = true,

        -- Default prompt string
        default_prompt = "Input",

        -- Trim trailing `:` from prompt
        trim_prompt = true,

        -- Can be 'left', 'right', or 'center'
        title_pos = "left",

        -- When true, input will start in insert mode.
        start_in_insert = true,

        -- These are passed to nvim_open_win
        border = "rounded",
        -- 'editor' and 'win' will default to being centered
        relative = "cursor",

        -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        prefer_width = 40,
        width = nil,
        -- min_width and max_width can be a list of mixed types.
        -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
        max_width = { 140, 0.9 },
        min_width = { 20, 0.2 },

        buf_options = {},
        win_options = {
          -- Disable line wrapping
          wrap = false,
          list = true,
          listchars = "precedes:…,extends:…",
          sidescrolloff = 0,
        },

        mappings = {
          n = {
            ["<Esc>"] = "Close",
            ["<CR>"] = "Confirm",
          },
          i = {
            ["<C-c>"] = "Close",
            ["<CR>"] = "Confirm",
            ["<Up>"] = "HistoryPrev",
            ["<Down>"] = "HistoryNext",
          },
        },
      },
      select = {
        -- Set to false to disable the vim.ui.select implementation
        enabled = true,

        -- Priority list of preferred vim.select implementations
        backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

        -- Trim trailing `:` from prompt
        trim_prompt = true,

        -- Options for telescope selector
        telescope = require('telescope.themes').get_dropdown({}),

        },
        format_item_override = {},
        get_config = nil,
    })
  end
}
