return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        -- Open LazyGit interface
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },

        -- Open LazyGit configuration
        { "<leader>lC", "<cmd>LazyGitConfig<cr>", desc = "Open LazyGit Config" },

        -- Open LazyGit for the current file
        { "<leader>lc", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit for Current File" },

        -- Open LazyGit with commit history filter
        { "<leader>lf", "<cmd>LazyGitFilter<cr>", desc = "LazyGit with Commit Filter" },

        -- Open LazyGit with filtered history for the current file
        { "<leader>lcf", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGit Filter for Current File" },
    }
}

