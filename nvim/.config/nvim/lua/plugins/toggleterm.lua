return {
  "akinsho/toggleterm.nvim",
  version = "*",

  config = function ()
    require("toggleterm").setup({})
    vim.keymap.set("n", "<leader>oh", "<cmd>ToggleTerm size=15 direction=horizontal<cr>", { desc = "Toggle Horizontal Terminal" })
    vim.keymap.set("n", "<leader>ov", "<cmd>ToggleTerm size=40 direction=vertical<cr>", { desc = "Toggle Vertical Terminal" })
    vim.keymap.set("n", "<leader>of", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Floating Terminal" })
    vim.keymap.set("n", "<leader>oa", "<cmd>ToggleTermToggleAll<cr>", { desc = "Toggle All Terminals" })

  end
}
