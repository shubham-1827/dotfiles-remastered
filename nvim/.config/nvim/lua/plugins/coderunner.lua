return {
  "CRAG666/code_runner.nvim",
  event = "VeryLazy",

  config = function()
    require("code_runner").setup({
      filetype = {
        cpp = {
          "cd $dir && echo 'Compiling...' &&",
          "g++ $fileName -o $fileNameWithoutExt &&",
          "echo 'Running...' && echo '\n' &&",
          "$dir/$fileNameWithoutExt &&",
          "echo '\n' && echo 'Cleaning up...' &&",
          "if [ -f $dir/$fileNameWithoutExt ]; then rm -f $dir/$fileNameWithoutExt; fi",
        },
      },
    })
    -- Run the current file
    vim.keymap.set("n", "<leader>rr", "<cmd>RunCode<CR>", { desc = "Run Current File" })

    -- Run the current project
    vim.keymap.set("n", "<leader>rp", "<cmd>RunProject<CR>", { desc = "Run Project" })

    -- Close the runner output window
    vim.keymap.set("n", "<leader>rc", "<cmd>CloseRunner<CR>", { desc = "Close Runner" })

    -- Save and run
    vim.keymap.set("n", "<leader>rs", function()
      vim.cmd("w")  -- Save the file
      vim.cmd("RunCode")
    end, { desc = "Save and Run Code" })

    -- run the selected code, can be useful in languages like python
    vim.keymap.set("v", "<leader>re", "<cmd>RunCode<CR>", { desc = "Run Selected Code" })

  end,
}
