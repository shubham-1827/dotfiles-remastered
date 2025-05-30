return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("diffview").setup({

    })

    -- Open diff view (git diff against HEAD)
    vim.keymap.set("n", "<leader>vo", "<cmd>DiffviewOpen<CR>", { desc = "Open Diffview" })

    -- Close diff view
    vim.keymap.set("n", "<leader>vc", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" })

    -- View file history
    vim.keymap.set("n", "<leader>vh", "<cmd>DiffviewFileHistory<CR>", { desc = "File History" })

    -- View project history (all files)
    vim.keymap.set("n", "<leader>vH", "<cmd>DiffviewFileHistory %<CR>", { desc = "Project History" })

    -- Toggle files panel (inside Diffview)
    vim.keymap.set("n", "<leader>vf", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle Diffview Files Panel" })

    -- Compare two commits (this needs custom args, advanced usage)
    vim.keymap.set("n", "<leader>vp", function()
      vim.cmd("DiffviewOpen HEAD~1")
    end, { desc = "Diff against previous commit" })

end

}
