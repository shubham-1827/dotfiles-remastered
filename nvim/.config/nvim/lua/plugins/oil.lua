return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local detail = false
    require("oil").setup({
      keymaps = {
        ["q"] = "actions.close",
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            detail = not detail
            if detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
      },
    })

    --open normal oil in floating window
    vim.keymap.set("n", "<leader>--", "<cmd>Oil --float<CR>", { desc = "Open Oil in Floating Window" })

    -- Open Oil in Neovim config directory
    vim.keymap.set("n", "<leader>-n", function()
      require("oil").open("~/.config/nvim")
    end, { desc = "Open Neovim Config (Oil)" })

    -- Open Oil in project root
    vim.keymap.set("n", "<leader>-r", function()
      require("oil").open(vim.fn.getcwd())
    end, { desc = "Open Project Root (Oil)" })


  end,
}


