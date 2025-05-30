return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    -- integration of trouble with telescope
    local open_with_trouble = require("trouble.sources.telescope").open

    -- -- Use this to add more results without clearing the trouble list
    local add_to_trouble = require("trouble.sources.telescope").add

    -- to open the multi selected files in telescope
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    -- Custom multi-open function
    local function multi_open(prompt_bufnr)
      local picker = action_state.get_current_picker(prompt_bufnr)
      local selections = picker:get_multi_selection()

      if vim.tbl_isempty(selections) then
        actions.select_default(prompt_bufnr)
      else
        actions.close(prompt_bufnr)
        for _, entry in ipairs(selections) do
          vim.cmd("edit " .. entry.path)
        end
      end
    end

    -- Set up Telescope
    require("telescope").setup({
      defaults = {
        -- Default configuration for Telescope
        mappings = {
          i = {
            ["<c-t>"] = open_with_trouble,
            ["<c-a>"] = add_to_trouble,
            ["<C-o>"] = multi_open,
          },
          n = {
            ["<c-t>"] = open_with_trouble,
            ["<c-a>"] = add_to_trouble,
          },
        },
      },
      pickers = {
        -- Default configuration for builtin pickers
      },
      extensions = {},
    })
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
    vim.keymap.set("n", "<leader>fc", builtin.oldfiles, { desc = "[F]ind Re[C]ent Files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
    vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "[F]ind [S]ymbols (Document)" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind [W]ord Under Cursor" })
    vim.keymap.set(
      "n",
      "<leader>fr",
      require("telescope.builtin").lsp_references,
      { noremap = true, silent = true, desc = "[F]ind [R]eferences" }
    )

    vim.keymap.set("n", "<leader>fa", function()
      builtin.find_files({
        prompt_title = "All Files",
        cwd = "/",
        hidden = true,
        no_ignore = true,
        follow = true,
        find_command = {
          "rg",
          "--files",
          "--hidden",
          "--follow",
          "--no-ignore",
          "--glob",
          "!.git/*",
          "--glob",
          "!/proc/*",
          "--glob",
          "!/sys/*",
          "--glob",
          "!/dev/*",
          "--glob",
          "!/run/*",
          "--glob",
          "!/tmp/*",
          "--glob",
          "!/var/tmp/*",
        },
      })
    end, { desc = "[F]ind [A]ll Files in the System" })
  end,
}
