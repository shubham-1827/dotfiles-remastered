return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    vim.keymap.set("n", "<leader>ht", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Harpoon: Toggle quick menu" })

    vim.keymap.set("n", "<leader>a", function()
      require("harpoon"):list():add()
    end, { desc = "Harpoon: Add file" })

    vim.keymap.set("n", "<leader>hp", function()
      require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
    end, { desc = "Harpoon: Toggle quick menu" })

    vim.keymap.set("n", "<leader>1", function()
      require("harpoon"):list():select(1)
    end, { desc = "Harpoon: Goto file 1" })

    vim.keymap.set("n", "<leader>2", function()
      require("harpoon"):list():select(2)
    end, { desc = "Harpoon: Goto file 2" })

    vim.keymap.set("n", "<leader>3", function()
      require("harpoon"):list():select(3)
    end, { desc = "Harpoon: Goto file 3" })

    vim.keymap.set("n", "<leader>4", function()
      require("harpoon"):list():select(4)
    end, { desc = "Harpoon: Goto file 4" })

    vim.keymap.set("n", "<leader>5", function()
      require("harpoon"):list():select(5)
    end, { desc = "Harpoon: Goto file 5" })

    vim.keymap.set("n", "<leader>6", function()
      require("harpoon"):list():select(6)
    end, { desc = "Harpoon: Goto file 6" })

  end,
}
