return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",   -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  version = "^1.0.0",            -- optional: only update when a new 1.x version is released
  config = function()
    vim.g.barbar_auto_setup = true

    -- Initialize Barbar
    require("barbar").setup({
      sidebar_filetypes = {
        ["neo-tree"] = true,
      },
    })

    vim.keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>", { desc = "Next Buffer" })
    vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { desc = "Previous Buffer" })
    vim.keymap.set("n", "<leader>x", "<Cmd>BufferClose<CR>", { desc = "Close Buffer" })
    vim.keymap.set(
      "n",
      "<leader>X",
      "<Cmd>BufferCloseAllButCurrentOrPinned<CR>",
      { desc = "Close all the buffers except Current or Pinned" }
    )
    vim.keymap.set("n", "<leader><", "<Cmd>BufferMovePrevious<CR>", { desc = "Move Buffer Left" })
    vim.keymap.set("n", "<leader>>", "<Cmd>BufferMoveNext<CR>", { desc = "Move Buffer Right" })
    vim.keymap.set("n", "<leader>bp", "<Cmd>BufferPick<CR>", { desc = "Pick Buffer" })
  end,
}
